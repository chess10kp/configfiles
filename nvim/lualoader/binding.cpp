// 1. load time binding
static int staticVar = 42;

// Language design time: Binding operator symbols to operations (part of the

int main() {
  // 2. Compile-time binding: Variable bound to a type
  double compileTimeBoundVar = 3.14;

  // 3. Runtime binding
  int *runtimeBoundVar = new int[5];

  for (int i = 0; i < 5; ++i) {
    runtimeBoundVar[i] = i * 2;
    std::cout << "Runtime Bound Variable[" << i << "]: " << runtimeBoundVar[i]
              << std::endl;
  }

  // 4. Language Implementation Time: Binding floating-point type to a
  // representation
  std::cout << "Size of double (depends on implementation): " << sizeof(double)
            << " bytes" << std::endl;

  delete[] runtimeBoundVar; 
                           

  return 0;
}
