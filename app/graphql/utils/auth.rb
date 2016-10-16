module Auth
  class Unauthenticated < StandardError; end

  def self.authenticate_user!(lambda)
    -> (*args) do
      ctx = args.last
      raise Unauthenticated unless ctx[:current_user]
      lambda.call(*args)
    end
  end
end
