# frozen_string_literal: true

require 'spec_helper'

describe 'Translations menu', type: :system do
  before { visit local_samples_path }

  scenario 'open the menu', js: true do
    find('.open-phrases-menu-btn').click
  end
end
