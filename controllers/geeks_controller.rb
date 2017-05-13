namespace '/api/v1' do


  # Create new geek (by self geek)
  # http://localhost:4567/api/v1/geek?name=Sergey;stack=Руби он Рейлс;resume=false
  post '/geek' do
    geek = Geek.new(request.params)
    # puts "response = #{response.length.inspect}"
    halt(422, { message:'Unprocessible Entity', status: 422, params: request.params}.to_json) if geek.blank?
    # puts "json_params = ", request.params.to_json
    if geek.save
      status 200
      geek.to_json
    else
      raise StandardError.new("In POST '/geeks' - Unprocessible Entity 422")
    end
  end

  # Geek found by id:, updated by request.params
  # http://localhost:4567/api/v1/geek/58a5e6fbe618370d771f708a?name=AlBina;stack=Haml
  put '/geek/:id' do
    puts "request.params = #{request.params.inspect} "
    geek = Geek.id(params[:id])
    halt(404, { message:'Document Not Found', status: 404, params_id: params[:id]}.to_json) if geek.blank?
    puts "geek id = #{geek.first.id.inspect} "
    if geek.update(request.params)
      status 200
      geek.to_json
    else
      raise StandardError.new("In PUT '/geek/:id' - Unprocessible Entity 422")
    end
  end

  # Geek found by id:, updated field resume to true
  # http://localhost:4567/api/v1/upload_resume/58a70760e6183712d5064c36
  put '/upload_resume/:id' do
    geek = Geek.id(params[:id])
    halt(404, { message:'Document Not Found', status: 404, params_id: params[:id]}.to_json) if geek.blank?
    puts "geek id = #{geek.first.resume.inspect} "
    if geek.update(resume: true)
      status 200
      geek.to_json
    else
      raise StandardError.new("In PUT '/upload_resume/:id' - Unprocessible Entity 422")
    end
  end

  # Geek found by id:, to be deleted
  # http://localhost:4567/api/v1/geek/58a566d6e61837294749441a
  delete '/geek/:id' do
    geek = Geek.id(params[:id])
    halt(404, { message:'Document Not Found', status: 404, params_id: params[:id]}.to_json) if geek.blank?
    puts "geek id = #{geek.first.id.inspect} "
    if geek.delete
      status 204
      puts "Status = #{status}"
    else
      raise StandardError.new("In DELETE '/geek/:id' - Unprocessible Entity 422")
    end
  end

  # All geeks, filtered
  # get 'http://localhost:4567/geeks?stack=ruby
  # http://localhost:4567/api/v1/geeks?name=mi
  get '/geeks' do
    geeks = Geek.all
    halt(404, { message:'Document Not Found', status: 404}.to_json) if geeks.blank?
    [:id, :name, :stack].each do |filter|
      geeks = geeks.send(filter, params[filter]) if params[filter]
    end
    geeks.to_json
  end

  # All applications, can be filtered by geek's name
  # get 'http://localhost:4567/geek_applied?name=Alex
  get '/geeks_applied' do
    puts "params[:name] = #{params[:name].inspect}"
    Geek.geeks_applied(params[:name])
  end

  # All read applications, can be filtered by geek's name
  # get 'http://localhost:4567/geek_applied_read?name=Alex
  get '/geeks_applied_read' do
    Geek.geeks_applied_read(params[:name])
  end

  # All unread applications, can be filtered by geek's name
  # get 'http://localhost:4567/geek_applied_unread?name=Alex
  get '/geeks_applied_unread' do
    Geek.geeks_applied_unread(params[:name])
  end

  # All invited applications, can be filtered by geek's name
  # get 'http://localhost:4567/geek_applied_invited?name=Alex
  get '/geeks_applied_invited' do
    Geek.geeks_applied_invited(params[:name])
  end

  # All denied applications, can be filtered by geek's name
  # get 'http://localhost:4567/geek_applied_denied?name=Alex
  get '/geeks_applied_denied' do
    Geek.geeks_applied_denied(params[:name])
  end

end
