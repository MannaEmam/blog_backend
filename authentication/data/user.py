class User:
    ROLES = {
        "SA": ("Super Admin", 1),
        "OA": ("Only Admin", 2),
        "MD": ("Moderator", 3),
        "NU": ("Normal User", 4),
    }
    ROLE_CHOICES = ((role, data[0]) for role, data in ROLES.items())

    ADMIN_ROLE = "OA"
    MOD_ROLE = "MD"
