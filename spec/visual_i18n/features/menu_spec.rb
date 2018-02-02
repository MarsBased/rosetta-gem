feature 'Show menu' do
  before { visit root_path }

  scenario 'with page translations', js: true do
    find('.open-phrases-menu-btn').click

    expect(page).to have_selector '.phrases-menu.open'
    within '.phrases-menu' do
      expect(page).to have_content 'Hello world!'
    end
  end
end
