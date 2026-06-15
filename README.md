# SureCart Stubs

[![Latest Version](https://img.shields.io/packagist/v/mralaminahamed/phpstan-surecart-stubs.svg?color=4CC61E&style=flat-square)](https://packagist.org/packages/mralaminahamed/phpstan-surecart-stubs)
[![Downloads](https://img.shields.io/packagist/dt/mralaminahamed/phpstan-surecart-stubs.svg?style=flat-square)](https://packagist.org/packages/mralaminahamed/phpstan-surecart-stubs/stats)
[![License](https://img.shields.io/packagist/l/mralaminahamed/phpstan-surecart-stubs.svg?style=flat-square)](./LICENSE)
[![PHP Version](https://img.shields.io/packagist/php-v/mralaminahamed/phpstan-surecart-stubs.svg?style=flat-square)](./composer.json)

PHP stub declarations for the [SureCart](https://surecart.com) plugin to enhance IDE completion and static analysis capabilities. Generated using [php-stubs/generator](https://github.com/php-stubs/generator) directly from the source code.

## Features

- Complete function, class, and interface declarations
- Constant definitions for proper static analysis
- IDE autocompletion support
- PHPStan integration
- Regular updates with latest SureCart plugin versions

## Requirements

- PHP >= 7.4
- Composer for dependency management

## Installation

### Via Composer (Recommended)

```bash
composer require --dev mralaminahamed/phpstan-surecart-stubs
```

### Manual Installation

Download the stub files directly:
- [surecart-stubs.php](https://raw.githubusercontent.com/mralaminahamed/phpstan-surecart-stubs/main/surecart-stubs.php)
- [surecart-constants-stubs.php](https://raw.githubusercontent.com/mralaminahamed/phpstan-surecart-stubs/main/surecart-constants-stubs.php)

## Basic Configuration

To use these stubs with PHPStan or your IDE, see our [Usage Guide](./docs/usage.md) for detailed instructions.

## Package Structure

```
phpstan-surecart-stubs/
├── bin/                               # Scripts for generating and releasing stubs
│   ├── generate.sh                    # Stub generation script
│   └── release-latest-versions.sh    # Release automation script
├── configs/                           # Configuration files for stub generation
│   ├── bootstrap.php                  # PHPStan bootstrap with WP constants
│   └── finder.php                     # File finder configuration
├── surecart-constants-stubs.php       # Constants stub file
├── surecart-stubs.php                 # Main stubs file with classes and functions
├── phpstan.neon                       # PHPStan configuration
├── source/                            # Source for generating stubs
└── tests/                             # Test files
```

## Development

### Generating Stubs

```bash
composer generate
```

### Running Tests

```bash
composer test
```

### Releasing a New Version

```bash
composer release
```

## Contributing

Contributions are welcome! Please feel free to submit a Pull Request.

## License

This package is open-sourced software licensed under the [MIT license](./LICENSE).
