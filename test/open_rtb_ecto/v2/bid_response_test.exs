defmodule OpenRtbEcto.V2.BidResponseTest do
  use OpenRtbEcto.OpenRtbCase, async: true

  alias OpenRtbEcto.V2.BidResponse

  test "mobile" do
    data = test_data("v2/response", "mobile.json")
    assert {:ok, %BidResponse{seatbid: [%{bid: [bid]}]}} = OpenRtbEcto.cast(BidResponse, data)
    assert bid.id == "1"
    assert bid.impid == "1"
    assert bid.price == 0.751371
    assert bid.adid == "52a5516d29e435137c6f6e74"
    assert bid.nurl == "http://ads.com/win/112770_1386565997?won=${AUCTION_PRICE}"

    assert bid.adm ==
             "<a href=\"http://ads.com/click/112770_1386565997\"><img src=\"http://ads.com/img/112770_1386565997?won=${AUCTION_PRICE}\" width=\"728\" height=\"90\" border=\"0\" alt=\"Advertisement\" /></a>"

    assert bid.adomain == ["ads.com"]
    assert bid.iurl == "http://ads.com/112770_1386565997.jpeg"
    assert bid.cid == "52a5516d29e435137c6f6e74"
    assert bid.crid == "52a5516d29e435137c6f6e74_1386565997"
    assert bid.attr == []
  end

  test "single vast response" do
    data = test_data("v2/response", "vast.json")
    assert {:ok, %BidResponse{} = req} = OpenRtbEcto.cast(BidResponse, data)
  end

  test "multi vast response" do
    # https://github.com/openrtb/examples/blob/master/spotxchange/example-video-response-multiple_vast_inline_simple.md
    data = test_data("v2/response", "multi-vast.json")
    assert {:ok, %BidResponse{seatbid: seatbids}} = OpenRtbEcto.cast(BidResponse, data)
    assert length(seatbids) == 3
  end
end
