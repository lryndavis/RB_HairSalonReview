require('spec_helper')

describe(Stylist) do
  describe(".all") do
     it("is empty at first") do
       expect(Stylist.all()).to(eq([]))
     end
   end

  describe("#==") do
     it("is the same stylist if it has the same name") do
       stylist_1 = Stylist.new({:id => nil, :name => "Sherman Dog"})
       stylist_2 = Stylist.new({:id => nil, :name => "Sherman Dog"})
       expect(stylist_1).to(eq(stylist_2))
     end
   end

   describe('#save') do
     it("adds a stylist to the array of saved stylists") do
       test_stylist = Stylist.new({:id => nil, :name => "Sherman Dog"})
       test_stylist.save()
       expect(Stylist.all()).to(eq([test_stylist]))
     end
   end

   describe('.find') do
     it('returns a stylist by their ID') do
       test_stylist1 = Stylist.new({:id => nil, :name => "Sherman Dog"})
       test_stylist1.save()
       test_stylist2 = Stylist.new({:id => nil, :name => "Damien Cat"})
       test_stylist2.save()
       expect(Stylist.find(test_stylist2.id())).to(eq(test_stylist2))
     end
   end

   describe('#update') do
     it('allows for stylist updates in the database') do
       test_stylist = Stylist.new({:id => nil, :name => "Sherman Dog"})
       test_stylist.save()
       test_stylist.update({:name => "Damien Cat"})
       expect(test_stylist.name()).to(eq("Damien Cat"))
     end
   end

   describe('#delete') do
     it("deletes a stylist from the database") do
       test_stylist1 = Stylist.new({:id => nil, :name => "Sherman Dog"})
       test_stylist1.save()
       test_stylist2 = Stylist.new({:id => nil, :name => "Damien Cat"})
       test_stylist2.save()
       test_stylist1.delete()
       expect(Stylist.all()).to(eq([test_stylist2]))
     end
   end

   describe("#find_clients") do
    it("returns an array of clients for a particular stylist") do
      test_stylist = Stylist.new({:id => nil, :name => "Sherman Dog", :id => nil})
      test_stylist.save()
      test_client = Client.new({:id => nil, :name => "Damien Cat", :stylist_id => test_stylist.id()})
      test_client.save()
      test_client2 = Client.new({:id => nil, :name => "Evie Dog", :stylist_id => test_stylist.id()})
      test_client2.save()
      expect(test_stylist.find_clients()).to(eq([test_client, test_client2]))
    end
  end
end
