import { buildModule } from "@nomicfoundation/hardhat-ignition/modules";

const EasyATokenModule = buildModule("EasyATokenModule", (m) => {
  const easyAToken = m.contract("EasyATokenModule", []);

  return { easyAToken };
});

export default EasyATokenModule;
