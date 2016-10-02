BiddingsConnectionType = BiddingType.define_connection do
  field :totalCount do
    type types.Int
    description 'number of biddings in store'
    resolve -> (obj, _, _) { obj.nodes.count }
  end

  field :biddings do
    type types[BiddingType]
    description 'all biddings'
    resolve -> (obj, _, _) do
      obj.edge_nodes
    end
  end
end
