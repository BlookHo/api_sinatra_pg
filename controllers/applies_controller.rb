namespace '/api/v1' do

  get '/applies' do
    applies = Apply.all
    [:job_id, :geek_id].each do |filter|
      applies = applies.send(filter, params[filter]) if params[filter]
    end
    puts applies.count
    applies.to_json
  end

  get '/applies_read' do
    Apply.read.to_json
  end

  get '/applies_unread' do
    Apply.unread.to_json
  end

  get '/applies_invited' do
    Apply.invited.to_json
  end

  get '/applies_denied' do
    Apply.denied.to_json
  end

  get '/geek_applies' do
    puts "params[:geek_id] = #{params[:geek_id].inspect}"
    # a = Apply.geek_apply(params[:geek_id])
    a = Apply.where(geek_id: params[:geek_id])
    puts a.count
      a.to_json
  end

  # job found by id:, to be deleted
  # http://localhost:4567/api/v1/job/58a566d6e61837294749441a
  delete '/applies/:id' do
    applies = Apply.id(params[:id])
    halt(404, { message:'Document Not Found', status: 404, params_id: params[:id]}.to_json) if applies.blank?
    puts "job id = #{applies.first.id.inspect} "
    if applies.delete
      status 204
      puts "Status = #{status}"
    else
      raise StandardError.new("In DELETE '/applies/:id' - Unprocessible Entity 422")
    end
  end

end
