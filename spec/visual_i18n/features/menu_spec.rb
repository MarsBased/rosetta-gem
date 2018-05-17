require 'spec_helper'

feature 'Translations menu' do
  before { visit local_samples_path }

  scenario 'open the menu', js: true do
    find('.open-phrases-menu-btn').click

    expect(page).to have_selector '.phrases-menu.open'
    within '.phrases-menu' do
      expect(page).to have_content 'Repository Local'
    end
  end

  scenario 'close the menu', js: true do
    find('.open-phrases-menu-btn').click
    find('.phrases-menu__closebtn').click

    expect(page).to_not have_selector '.phrases-menu.open'
  end
end
