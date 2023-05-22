Given("The user accept the cookies") do
  @cookie = CookieBannerPom.new(page)
  @cookie.accept_all
end