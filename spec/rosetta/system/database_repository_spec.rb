# frozen_string_literal: true

require 'spec_helper'

describe 'Onesky repository', type: :system do
  before { visit database_samples_path }

  scenario 'show the translations in yml file', js: true do
    find('.open-phrases-menu-btn').click

    within '.phrases-menu' do
      expect(page).to have_content 'samples.index.hello'
      expect(page).to have_content 'Hello world!'

      expect(page).to have_content 'common.text'
      expect(page).to have_content 'A common text'
    end
  end

  scenario 'show the translations in yml file', js: true do
    find('.open-phrases-menu-btn').click

    within '.phrases-menu' do
      fill_in 'samples.index.hello_value', with: 'Hello DB!'
      click_on 'samples.index.hello_submit'
    end

    find('.open-phrases-menu-btn').click
    within '.phrases-menu' do
      expect(page).to have_content 'samples.index.hello'
      expect(page).to_not have_content 'Hello world!'
      expect(page).to have_content 'Hello DB!'
    end
  end
end
