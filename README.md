# bin_search

This gem implements binary search for arrays and array-like data
structures. Binary search is a very fast method for looking up elements in pre-sorted arrays that is missing from the Ruby standard library.  For large
enough arrays, it will always be more efficient than using regular `assoc` and `index` calls.

## API

bin_search adds six methods to Ruby's Array class:

* `bin_index` - find and return index of given element using `<=>` or the provided comparator block to compare elements
* `bin_search` - find and return given element using `<=>` or the provided comparator block to compare elements
* `bin_assoc` - find given element and return an assoc pair [index, elem] using `<=>` or the provided comparator block to compare elements
* `bin_index_by` - same as `bin_index` but compares elements using `<=>` after mapping them with the provided block
* `bin_search_by` - same as `bin_search` but compares elements using `<=>` after mapping them with the provided block
* `bin_assoc_by` - same as `bin_assoc` but compares elements using `<=>` after mapping them with the provided block

Each of these methods needs to be called with the searched element, and a mode as second argument. Available modes are:

* `:asc` - array has been sorted in ascending order, find first element
that is greater than or equal to the given element (default mode)
* `:desc` - array has been sorted descending ascending order, find first element that is less than or equal to the given element
* `:asc_eq` - same as `:asc` but only retuns the found element if it is equal
* `:desc_eq` - same as `:desc` but only retuns the found element if it is equal

If the sorting requirements of a mode are not met by the used array, the behavior of the bin_search methods is unspecified (i.e. arbitrary weird things may happpen).

Example

    arr = [1, 2, 2, 3, 8, 9]
    arr.bin_index(0, :asc) => 0
    arr.bin_index(1, :asc) => 0
    arr.bin_index(2, :asc) => 1
    arr.bin_index(2, :asc_eq) => 1
    arr.bin_index(2.5, :asc_eq) => -1
    arr.bin_index(9, :asc) => 5
    arr.bin_index(10, :asc) => -1

## Use as Mixin

    class MyArrayClass
      include ::BinSearch::Methods

      def sort!
        # ...
      end
    end

    arr = MyArrayClass.new
    arr.sort!
    arr.bin_search(some_elem, :asc)

## Implementation Notes

bin_search is a pure ruby implementation of binary search.

For arrays with less than `1 << ::BinSearch::LIN_BITS` elements, all methods
switch to linear search as that is slightly more efficient on moden CPUs
(due to processor caching and branch prediction effects).

## Requirements

Ruby 1.9

## Installation

    gem install bin_search

## Online Docs

Docs for the latest released gems are to be found in:

http://rubydoc.info/gems/bin_search

## Development

Development happens on the devel branch, cf. boggle/bin_search/tree/devel, too.

## Status

Fairly fresh but tested.