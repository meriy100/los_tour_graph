#
def generate arrangement, arrangement_key
  puts "前状態, before state, メソッド, method, 後状態, after state"
  arrangement.aasm.events.each do |event|
    event.transitions.each do |tr|
      print "#{TourStatus.where(code: tr.from.to_s).first.try :name},#{tr.from},"
      print "#{I18n.t event.name, scope: [:tour_state_method, arrangement_key]},#{event.name},"
      puts "#{TourStatus.where(code: tr.to.to_s).first.try :name},#{tr.to}"
    end
  end
end


arrangements = {}
arrangements["hotel"] = TourDateHotel
arrangements["bus"] = TourDateBus
arrangements["restaurant"] = TourDateRestaurant
arrangements["guide"] = TourGuide


if ARGV.first == "all"
  arrangements.each do |key, arrangement|
    puts key
    generate arrangement, key
  end
else
  arrangement = arrangements[ARGV.first]
  arrangement_key = ARGV.first
  generate arrangement, arrangement_key
end
