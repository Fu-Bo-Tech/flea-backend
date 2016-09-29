GoodsConnectionType = GoodType.define_connection do
  field :totalCount do
    type types.Int
    description 'number of goods in store'
    resolve -> (obj, _, _) { obj.nodes.count }
  end

  field :goods do
    type types[GoodType]
    description 'all goods'
    resolve -> (obj, _, _) do
      obj.edge_nodes
    end
  end
end
