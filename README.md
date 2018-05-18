# Rosetta

Rosetta is a library for Rails that helps you identify the translations that are being used on your app pages. The library adds an expandable menu to each page that shows all phrases being used in the page along with additional info depending on the [Repository](#repositories) used.

It is especially useful if you use the [OneSky translation service](https://www.oneskyapp.com/) since it gives you direct links to edit the translations on OneSky. This makes it easy for copy writers of your app to see the texts in context and edit the translations.

When using regular translations, it shows the file where translation is so you can more easily find and edit it.

[TODO: add screenshot when design]

## Repositories

The phrases menu is different depending on the way you manage your translations. There are currently 2 repositories: Local (default) and OneSky

### Local Repository

This is the default repository and shows translations managed manually via YML files. It shows the file where each translation is stored to be able to easily find it.

It requires no further configuration.

### OneSky repository

Use this repository if you manage your translations using the [OneSky translation service](https://www.oneskyapp.com/). It adds a link to each translations pointing to the edit page for that text in OneSky.

It requires 2 configuration options:
* subdomain
* project_id

## Installation
Add this to your Gemfile:

```ruby
gem 'rosetta', '~> 1.0'
```

and run the `bundle install` command.

## Getting Started

### 1. Enable the library

By default, Rosetta is disabled. You need to explicitly enable it when desired. Usually that will depend on the current user making the request.

To enable it in a per-request basis add a `before_action :enable_rosetta` to the desired controller and add an `if` condition if necessary. Example:

```ruby
before_action :enable_rosetta, if: ->() { current_user.admin? }
```

### 2. Render the menu where desired

In order to show the menu with the translations you need to indicate where you want to render it. Usually this will be in your application's layout. Add this at the end of the body of your `layours/application.html.erb`:

```ruby
<%= render 'rosetta/translate_menu' %>
```

## Configuration

You can configure the library using an initializer.

Example:
```ruby
Rosetta.setup do |config|
  # OneSky repository config
  config.repository = Rosetta::Repositories::Onesky
  config.onesky.project_id = ENV['ONESKY_PROJECT_ID']
  config.onesky.subdomain = ENV['ONESKY_SUBDOMAIN']

  # Local repository config
  config.repository = Rosetta::Repositories::Local
end
```

## Development

When first developing, you need to run `bundle install`.

Run the specs with `rspec spec`.

Launch the dummy app with `rails s`.

## Credits

![marsbased](https://marsbased.com/assets/marsbased-readme.svg)

Visual I18n is maintained and funded by [MarsBased][marsbased]

The names and logos for MarsBased are trademarks of MarsBased.

[marsbased]: http://marsbased.com

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
