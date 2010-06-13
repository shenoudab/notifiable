class NotifiableInstallGenerator < Rails::Generators::Base
  include Rails::Generators::Migration

  desc "Creates a Notifibale Messages initializer and migration to your application."

  def self.source_root
    @_sooner_source_root ||= File.expand_path("../templates", __FILE__)
  end

  def self.orm_has_migration?
    Rails::Generators.options[:rails][:orm] == :active_record
  end

  def self.next_migration_number(dirname)
    if ActiveRecord::Base.timestamped_migrations
      Time.now.utc.strftime("%Y%m%d%H%M%S")
    else
      "%.3d" % (current_migration_number(dirname) + 1)
    end
  end

  class_option :orm
  class_option :migration, :type => :boolean, :default => orm_has_migration?

  def create_migration_file
    migration_template 'migration.rb', 'db/migrate/notifiable_create_notifications.rb'
  end

#  def copy_initializer
#    template "notifiable.rb", "config/initializers/notifiable.rb"
#  end
#
#  def show_readme
#    readme "README"
#  end

  protected
  
  def readme(path)
    say File.read(File.expand_path(path, self.class.source_root))
  end
end
