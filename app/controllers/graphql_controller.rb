class GraphqlController < ApplicationController
  before_action :graphql_setup
  before_action :error_hanlder_setup
  def create
    query_string = params[:query]
    query_variables = ensure_hash(params[:variables])
    result = SiteSchema.execute(query_string, variables: query_variables)
    render json: result
  end

  private

  def graphql_setup
    # Then hook up that callable to `.define`:
    GraphQL::ObjectType.accepts_definitions(camelized_field: CamelizedField)
    GraphQL::InterfaceType.accepts_definitions(camelized_field: CamelizedField)
    SiteSchema.node_identification = NodeIdentification
  end

  def error_hanlder_setup
    SiteSchema.rescue_from(ActiveRecord::RecordNotFound, &:message)
    SiteSchema.rescue_from(ActiveRecord::RecordInvalid) { |e| e.record.errors }
    SiteSchema.rescue_from(StandardError, &:message)
  end

  def ensure_hash(query_variables)
    if query_variables.blank?
      {}
    elsif query_variables.is_a?(String)
      JSON.parse(query_variables)
    else
      query_variables
    end
  end
end
