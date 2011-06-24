# Refinery CMS Settings Initializer

An initializer for RefinerySettings that updates settings from a configuration
file on Rails start.  This can be useful to maintain identical configuration
across staging and production environments.  This gem is probably more useful
for existing apps that integrate with Refinery CMS than for apps that are
solely Refinery CMS.  

## Warning

If a setting is managed by the settings initializer, the initializer will
overwrite any changes made to the setting from within the Refinery admin
console on server restart / re-deploy.

## Requirements

Refinery CMS version 1.0.0.  This has not been tested with versions greater
than that.

## Install

Open up your ``Gemfile`` and add at the bottom this line:

    gem 'refinerycms-settings-initialzer', '~> 0.9'

Now, run ``bundle install``

Next, to install the initializer and stubbed out configuration file, run this
generator:

    bundle exec rails g refinery:settings_initializer

Finally, update settings in ``config/refinery/settings.yml`` that you wish to
maintain.

## Configuration File

The settings configuration file lives at ``config/refinery/settings.yml``.  The
configuration follows this format:

    scoping:
      setting_name:
        value: *setting_value*
        destroyable: *(optional)*
        ... (additional setting options)
      setting_name_2:
        value: *setting_2_value*

    unscoped:
      unscoped_setting_name:
        value: *unscoped_setting_value*

At the top level of the configuration file are scopings (e.g., pages, blog,
etc.).  For settings that do not have a scoping, place them under ``unscoped``.

## Example Configuration File

Here is an example configuration file.  Note that ``user_image_sizes``'s value
pre-fixes the hash keys with a colon in order to create symbols.

    pages:
      use_marketable_urls:
        value: false

    unscoped:
      user_image_sizes:
        destroyable: false
        value:
          :large:  "580x580>"
          :medium: "280x280>"
          :small:  "120x120>"


