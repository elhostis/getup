module Tools
  #
  # Update list of objects
  #
  def update_list_object(object, redirect_path)
    if (params["list_id"]["id"]).nil?
      redirect_to redirect_path, alert: "Aucune opération requise"
      return
    end
    case params["list_id"]["action"]
    when 'publish'
      params["list_id"]["id"].each do |id|
        begin
          if id.to_s.start_with?('sa')
            object = Sousactivite
            id = id.gsub("sa", "")
          end
          object.find(id).publishing
        rescue Exception => e
          puts "Unable to publish #{object} with id = #{id}"
          raise e
        end
      end
    when 'unpublish'
      params["list_id"]["id"].each do |id|
        begin
          if id.to_s.start_with?('sa')
            object = Sousactivite
            id = id.gsub("sa", "")
          end
          object.find(id).publishing(false)
        rescue Exception => e
          puts "Unable to unpublish #{object} with id = #{id}"
          raise e
        end
      end
    when 'delete'
      params["list_id"]["id"].each do |id|
        begin
          if id.to_s.start_with?('sa')
            object = Sousactivite
            id = id.gsub("sa", "")
          end
          raise "Destroy return false" unless object.find(id).destroy
        rescue Exception => e
          puts "Unable to delete #{object} with id = #{id}"
          raise e
        end
      end
    else
      redirect_to redirect_path, alert: "Aucune opération requise"
      return
    end
    redirect_to redirect_path, notice: "Opération réussie"
  rescue Exception => e
    puts "Unable to update all #{object} - #{e}"
    redirect_to redirect_path, alert: "Echec de l'opération"
  end

end
