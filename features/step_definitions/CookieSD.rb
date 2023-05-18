Given("The user accept the cookies") do
  @cookie = CookieBannerPom.new(@driver)
  @cookie.accept_all
end