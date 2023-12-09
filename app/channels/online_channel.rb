class OnlineChannel < Turbo::StreamsChannel
  def subscribed
    # https://github.com/hotwired/turbo-rails/blob/v1.5.0/app/channels/turbo/streams_channel.rb#L38
    super

    Kredis.hash("user_id_by_stream_id").update(params[:stream_id] => current_user.id)

    online_user_ids = Kredis.hash("user_id_by_stream_id").values.uniq
    online_users = User.where(id: online_user_ids).order(:created_at)
    current_user.broadcast_update_to("online-users", target: "online-users", partial: "layouts/online_users", locals: { online_users: })
  end

  def unsubscribed
    Kredis.hash("user_id_by_stream_id").delete(params[:stream_id])

    online_user_ids = Kredis.hash("user_id_by_stream_id").values.uniq
    online_users = User.where(id: online_user_ids).order(:created_at)
    current_user.broadcast_update_to("online-users", target: "online-users", partial: "layouts/online_users", locals: { online_users: })
  end
end
