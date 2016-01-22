require('spec_helper')

describe(Client) do
  describe(".all") do
     it("is empty at first") do
       expect(Client.all()).to(eq([]))
     end
   end

  describe("#==") do
    it("is the same client if it has the same name") do
      client_1 = Client.new({:id => nil, :name => "Sherman Dog", :stylist_id => 1})
      client_2 = Client.new({:id => nil, :name => "Sherman Dog", :stylist_id => 1})
      expect(client_1).to(eq(client_2))
    end
  end

  describe('#save') do
    it("adds a client to the array of saved clients") do
      test_client = Client.new({:id => nil, :name => "Sherman Dog", :stylist_id => 1})
      test_client.save()
      expect(Client.all()).to(eq([test_client]))
    end
  end

  describe('.find') do
    it('returns a client by their ID') do
      test_client1 = Client.new({:id => nil, :name => "Sherman Dog", :stylist_id => 1})
      test_client1.save()
      test_client2 = Client.new({:id => nil, :name => "Damien Cat", :stylist_id => 1})
      test_client2.save()
      expect(Client.find(test_client2.id())).to(eq(test_client2))
    end
  end

  describe('#update') do
    it('allows for client updates in the database') do
      test_client = Client.new({:id => nil, :name => "Sherman Dog", :stylist_id => 1})
      test_client.save()
      test_client.update({:name => "Damien"})
      expect(test_client.name()).to(eq("Damien"))
    end
  end

  describe('#delete') do
    it("deletes a client from the database") do
      test_client1 = Client.new({:id => nil, :name => "Sherman Dog", :stylist_id => 1})
      test_client1.save()
      test_client2 = Client.new({:id => nil, :name => "Damien Cat", :stylist_id => 1})
      test_client2.save()
      test_client1.delete()
      expect(Client.all()).to(eq([test_client2]))
    end
  end
end
