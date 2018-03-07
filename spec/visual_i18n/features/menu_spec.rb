feature 'Show menu' do
  before { visit root_path }

  context 'Local repository' do
    scenario 'with page translations', js: true do
      find('.open-phrases-menu-btn').click

      expect(page).to have_selector '.phrases-menu.open'
      within '.phrases-menu' do
        expect(page).to have_content 'Hello world!'
        expect(page).to have_content 'Repository Local'
      end
    end
  end
end
