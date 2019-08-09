require 'rails_helper'

feature 'Purchase flow', js: true do
  let!(:shipping_type) { ShippingType.create!(name: "Poczta polska", cost: 1) }
  let!(:product) do
    Product.create!(
      category: Category.create!(name: "Test category"),
      name: "Test product",
      price: "10",
      description: "A description of test product"
    )
  end

  scenario "placing an order" do
    visit root_path
    click_link "Test category"
    click_link "Test product"
    click_link "Dodaj do koszyka"
    expect(page).to have_content("Dodano produkt do koszyka")
    find("a.link-to-cart").click
    expect(page).to have_content("Twój koszyk")

    click_link "Przejdź dalej"

    fill_in "Email", with: "test@test.com"
    fill_in "First name", with: "First"
    fill_in "Last name", with: "Last"
    fill_in "City", with: "Arcadia"
    fill_in "Zip code", with: "11111"
    fill_in "Street", with: "Rolling hills"
    click_button "Zapisz i przejdź dalej"

    expect(page).to have_content("Potwierdź zamówienie")
    expect { click_link "Potwierdzam zamówienie z obowiązkiem zapłaty" }.to change { ActionMailer::Base.deliveries.size }.by(1)

    expect(page).to have_content("Dziękujemy za zamówienie!")
  end
end
