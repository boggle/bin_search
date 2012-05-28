require 'bin_search'

describe ::BinSearch do

  context "Small arrays (:asc, :asc_eq)" do

    it "should find the first element" do
      [1, 2, 2, 3, 5].bin_index(1, :asc).should be_==(0)
    end

    it "should find the first element when queried using a smaller element" do
      [1, 2, 2, 3, 5].bin_index(0, :asc).should be_==(0)
    end

    it "should find a middle element" do
      [1, 2, 2, 3, 5].bin_index(2, :asc).should be_==(1)
    end

    it "should find the last element" do
      [1, 2, 2, 3, 5].bin_index(5, :asc).should be_==(4)
    end

    it "should not find a missing element" do
      [1, 2, 2, 3, 5].bin_index(6, :asc).should be_==(-1)
    end

    it "should not find an element that is not eq if called with equality checking turned on" do
      [1, 2, 2, 3, 5].bin_index(2.5, :asc_eq).should be_==(-1)
    end

  end

  context "Large arrays (:asc, :asc_eq)" do

    it "should find the first element" do
      Range.new(1, 10000).to_a.bin_index(1, :asc).should be_==(0)
    end

    it "should find the first element when queried using a smaller element" do
      Range.new(1, 10000).to_a.bin_index(0, :asc).should be_==(0)
    end

    it "should find a middle element" do
      Range.new(1, 10000).to_a.bin_index(5000, :asc).should be_==(4999)
    end

    it "should find the last element" do
      Range.new(1, 10000).to_a.bin_index(10000, :asc).should be_==(9999)
    end

    it "should not find a missing element" do
      Range.new(1, 10000).to_a.bin_index(10001, :asc).should be_==(-1)
    end

    it "should not find an element that is not eq if called with equality checking turned on" do
      Range.new(1, 10000).to_a.bin_index(5000.5, :asc_eq).should be_==(-1)
    end

  end

  context "Small arrays (:desc, :desc_eq)" do

    it "should find the first element" do
      [1, 2, 2, 3, 5].reverse.bin_index(5, :desc).should be_==(0)
    end

    it "should find the first element when queried using a larger element" do
      [1, 2, 2, 3, 5].bin_index(6, :desc).should be_==(0)
    end

    it "should find a middle element" do
      [1, 2, 2, 3, 5].reverse.bin_index(2, :desc).should be_==(2)
    end

    it "should find the last element" do
      [1, 2, 2, 3, 5].reverse.bin_index(1, :desc).should be_==(4)
    end

    it "should not find a missing element" do
      [1, 2, 2, 3, 5].reverse.bin_index(0, :desc).should be_==(-1)
    end

    it "should not find an element that is not eq if called with equality checking turned on" do
      [1, 2, 2, 3, 5].reverse.bin_index(2.5, :desc_eq).should be_==(-1)
    end

  end

  context "Large arrays (:desc, :desc_eq)" do

    it "should find the first element" do
      Range.new(1, 10000).to_a.reverse.bin_index(10000, :desc).should be_==(0)
    end

    it "should find the first element when queried using a larger element" do
      Range.new(1, 10000).to_a.reverse.bin_index(10001, :desc).should be_==(0)
    end

    it "should find a middle element" do
      Range.new(1, 10000).to_a.reverse.bin_index(5000, :desc).should be_==(5000)
    end

    it "should find the last element" do
      Range.new(1, 10000).to_a.reverse.bin_index(1, :desc).should be_==(9999)
    end

    it "should not find a missing element" do
      Range.new(1, 10000).to_a.reverse.bin_index(0, :desc).should be_==(-1)
    end

    it "should not find an element that is not eq if called with equality checking turned on" do
      Range.new(1, 10000).to_a.reverse.bin_index(5000.5, :desc_eq).should be_==(-1)
    end

  end

  context "API" do

    it "should return the found element when called via bin_search" do
      [1, 2, 2, 3, 5].bin_search(2, :asc).should be_==(2)
    end

    it "should return nil when called via bin_search with a missing element" do
      [1, 2, 2, 3, 5].bin_search(10, :asc).should be_==(nil)
    end

    it "should return the found element's assoc pair when called via bin_assoc" do
      [1, 2, 2, 3, 5].bin_assoc(2, :asc).should be_==([1, 2])
    end

    it "should return nil when called via bin_assoc with a missing element" do
      [1, 2, 2, 3, 5].bin_assoc(10, :asc).should be_==(nil)
    end

  end

  context "Comparator wrapping" do

    it 'should use a provided comparator with bin_index' do
      idx = [1, 2, 2, 3, 5].reverse.bin_index(2, :asc) { |a, b| b <=> a }
      idx.should be_==(2)
    end

    it 'should use a provided mapper with bin_index_by' do
      idx = [1, 2, 2, 3, 5].reverse.bin_index_by(2, :asc) { |a| -a }
      idx.should be_==(2)
    end

  end

end