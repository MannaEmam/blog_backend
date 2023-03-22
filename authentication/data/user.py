class User:
    ROLES = {
        "AD": ("Admin", 1),
        "MD": ("Moderator", 2),
        "US": ("User", 3),
    }
    ROLE_CHOICES = ((role, data[0]) for role, data in ROLES.items())

    ADMIN_ROLE = "AD"
    MOD_ROLE = "MD"
    USER_ROLE = "US"

