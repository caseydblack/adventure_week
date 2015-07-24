#Characters::Npcs::Mothra.new
module Characters
  module Npcs
    class Mothra
      attr_reader :hp

      def initialize(hp)
        @hp = hp
      end

      def subtract_hp(hp)
        @hp -= hp
      end
    end
  end
end
