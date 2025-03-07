# Ubuntu Workstation Setup

Ansible playbook for automated Ubuntu workstation configuration. Currently tested with Ubuntu 22.04 and prepared for 24.04.2.

## Prerequisites

- Ubuntu 22.04+ installed
- Internet connection
- Sudo privileges

## Quick Start

1. Clone the repository:
    ```bash
    git clone https://github.com/Elphnek/workingstation-setup.git
    cd workingstation-setup
    ```

2. Run setup script (installs prerequisites):
    ```bash
    ./setup.sh
    ```

3. Run the playbook:
    ```bash
    ansible-playbook -i inventory/hosts main.yml --ask-become-pass
    ```

## What's Included

### Base Configuration
- Essential system utilities
- Common repositories
- Basic system tools
- Terminal utilities

### Development Environment
- Docker setup
- Development tools
- Code editors
- Version control tools
- Programming languages support

### Personal Configuration
- Shell configuration (bashrc)
- Git configuration
- GNOME settings
- Guake terminal setup

### Work Environment
- Work directories structure
- Development tools
- NPM registry management

## Post-Installation Steps

1. Configure any private repositories
2. Set up VPN configurations if needed
3. Configure work-specific credentials

## Testing

To test the playbook without making changes:
    ```bash
    ansible-playbook -i inventory/hosts main.yml --check --diff --ask-become-pass
    ```

## Contributing

Feel free to fork and submit pull requests.

## License

MIT
