defmodule OpenRtbEcto.V2.BidRequest.Source do
  @moduledoc """
  This object describes the nature and behavior of the entity that is the source of the bid request
  upstream from the exchange. The primary purpose of this object is to define post-auction or
  upstream decisioning when the exchange itself does not control the final decision. A common
  example of this is header bidding, but it can also apply to upstream server entities such as
  another RTB exchange, a mediation platform, or an ad server combines direct campaigns with 3rd
  party demand in decisioning.
  """

  use Ecto.Schema
  import Ecto.Changeset

  alias OpenRtbEcto.Types.TinyInt

  @type t :: %__MODULE__{}

  @primary_key false
  embedded_schema do
    field(:fd, TinyInt)
    field(:tid)
    field(:pchain)
    field(:ext, :map, default: %{})
  end

  def changeset(source, attrs \\ %{}) do
    source
    |> cast(attrs, [:fd, :tid, :pchain, :ext])
  end
end
