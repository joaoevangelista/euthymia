class AddTokensToIdentities < ActiveRecord::Migration[5.0]
  def change
    add_column :identities, :refresh_token, :string
    add_column :identities, :access_token, :string
  end
end
