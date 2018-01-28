require "digest"    # for hash checksum digest function SHA256
require "pp"        # for pp => pretty printer


class Block

  attr_reader :index
  attr_reader :timestamp
  attr_reader :transactions
  attr_reader :transactions_count
  attr_reader :previous_hash
  attr_reader :hash

  def initialize(index, transactions, previous_hash)
    @index              = index
    @timestamp          = Time.now.utc
    @transactions       = transactions
    @transactions_count = transactions.size
    @previous_hash      = previous_hash
    @hash               = calc_hash
  end

  def calc_hash
    sha = Digest::SHA256.new
    sha.update( @index.to_s +
                @timestamp.to_s +
                @transactions_count.to_s +
                @transactions.to_s +
                @previous_hash )
    sha.hexdigest
  end


  ##  ruby note: the splat operator (that is, *) turns list of passed in transactions into array
  def self.first( *transactions )    # create genesis (big bang! first) block
    ## uses index zero (0) and arbitrary previous_hash ("0")
    Block.new( 0, transactions, "0" )
  end

  def self.next( previous, *transactions )
    Block.new( previous.index+1, transactions, previous.hash )
  end

end  # class Block


#####
## let's get started
##   build a blockchain a block at a time

b0 = Block.first(
        { from: "Dutchgrown", to: "Vincent", what: "Tulip Bloemendaal Sunset", qty: 11 },
        { from: "Keukenhof",  to: "Anne",    what: "Tulip Semper Augustus",    qty: 10 } )

b1 = Block.next( b0,
        { from: "Flowers", to: "Ruben", what: "Tulip Admiral van Eijck",  qty: 5 },
        { from: "Vicent",  to: "Anne",  what: "Tulip Bloemendaal Sunset", qty: 3 },
        { from: "Anne",    to: "Julia", what: "Tulip Semper Augustus",    qty: 1 },
        { from: "Julia",   to: "Luuk",  what: "Tulip Semper Augustus",    qty: 1 } )

b2 = Block.next( b1,
        { from: "Bloom & Blossom", to: "Daisy",   what: "Tulip Admiral of Admirals", qty: 8 },
        { from: "Vincent",         to: "Max",     what: "Tulip Bloemendaal Sunset",  qty: 2 },
        { from: "Anne",            to: "Martijn", what: "Tulip Semper Augustus",     qty: 2 },
        { from: "Ruben",           to: "Julia",   what: "Tulip Admiral van Eijck",   qty: 2 } )

b3 = Block.next( b2,
        { from: "Teleflora", to: "Max",     what: "Tulip Red Impression",      qty: 11 },
        { from: "Anne",      to: "Naomi",   what: "Tulip Bloemendaal Sunset",  qty: 1  },
        { from: "Daisy",     to: "Vincent", what: "Tulip Admiral of Admirals", qty: 3  },
        { from: "Julia",     to: "Mina",    what: "Tulip Admiral van Eijck",   qty: 1  } )


blockchain = [b0, b1, b2, b3]

pp blockchain
