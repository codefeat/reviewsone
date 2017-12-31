class CreateInvitees < ActiveRecord::Migration
  def change
    create_table :invitees do |t|
      t.string     :ifname
      t.string     :ilname
      t.string     :iemail
	  t.string     :invite_token
      t.datetime   :invite_created_at
      t.datetime   :invite_sent_at
      t.references :invited_by, polymorphic: true
      t.integer    :invite_count, default: 0
      t.index      :invite_count
      t.index      :invite_token, unique: true # for invitable
      t.index      :invited_by_id
    end
  end
end