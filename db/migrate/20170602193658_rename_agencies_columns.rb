class RenameAgenciesColumns < ActiveRecord::Migration[5.0]
  def change
    rename_column :agencies, :name, :agency_name
    rename_column :agencies, :url, :agency_url
    rename_column :agencies, :timezone, :agency_timezone
    rename_column :agencies, :lang, :agency_lang
    rename_column :agencies, :phone, :agency_phone
    rename_column :agencies, :fare_url, :agency_fare_url
    rename_column :agencies, :email, :agency_email
  end
end
