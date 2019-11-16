# Script to get Data from Varian API
# class Gateway
#   include HTTParty
#   base_uri 'https://junction-planreview.azurewebsites.net'
# end

# def convert_hash_keys_to_snake_case(hash)
#   return {} if hash.blank?

#   Hash[hash.map {|k, v| [k.to_s.underscore.to_sym, v] }]
# end

# def convert_hash_keys_to_camel_lower(hash)
#   return {} if hash.blank?

#   Hash[hash.map {|k, v| [k.to_s.camelcase(:lower), v] }]
# end

# def prepare_attachment(uri)
#   full_uri = 'https://junction-planreview.azurewebsites.net/' + uri
#   { io: URI.open(full_uri) }
# rescue
#   nil
# end

# [
#   # "Abdomen",
#   # "Head_Neck",
#   # "Lung",
#   "Prostate"
# ].each do |patient_id|
#   times = 5
#   patient_response = nil
#   begin
#     patient_response = Gateway.get("/api/patients/#{patient_id}").parsed_response
#   rescue SocketError
#     times -= 1
#     retry if times > 0
#   rescue
#     next
#   end

#   patient_data = convert_hash_keys_to_snake_case patient_response
#   patient = Patient.create(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name)

#   patient_data[:plans].each do |plan_link|
#     times = 5
#     plan_response = nil
#     begin
#       plan_response = Gateway.get("/#{plan_link['Href'].gsub(/\s/, '%20')}").parsed_response
#     rescue SocketError
#       times -= 1
#       retry if times > 0
#     rescue
#       next
#     end

#     plan_data = convert_hash_keys_to_snake_case plan_response
#     plan_data[:name] = plan_data.delete(:id)
#     plan_data[:grid_size]["Origin"] = convert_hash_keys_to_camel_lower plan_data[:grid_size]["Origin"]
#     plan_data[:grid_size] = convert_hash_keys_to_camel_lower plan_data[:grid_size]
#     puts "Plan: #{plan_data}"
#     plan = patient.treatment_plans.create(plan_data.slice(:name, :number_of_fractions, :planned_dose_per_fraction, :grid_size))
#     if (attachment = prepare_attachment(plan_data[:dose_voxels]['Href'].gsub(/\s/, '%20')))
#       plan.dose_voxels.attach(attachment.merge(filename: "plan_#{plan.id}_dose_voxel"))
#     end
#     if (attachment = prepare_attachment(plan_data[:dvh_graph]['Href'].gsub(/\s/, '%20')))
#       plan.dvh_graph.attach(attachment.merge(filename: "plan_#{plan.id}_dvh_graph"))
#     end
#     plan.bitmaps.attach(plan_data[:rendered_bitmaps].map.with_index do |bitmap, index|
#       puts "Bitmap: #{bitmap}"
#       prepare_attachment(bitmap['Href'].gsub(/\s/, '%20'))&.merge(filename: "plan_#{plan.id}_bitmap_#{index + 1}")
#     end.compact)

#     times = 5
#     image_response = nil
#     begin
#       image_response = Gateway.get("/#{plan_data[:image3_d]['Href'].gsub(/\s/, '%20')}").parsed_response
#     rescue SocketError
#       times -= 1
#       retry if times > 0
#     rescue
#       image_response = nil
#     end

#     if !image_response.nil?
#       image_3d_data = convert_hash_keys_to_snake_case image_response
#       image_3d_data[:name] = image_3d_data.delete(:id)
#       image_3d_data[:grid_size]["Origin"] = convert_hash_keys_to_camel_lower image_3d_data[:grid_size]["Origin"]
#       image_3d_data[:grid_size] = convert_hash_keys_to_camel_lower image_3d_data[:grid_size]
#       puts "3D Image: #{image_3d_data}"
#       image_3d = ThreeImage.create(image_3d_data.slice(:name, :grid_size).merge(treatment_plan_id: plan.id))
#       if (attachment = prepare_attachment(image_3d_data[:image_voxels]['Href'].gsub(/\s/, '%20')))
#         image_3d.image_voxels.attach(attachment.merge(filename: "image_3d_#{image_3d.id}_image_voxels"))
#       end
#       image_3d_data[:structures].each do |structure_data|
#         structure_data = convert_hash_keys_to_snake_case structure_data
#         structure_data[:name] = structure_data.delete(:id)
#         structure_data[:center_point] = convert_hash_keys_to_camel_lower structure_data[:center_point]
#         puts "Structure: #{structure_data}"
#         structure = image_3d.structures.create(structure_data.slice(:name, :volume, :center_point, :color, :is_target_structure))
#         if (attachment = prepare_attachment(structure_data[:contours]['Href'].gsub(/\s/, '%20')))
#           structure.contours.attach(attachment.merge(filename: "image_3d_#{image_3d.id}_contours"))
#         end
#         if (attachment = prepare_attachment(structure_data[:mesh]['Href'].gsub(/\s/, '%20')))
#           structure.mesh.attach(attachment.merge(filename: "image_3d_#{image_3d.id}_mesh"))
#         end
#       end
#     end

#     plan_data[:beams].each do |beam_data|
#       beam_data = convert_hash_keys_to_snake_case beam_data
#       beam_data[:name] = beam_data.delete(:id)
#       beam_data[:isocenter] = convert_hash_keys_to_camel_lower beam_data[:isocenter]
#       puts "Beam: #{beam_data}"
#       plan.beams.create(beam_data)
#     end

#     plan_data[:isodoses].each do |isodose_data|
#       isodose_data = convert_hash_keys_to_snake_case isodose_data
#       puts "Isodose: #{isodose_data}"
#       isodose = plan.isodoses.create(isodose_data.slice(:level, :volume))
#       if (attachment = prepare_attachment(isodose_data[:contours]['Href'].gsub(/\s/, '%20')))
#         isodose.contours.attach(attachment.merge(filename: "isodose_#{isodose.id}_contours"))
#       end
#       if (attachment = prepare_attachment(isodose_data[:mesh]['Href'].gsub(/\s/, '%20')))
#         isodose.mesh.attach(attachment.merge(filename: "isodose_#{isodose.id}_mesh"))
#       end
#     end

#     plan_data[:dvhs].each do |dvh_hash|
#       times = 5
#       dvh_response = nil
#       begin
#         dvh_response = Gateway.get("/#{dvh_hash['Href'].gsub(/\s/, '%20')}").parsed_response
#       rescue SocketError
#         times -= 1
#         retry if times > 0
#       rescue
#         next
#       end

#       dvh_data = convert_hash_keys_to_snake_case dvh_response
#       dvh_data[:name] = dvh_data.delete(:id)
#       dvh_data[:curve_points] = dvh_data[:curve_points].map do |curve_point|
#         convert_hash_keys_to_snake_case curve_point
#       end
#       puts "DVH: #{dvh_data}"
#       plan.dvh_curves.create(dvh_data)
#     end
#   end
# end
