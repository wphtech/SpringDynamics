import matlab.unittest.TestSuite;
suiteFolder = TestSuite.fromFolder(pwd);
disp('Start running the following tests!');
disp({suiteFolder.Name});
result = run(suiteFolder);