import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'Model/Build.dart';
import 'Util/BuildUtil.dart';
import 'assetsPath.dart';
import 'color.dart';

class BuildWithPriceCardWidget extends StatelessWidget {
  final bool isSelected;
  final Build createdbuild;

  const BuildWithPriceCardWidget({Key key, this.isSelected, this.createdbuild})
      : super(key: key);
  Widget _buildComponentDescription(
      String iconPath, String name, String description) {
    return Padding(
      padding: const EdgeInsets.only(right: 8.0),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
              height: 33,
              width: 33,
              child: SvgPicture.asset(
                iconPath,
                color: Colors.white,
                // height: 33,
                // width: 33,
              ),
            ),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(height: 10),
                AutoSizeText(
                  name,
                  maxLines: 1,
                  style: TextStyle(color: Colors.white),
                  minFontSize: 14,
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(
                  height: 5,
                ),
                AutoSizeText(
                  description,
                  maxLines: 1,
                  minFontSize: 12,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontWeight: FontWeight.w200,
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 10),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(11.0),
          gradient: !isSelected
              ? createdbuild.level == 3
                  ? SweepGradient(
                      colors: [
                        Colors.transparent,
                        Colors.red,
                        Colors.transparent,
                        Colors.blue,
                        Colors.transparent,
                        primaryColor,
                        Colors.transparent,
                      ],
                    )
                  : null
              : null,
          color: !isSelected ? const Color(0xbd242424) : primaryColor,
        ),
        child: Padding(
          padding: const EdgeInsets.only(left: 8, top: 8.0, bottom: 8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 8),
                child: AutoSizeText(
                  createdbuild.name ?? "My Build",
                  maxLines: 1,
                  style: TextStyle(
                    fontFamily: "Roboto",
                    fontWeight: FontWeight.w700,
                    fontSize: 16,
                    color: !isSelected ? Color(0xff29bf7e) : Colors.white,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "${getActualBuildPrice(createdbuild).toStringAsFixed(2)}\$",
                  style: TextStyle(
                    fontFamily: "Roboto",
                    fontWeight: FontWeight.w700,
                    fontSize: 16,
                    color: Color(0xffffffff),
                  ),
                ),
              ),
              _buildComponentDescription(
                  AssetComponent.aCpu,
                  "${createdbuild.cpu.company} ${createdbuild.cpu.brand} ${createdbuild.cpu.model}",
                  "${createdbuild.cpu.baseClock} GHz - ${createdbuild.cpu.noCores} Cores - ${createdbuild.cpu.noThreads} Threads"),
              Center(
                child: Container(
                  height: 1.00,
                  color: Color(0xff707070).withOpacity(0.35),
                ),
              ),
              _buildComponentDescription(
                  AssetComponent.aGpu,
                  createdbuild.gpu.name,
                  "${createdbuild.gpu.baseClock} MHz - ${createdbuild.gpu.capacity} GB - ${createdbuild.gpu.memoryType}"),
              Center(
                child: Container(
                  height: 1.00,
                  color: Color(0xff707070).withOpacity(0.35),
                ),
              ),
              _buildComponentDescription(
                AssetComponent.aRam,
                createdbuild.ram.name,
                "${createdbuild.ram.totalCapacity} GB - ${createdbuild.ram.freq} MHz",
              ),
              Center(
                child: Container(
                  height: 1.00,
                  color: Color(0xff707070).withOpacity(0.35),
                ),
              ),
              _buildComponentDescription(
                AssetComponent.aSSD,
                createdbuild.isUsingSata
                    ? createdbuild.sataDisk.name
                    : createdbuild.nvmeDisk.name,
                "${createdbuild.isUsingSata ? createdbuild.sataDisk.capacity : createdbuild.nvmeDisk.capacity} GB - ${createdbuild.isUsingSata ? createdbuild.sataDisk.readSpeed : createdbuild.nvmeDisk.readSpeed} MB read - ${createdbuild.isUsingSata ? createdbuild.sataDisk.writeSpeed : createdbuild.nvmeDisk.writeSpeed} MB write - ${createdbuild.isUsingSata ? "SATA" : "NVMe"}",
              ),
            ],
          ),
        ),
      ),
    );
  }
}
