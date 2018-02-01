feature 'Show menu' do
  before { visit root_path }

  scenario 'with page translations', js: true do
    find('.open-translations-btn').click

    expect(page).to have_selector '.phrases-menu.open'
    expect(page).to have_content 'Hello world!!'
  end
end
