# Contributing

## Adding features or fixing bugs

* Fork the repo
* Check out a feature or bug branch
* Add your changes
* Update README when needed
* Submit a pull request to upstream repo
* Add description of your changes
* Ensure tests are passing
* Ensure branch is mergeable

## Testing

* Please make sure the test playbook passes when making changes

## Package specific files/details

* Don't update `CHANGELOG` in your feature branch
* Don't change the package version in your feature branch

## Styling

* Preferred Ansible variable interpolation uses spaces

        # Don't
        my_var: "{{foo_bar}}"

        # Prefer spaces
        my_var: "{{ foo_bar }}"
