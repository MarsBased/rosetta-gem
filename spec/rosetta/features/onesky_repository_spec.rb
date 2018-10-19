# frozen_string_literal: true

require 'spec_helper'

feature 'Onesky repository' do
  before do
    ENV['ONESKY_PROJECT_ID'] = '123'
    ENV['ONESKY_SUBDOMAIN'] = 'foo'
  end
  before { visit onesky_samples_path }

  scenario 'show the translations', js: true do
    find('.open-phrases-menu-btn').click

    within '.phrases-menu' do
      expect(page).to have_content 'Hello world!'
      expect(page).to have_content 'samples.index.hello'
      expect(page).to have_link(href:
        'https://foo.oneskyapp.com/collaboration/translate/project/project/123/language/1#/?keyword=samples.index.hello')
    end
  end
end
