require 'spec_helper'

feature 'Translations menu' do
  before { visit local_samples_path }

    scenario 'open the menu', js: true do
    find('.open-phrases-menu-btn').click

  end
end
