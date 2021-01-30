module Crysterm
  #    class Position
  #      @left : Int32
  #      @right : Int32
  #      @top : Int32
  #      @bottom : Int32
  #      @width : Int32
  #      @height : Int32
  #
  #      def initialize(
  #        @left=0,
  #        @right=0,
  #        @top=0,
  #        @bottom=0,
  #        @width=1,
  #        @height=1,
  #      )
  #      end
  #    end

  class Style
    property fg : String
    property bg : String
    property bold : Bool
    property underline : Bool
    property blink : Bool
    property inverse : Bool
    property invisible : Bool
    property transparent : Bool
    # property hover : Bool
    # property focus : Bool
    property border : Style? = nil
    property scrollbar : Style? = nil

    def initialize(
      @fg = "white",
      @bg = "black",
      @bold = false,
      @underline = false,
      @blink = false,
      @inverse = false,
      @invisible = false,
      @transparent = false,
      @border = nil,
      @scrollbar = nil,
    )
    end
  end

  class Padding
    property left : Int32
    property top : Int32
    property right : Int32
    property bottom : Int32

    def initialize(all)
      @left = @top = @right = @bottom = all
    end

    def initialize(@left = 0, @top = 0, @right = 0, @bottom = 0)
    end

    def any?
      (@left + @top + @right + @bottom) > 0
    end
  end

  class Border
    property type = BorderType::Bg
    property ch = ' '
    property left : Bool = true
    property top : Bool = true
    property right : Bool = true
    property bottom : Bool = true

    def initialize(
      @type = BorderType::Bg,
      @ch = ' ',
      @left = true,
      @top = true,
      @right = true,
      @bottom = true
    )
    end

    def any?
      !!((@type != BorderType::None) && (@left || @top || @right || @bottom))
    end
  end

  class BorderSomething
    property fg
    property bg
  end

  enum BorderType
    None
    Bg
    Fg
    Line
    # Dotted
    # Dashed
    # Solid
    # Double
    # DotDash
    # DotDotDash
    # Groove
    # Ridge
    # Inset
    # Outset
  end

  class FocusEffects
    property bg
  end

  class HoverEffects
    property bg : String = "black"
  end

  enum LayoutType
    Inline = 1
    Grid   = 2
  end

  enum Overflow
    Ignore
    ShrinkElement
    SkipElement
    StopRendering
  end
end
