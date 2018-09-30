module Response
    def json_response(object, status = :ok)
      render json: object, status: status
    end

    def pagination_response(object,serializer, status = :ok)
      render json: object, meta: pagination_dict(object), adapter: :json , each_serializer: serializer      
    end

    def pagination_dict(object)
      {
        current_page:object.current_page,
        per_page:object.per_page,
        total_entries:object.total_entries,
      }
      end

end