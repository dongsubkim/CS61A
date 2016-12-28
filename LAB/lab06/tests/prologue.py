test = {
  'name': 'Prologue',
  'points': 0,
  'suites': [
    {
      'cases': [
        {
          'code': r"""
          >>> from car import *
          >>> johns_car = Car('Tesla', 'Model S')
          >>> johns_car.color
          'No color yet. You need to paint me.'
          >>> johns_car.paint('black')
          'Tesla Model S is now black'
          >>> johns_car.color
          'black'
          """,
          'hidden': False,
          'locked': False
        },
        {
          'code': r"""
          >>> from car import *
          >>> johns_car = Car('Tesla', 'Model S')
          >>> johns_truck = MonsterTruck('Monster Truck', 'XXL')
          >>> johns_car.size
          'Tiny'
          >>> johns_truck.size
          'Monster'
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
