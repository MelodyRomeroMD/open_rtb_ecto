defmodule OpenRtbEcto.V2.BidRequest.Segment do
  @moduledoc """
  Segment objects are essentially key-value pairs that convey specific units of data. The parent Data
  object is a collection of such values from a given data provider. The specific segment names and value
  options must be published by the exchange a priori to its bidders.
  """

  use Ecto.Schema
  import Ecto.Changeset

  @primary_key false
  embedded_schema do
    field(:id)
    field(:name)
    field(:value)
    field(:ext, :map)
  end

  #
  def changeset(producer, attrs \\ %{}) do
    producer
    |> cast(attrs, [:id, :name, :value, :ext])
  end
end
