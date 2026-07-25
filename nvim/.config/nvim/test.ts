type Status = "active" | "inactive" | "pending";

interface User {
  id: number;
  name: string;
  email: string;
  status: Status;
  createdAt: Date;
}

interface ApiResponse<T> {
  data: T;
  error: string | null;
  statusCode: number;
}

async function fetchuser(id: number): Promise<ApiResponse<User>> {
  try {
    const response = await fetch(`/api/users/${id}`);

    if (!response.ok) {
      return { data: null, error: "Not found", statusCode: response.status };
    }

    const data = await response.json();
    return { data, error: null, statusCode: 200 };
  } catch (err) {
    return { data: null, error: String(err), statusCode: 500 };
  }
}

function filterUsers(users: User[], status: Status): User[] {
  return users.filter((u) => u.status === status);
}

class UserService {
  private users: Map<number, User> = new Map();

  add(user: User): void {
    this.users.set(user.id, user);
  }

  get(id: number): User | undefined {
    return this.users.get(id);
  }

  getAll(): User[] {
    return Array.from(this.users.values());
  }

  getByStatus(status: Status): User[] {
    return filterUsers(this.getAll(), status);
  }
}

const service = new UserService();

service.add({ id: 1, name: "", email: "", status: "active", createdAt: new Date() });

const active = service.getByStatus("inactive");
console.log(active);
