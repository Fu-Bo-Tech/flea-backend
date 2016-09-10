AllGoodsConnectionType = GoodType.define_connection do
  field :totalCount do
    type types.Int
    description 'number of goods in store'
    resolve -> (_, _, _) { Good.count }
  end

  field :goods do
    type types[GoodType]
    description 'all goods'
    resolve -> (obj, _, _) do 
      obj.nodes
    end
  end
end
