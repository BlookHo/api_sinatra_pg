namespace '/api/v1' do

  not_found do
  #   'This is nowhere to be found.'
  render json: { error: 'No such record in Database; check params',
                 status: :not_found,
  }
  end

  # def call_method(model_name, method, params)
  #   if params
  #     model_name.send(method, params)
  #   else
  #     puts "Enter Name!"
  #     [].to_json
  #   end
  # end

  # def base_url
  #   @base_url ||= "#{request.env['rack.url_scheme']}://{request.env['HTTP_HOST']}"
  # end
  #
  # def json_params
  #   puts "in json_params "
  #
  #   begin
  #     puts "After begin", request.request_method,"dcd = ",  request.params
  #     # JSON.parse(request.body).to_json
  #     return request.params
  #   rescue
  #     halt 400, { message:'Invalid JSON' }.to_json
  #   end
  # end
  #
  # class BookSerializer
  #   def initialize(book)
  #     @book = book
  #   end
  #
  #   def as_json(*)
  #     data = {
  #       id:@book.id.to_s,
  #       title:@book.title,
  #       author:@book.author,
  #       isbn:@book.isbn
  #     }
  #     data[:errors] = @book.errors if@book.errors.any?
  #     data
  #   end
  # end

end
