test = {
  'name': 'survey',
  'points': 1,
  'suites': [
    {
      'cases': [
        {
          'code': r"""
          scm> (survey)
          procedure
          """,
          'hidden': False,
          'locked': False
        }
      ],
      'scored': True,
      'setup': r"""
      scm> (load 'hw09)
      """,
      'teardown': '',
      'type': 'scheme'
    }
  ]
}
