test = {
  'name': 'Dictionaries',
  'points': 0,
  'suites': [
    {
      'cases': [
        {
          'code': r"""
          >>> letters = {'a': 1, 'b': 2, 'c': 3}
          >>> 'a' in letters
          True
          >>> 2 in letters
          False
          """,
          'hidden': False,
          'locked': False
        }
      ],
      'scored': False,
      'type': 'wwpp'
    },
    {
      'cases': [
        {
          'code': r"""
          >>> food = {'bulgogi': 10, 'falafel': 4, 'ceviche': 7}
          >>> food['ultimate'] = food['bulgogi'] + food['ceviche']
          >>> food['ultimate']
          17
          >>> len(food)
          4
          >>> food['ultimate'] += food['falafel']
          >>> food['ultimate']
          21
          >>> sorted(list(food.keys())) # sorted takes in a list and returns a new sorted list
          ['bulgogi', 'ceviche', 'falafel', 'ultimate']
          >>> food['bulgogi'] = food['falafel']
          >>> len(food)
          4
          >>> 'gogi' in food
          False
          """,
          'hidden': False,
          'locked': False
        }
      ],
      'scored': False,
      'type': 'wwpp'
    }
  ]
}
