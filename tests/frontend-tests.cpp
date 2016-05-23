#include "gtest/gtest.h"
#include "parser.h"
#include "driver.h"

TEST(TestTrue, Fails){
  PL::LanguageContext ctx;
  PL::Driver driver(ctx);
  
  ASSERT_TRUE(driver.parse_string(""));
}

int main(int argc, char** argv){
  ::testing::InitGoogleTest(&argc, argv);
  return RUN_ALL_TESTS();
}
