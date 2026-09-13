-- Generated from tree.json by sql_case.py. No extension required.
CREATE OR REPLACE MACRO locate_cell_sql(x, y) AS
CASE WHEN isfinite(x::DOUBLE) AND isfinite(y::DOUBLE)
  THEN CASE WHEN (1.0::DOUBLE) * x::DOUBLE + (0.0::DOUBLE) * y::DOUBLE >= (0.0::DOUBLE)
    THEN CASE WHEN (-1.0::DOUBLE) * x::DOUBLE + (0.0::DOUBLE) * y::DOUBLE >= (-12.0::DOUBLE)
      THEN CASE WHEN (0.0::DOUBLE) * x::DOUBLE + (1.0::DOUBLE) * y::DOUBLE >= (0.0::DOUBLE)
        THEN CASE WHEN (0.0::DOUBLE) * x::DOUBLE + (-1.0::DOUBLE) * y::DOUBLE >= (-8.0::DOUBLE)
          THEN CASE WHEN (0.9709937183360219::DOUBLE) * x::DOUBLE + (-0.23910499566505533::DOUBLE) * y::DOUBLE >= (4.7239171751376565::DOUBLE)
            THEN CASE WHEN (0.9741167512468131::DOUBLE) * x::DOUBLE + (0.22604547095740368::DOUBLE) * y::DOUBLE >= (9.38554072159988::DOUBLE)
              THEN CASE WHEN (0.05404448753251536::DOUBLE) * x::DOUBLE + (-0.998538528734544::DOUBLE) * y::DOUBLE >= (-2.679853629455709::DOUBLE)
                THEN CASE WHEN (0.9742592770893496::DOUBLE) * x::DOUBLE + (0.2254303905983796::DOUBLE) * y::DOUBLE >= (10.749122419362244::DOUBLE)
                  THEN CASE WHEN (0.03793940765831401::DOUBLE) * x::DOUBLE + (-0.9992800415031495::DOUBLE) * y::DOUBLE >= (-2.3952196428647716::DOUBLE)
                    THEN CASE WHEN (0.1272694738782956::DOUBLE) * x::DOUBLE + (-0.99186817723866::DOUBLE) * y::DOUBLE >= (-0.8925430641680323::DOUBLE)
                      THEN CASE WHEN (0.21464575590047655::DOUBLE) * x::DOUBLE + (-0.9766919675485783::DOUBLE) * y::DOUBLE >= (1.145372013656262::DOUBLE)
                        THEN CASE WHEN (0.5171715991323336::DOUBLE) * x::DOUBLE + (-0.8558817307612687::DOUBLE) * y::DOUBLE >= (5.285921638290972::DOUBLE)
                          THEN CASE WHEN (0.7255139919102132::DOUBLE) * x::DOUBLE + (0.6882074160763652::DOUBLE) * y::DOUBLE >= (8.484341618327969::DOUBLE)
                            THEN CASE WHEN (0.9616766398492912::DOUBLE) * x::DOUBLE + (0.2741861418237188::DOUBLE) * y::DOUBLE >= (11.267622831659827::DOUBLE)
                              THEN CASE WHEN (0.46037117885173384::DOUBLE) * x::DOUBLE + (-0.88772652189887::DOUBLE) * y::DOUBLE >= (4.810715035344891::DOUBLE)
                                THEN CASE WHEN (0.17303429504532847::DOUBLE) * x::DOUBLE + (-0.9849157998215717::DOUBLE) * y::DOUBLE >= (1.7985456066903218::DOUBLE)
                                  THEN 979
                                  ELSE CASE WHEN (0.32758230738040706::DOUBLE) * x::DOUBLE + (0.9448226457337529::DOUBLE) * y::DOUBLE >= (4.329391817133208::DOUBLE)
                                    THEN 986
                                    ELSE 969
                                  END
                                END
                                ELSE CASE WHEN (0.9046902597099823::DOUBLE) * x::DOUBLE + (0.42606986984048123::DOUBLE) * y::DOUBLE >= (10.96507198863065::DOUBLE)
                                  THEN CASE WHEN (0.01361321599538972::DOUBLE) * x::DOUBLE + (-0.9999073358818121::DOUBLE) * y::DOUBLE >= (-0.6491984334398342::DOUBLE)
                                    THEN 986
                                    ELSE 985
                                  END
                                  ELSE CASE WHEN (0.7911655733166831::DOUBLE) * x::DOUBLE + (-0.6116020238672237::DOUBLE) * y::DOUBLE >= (8.79282073082447::DOUBLE)
                                    THEN 986
                                    ELSE 948
                                  END
                                END
                              END
                              ELSE CASE WHEN (0.8893121106164685::DOUBLE) * x::DOUBLE + (-0.4573007433963801::DOUBLE) * y::DOUBLE >= (10.26247140741064::DOUBLE)
                                THEN 979
                                ELSE CASE WHEN (0.4755018815167672::DOUBLE) * x::DOUBLE + (-0.8797147041365253::DOUBLE) * y::DOUBLE >= (4.946626262428743::DOUBLE)
                                  THEN CASE WHEN (0.06374372888522492::DOUBLE) * x::DOUBLE + (0.9979663005471713::DOUBLE) * y::DOUBLE >= (1.3077183469095401::DOUBLE)
                                    THEN 948
                                    ELSE 945
                                  END
                                  ELSE CASE WHEN (0.915796990950736::DOUBLE) * x::DOUBLE + (0.40164147117245924::DOUBLE) * y::DOUBLE >= (10.737709653842844::DOUBLE)
                                    THEN 948
                                    ELSE 925
                                  END
                                END
                              END
                            END
                            ELSE CASE WHEN (0.8893121106164685::DOUBLE) * x::DOUBLE + (-0.4573007433963801::DOUBLE) * y::DOUBLE >= (10.26247140741064::DOUBLE)
                              THEN 979
                              ELSE CASE WHEN (0.5173574861544392::DOUBLE) * x::DOUBLE + (-0.855769379868174::DOUBLE) * y::DOUBLE >= (5.4424166582520455::DOUBLE)
                                THEN CASE WHEN (0.935298775448258::DOUBLE) * x::DOUBLE + (0.35385901238344764::DOUBLE) * y::DOUBLE >= (10.67564014023316::DOUBLE)
                                  THEN 945
                                  ELSE 918
                                END
                                ELSE CASE WHEN (0.9219989477571758::DOUBLE) * x::DOUBLE + (-0.38719238155555274::DOUBLE) * y::DOUBLE >= (10.199903600775741::DOUBLE)
                                  THEN 945
                                  ELSE 906
                                END
                              END
                            END
                          END
                          ELSE CASE WHEN (0.915796990950736::DOUBLE) * x::DOUBLE + (0.40164147117245924::DOUBLE) * y::DOUBLE >= (10.737709653842844::DOUBLE)
                            THEN CASE WHEN (0.6738037604793893::DOUBLE) * x::DOUBLE + (-0.7389103412213376::DOUBLE) * y::DOUBLE >= (6.787886518262617::DOUBLE)
                              THEN CASE WHEN (0.24265524449962064::DOUBLE) * x::DOUBLE + (0.9701125874437613::DOUBLE) * y::DOUBLE >= (3.9066592519267416::DOUBLE)
                                THEN CASE WHEN (0.45392689175199263::DOUBLE) * x::DOUBLE + (-0.891038931217023::DOUBLE) * y::DOUBLE >= (4.255164477450475::DOUBLE)
                                  THEN 985
                                  ELSE 958
                                END
                                ELSE CASE WHEN (0.9046902597099823::DOUBLE) * x::DOUBLE + (0.42606986984048123::DOUBLE) * y::DOUBLE >= (10.96507198863065::DOUBLE)
                                  THEN 985
                                  ELSE 948
                                END
                              END
                              ELSE CASE WHEN (0.9971207511598944::DOUBLE) * x::DOUBLE + (0.0758301233437479::DOUBLE) * y::DOUBLE >= (11.427984125776492::DOUBLE)
                                THEN 958
                                ELSE 911
                              END
                            END
                            ELSE CASE WHEN (0.5521091758932358::DOUBLE) * x::DOUBLE + (0.8337718260378506::DOUBLE) * y::DOUBLE >= (6.696621349787103::DOUBLE)
                              THEN CASE WHEN (0.40382157772141797::DOUBLE) * x::DOUBLE + (0.9148377634130461::DOUBLE) * y::DOUBLE >= (5.5230248323783995::DOUBLE)
                                THEN CASE WHEN (0.265000995666774::DOUBLE) * x::DOUBLE + (-0.9642481383417956::DOUBLE) * y::DOUBLE >= (1.9451557618518573::DOUBLE)
                                  THEN 925
                                  ELSE 911
                                END
                                ELSE CASE WHEN (0.7527786013399491::DOUBLE) * x::DOUBLE + (-0.6582737860227079::DOUBLE) * y::DOUBLE >= (7.758828324616603::DOUBLE)
                                  THEN 925
                                  ELSE 897
                                END
                              END
                              ELSE CASE WHEN (0.7632604930772287::DOUBLE) * x::DOUBLE + (-0.6460908757346028::DOUBLE) * y::DOUBLE >= (7.887470358570777::DOUBLE)
                                THEN CASE WHEN (0.7255139919102132::DOUBLE) * x::DOUBLE + (0.6882074160763652::DOUBLE) * y::DOUBLE >= (8.484341618327969::DOUBLE)
                                  THEN 925
                                  ELSE 906
                                END
                                ELSE CASE WHEN (0.9992308262355053::DOUBLE) * x::DOUBLE + (0.03921423084428737::DOUBLE) * y::DOUBLE >= (10.996675132105844::DOUBLE)
                                  THEN 925
                                  ELSE 882
                                END
                              END
                            END
                          END
                        END
                        ELSE CASE WHEN (0.5160825509188055::DOUBLE) * x::DOUBLE + (0.85653884946168::DOUBLE) * y::DOUBLE >= (7.383099855127637::DOUBLE)
                          THEN CASE WHEN (0.9988794346022423::DOUBLE) * x::DOUBLE + (0.04732731905258004::DOUBLE) * y::DOUBLE >= (11.586109825489158::DOUBLE)
                            THEN CASE WHEN (0.6633112276771689::DOUBLE) * x::DOUBLE + (0.7483436478232492::DOUBLE) * y::DOUBLE >= (9.292411202996671::DOUBLE)
                              THEN CASE WHEN (0.29454245872075974::DOUBLE) * x::DOUBLE + (-0.9556383939601473::DOUBLE) * y::DOUBLE >= (1.429108398018054::DOUBLE)
                                THEN CASE WHEN (0.15651637264826262::DOUBLE) * x::DOUBLE + (0.9876753642229972::DOUBLE) * y::DOUBLE >= (4.023161383104148::DOUBLE)
                                  THEN 990
                                  ELSE 974
                                END
                                ELSE CASE WHEN (0.8259488447063904::DOUBLE) * x::DOUBLE + (0.5637450717551141::DOUBLE) * y::DOUBLE >= (11.08611908636853::DOUBLE)
                                  THEN 990
                                  ELSE 959
                                END
                              END
                              ELSE CASE WHEN (0.7797389514028593::DOUBLE) * x::DOUBLE + (-0.6261047577404035::DOUBLE) * y::DOUBLE >= (7.934529877685349::DOUBLE)
                                THEN CASE WHEN (0.2787257908020977::DOUBLE) * x::DOUBLE + (0.9603707271370495::DOUBLE) * y::DOUBLE >= (4.849005263769175::DOUBLE)
                                  THEN 974
                                  ELSE 958
                                END
                                ELSE CASE WHEN (0.49624999964965694::DOUBLE) * x::DOUBLE + (0.8681796691052582::DOUBLE) * y::DOUBLE >= (7.261614897223278::DOUBLE)
                                  THEN CASE WHEN (0.9257294326411797::DOUBLE) * x::DOUBLE + (-0.37818648513906405::DOUBLE) * y::DOUBLE >= (9.989507140251282::DOUBLE)
                                    THEN 974
                                    ELSE 940
                                  END
                                  ELSE CASE WHEN (0.9635921073677473::DOUBLE) * x::DOUBLE + (0.2673766082113089::DOUBLE) * y::DOUBLE >= (11.574951045928012::DOUBLE)
                                    THEN 974
                                    ELSE 924
                                  END
                                END
                              END
                            END
                            ELSE CASE WHEN (0.37167600024060043::DOUBLE) * x::DOUBLE + (0.9283625104694551::DOUBLE) * y::DOUBLE >= (6.124213610745922::DOUBLE)
                              THEN CASE WHEN (0.9983304469900615::DOUBLE) * x::DOUBLE + (0.05776087441013982::DOUBLE) * y::DOUBLE >= (10.970145904583537::DOUBLE)
                                THEN CASE WHEN (0.9991429623699796::DOUBLE) * x::DOUBLE + (0.041392520417841284::DOUBLE) * y::DOUBLE >= (11.26338122961661::DOUBLE)
                                  THEN CASE WHEN (0.29536229124110575::DOUBLE) * x::DOUBLE + (-0.9553853237897285::DOUBLE) * y::DOUBLE >= (1.2643965266698114::DOUBLE)
                                    THEN 940
                                    ELSE 935
                                  END
                                  ELSE CASE WHEN (0.8233605350062526::DOUBLE) * x::DOUBLE + (-0.5675186599524439::DOUBLE) * y::DOUBLE >= (7.9976968315292725::DOUBLE)
                                    THEN 940
                                    ELSE 909
                                  END
                                END
                                ELSE 879
                              END
                              ELSE CASE WHEN (0.7873641509497212::DOUBLE) * x::DOUBLE + (-0.6164881943713316::DOUBLE) * y::DOUBLE >= (7.162622167462538::DOUBLE)
                                THEN CASE WHEN (0.6319175200740549::DOUBLE) * x::DOUBLE + (-0.7750356429374435::DOUBLE) * y::DOUBLE >= (5.521622796464788::DOUBLE)
                                  THEN CASE WHEN (0.49624999964965694::DOUBLE) * x::DOUBLE + (0.8681796691052582::DOUBLE) * y::DOUBLE >= (7.261614897223278::DOUBLE)
                                    THEN 940
                                    ELSE 924
                                  END
                                  ELSE CASE WHEN (0.9980323770821566::DOUBLE) * x::DOUBLE + (-0.06270067221122781::DOUBLE) * y::DOUBLE >= (11.021249838293569::DOUBLE)
                                    THEN 940
                                    ELSE 901
                                  END
                                END
                                ELSE 879
                              END
                            END
                          END
                          ELSE CASE WHEN (0.1839526034250182::DOUBLE) * x::DOUBLE + (-0.982935114691279::DOUBLE) * y::DOUBLE >= (0.3602403821952125::DOUBLE)
                            THEN CASE WHEN (0.40851087870947506::DOUBLE) * x::DOUBLE + (0.9127534508157242::DOUBLE) * y::DOUBLE >= (5.796518688227524::DOUBLE)
                              THEN CASE WHEN (0.5858526887093397::DOUBLE) * x::DOUBLE + (-0.8104175634400069::DOUBLE) * y::DOUBLE >= (5.101509217006537::DOUBLE)
                                THEN CASE WHEN (0.3805399152917981::DOUBLE) * x::DOUBLE + (0.9247644958959612::DOUBLE) * y::DOUBLE >= (5.6710386138363145::DOUBLE)
                                  THEN CASE WHEN (0.7797389514028593::DOUBLE) * x::DOUBLE + (-0.6261047577404035::DOUBLE) * y::DOUBLE >= (7.934529877685349::DOUBLE)
                                    THEN 958
                                    ELSE 924
                                  END
                                  ELSE CASE WHEN (0.9971207511598944::DOUBLE) * x::DOUBLE + (0.0758301233437479::DOUBLE) * y::DOUBLE >= (11.427984125776492::DOUBLE)
                                    THEN 958
                                    ELSE 911
                                  END
                                END
                                ELSE CASE WHEN (0.988608340666992::DOUBLE) * x::DOUBLE + (-0.15051095894869831::DOUBLE) * y::DOUBLE >= (10.585670962015003::DOUBLE)
                                  THEN 924
                                  ELSE 883
                                END
                              END
                              ELSE CASE WHEN (0.7357900980750799::DOUBLE) * x::DOUBLE + (-0.6772096658898663::DOUBLE) * y::DOUBLE >= (7.083296755458312::DOUBLE)
                                THEN CASE WHEN (0.40382157772141797::DOUBLE) * x::DOUBLE + (0.9148377634130461::DOUBLE) * y::DOUBLE >= (5.5230248323783995::DOUBLE)
                                  THEN 911
                                  ELSE 897
                                END
                                ELSE CASE WHEN (0.9995884230172888::DOUBLE) * x::DOUBLE + (-0.028687707642986483::DOUBLE) * y::DOUBLE >= (10.75594674822771::DOUBLE)
                                  THEN 911
                                  ELSE 871
                                END
                              END
                            END
                            ELSE CASE WHEN (0.7219945709047152::DOUBLE) * x::DOUBLE + (-0.6918987206117063::DOUBLE) * y::DOUBLE >= (6.294042748040007::DOUBLE)
                              THEN CASE WHEN (0.11399845739939886::DOUBLE) * x::DOUBLE + (-0.9934809266969132::DOUBLE) * y::DOUBLE >= (-0.8185812599756417::DOUBLE)
                                THEN CASE WHEN (0.611125468982502::DOUBLE) * x::DOUBLE + (0.7915337397489238::DOUBLE) * y::DOUBLE >= (8.165708203329928::DOUBLE)
                                  THEN CASE WHEN (0.6319175200740549::DOUBLE) * x::DOUBLE + (-0.7750356429374435::DOUBLE) * y::DOUBLE >= (5.521622796464788::DOUBLE)
                                    THEN 924
                                    ELSE 901
                                  END
                                  ELSE CASE WHEN (0.988608340666992::DOUBLE) * x::DOUBLE + (-0.15051095894869831::DOUBLE) * y::DOUBLE >= (10.585670962015003::DOUBLE)
                                    THEN 924
                                    ELSE 883
                                  END
                                END
                                ELSE CASE WHEN (0.7873641509497212::DOUBLE) * x::DOUBLE + (-0.6164881943713316::DOUBLE) * y::DOUBLE >= (7.162622167462538::DOUBLE)
                                  THEN 901
                                  ELSE 879
                                END
                              END
                              ELSE CASE WHEN (0.02710137287345384::DOUBLE) * x::DOUBLE + (0.9996326903359924::DOUBLE) * y::DOUBLE >= (2.512711588396249::DOUBLE)
                                THEN CASE WHEN (0.9439135299011212::DOUBLE) * x::DOUBLE + (-0.3301927438173125::DOUBLE) * y::DOUBLE >= (9.202663487244443::DOUBLE)
                                  THEN 879
                                  ELSE 863
                                END
                                ELSE CASE WHEN (0.7595957276764196::DOUBLE) * x::DOUBLE + (0.6503955185083385::DOUBLE) * y::DOUBLE >= (9.446924400268482::DOUBLE)
                                  THEN 879
                                  ELSE 862
                                END
                              END
                            END
                          END
                        END
                      END
                      ELSE CASE WHEN (0.995873128442595::DOUBLE) * x::DOUBLE + (-0.0907563333655476::DOUBLE) * y::DOUBLE >= (10.781991712608251::DOUBLE)
                        THEN CASE WHEN (0.9973754056615354::DOUBLE) * x::DOUBLE + (0.07240373043903102::DOUBLE) * y::DOUBLE >= (11.68459969893304::DOUBLE)
                          THEN CASE WHEN (0.009877047716076967::DOUBLE) * x::DOUBLE + (0.9999512207745007::DOUBLE) * y::DOUBLE >= (2.849222975549112::DOUBLE)
                            THEN CASE WHEN (0.8149015113378084::DOUBLE) * x::DOUBLE + (0.5795994537776546::DOUBLE) * y::DOUBLE >= (11.173163689559294::DOUBLE)
                              THEN CASE WHEN (0.8474702579481486::DOUBLE) * x::DOUBLE + (-0.5308428787252386::DOUBLE) * y::DOUBLE >= (8.471627806025642::DOUBLE)
                                THEN CASE WHEN (0.9609649623469269::DOUBLE) * x::DOUBLE + (0.2766700944113212::DOUBLE) * y::DOUBLE >= (12.216847739029165::DOUBLE)
                                  THEN 997
                                  ELSE 984
                                END
                                ELSE 966
                              END
                              ELSE CASE WHEN (0.9056959838156374::DOUBLE) * x::DOUBLE + (-0.4239278062361851::DOUBLE) * y::DOUBLE >= (9.247159953420228::DOUBLE)
                                THEN CASE WHEN (0.9999930879064757::DOUBLE) * x::DOUBLE + (-0.003718082741351839::DOUBLE) * y::DOUBLE >= (11.725471298986003::DOUBLE)
                                  THEN 984
                                  ELSE 957
                                END
                                ELSE 944
                              END
                            END
                            ELSE CASE WHEN (0.7752958445492438::DOUBLE) * x::DOUBLE + (0.6315982531836788::DOUBLE) * y::DOUBLE >= (10.825088770851087::DOUBLE)
                              THEN CASE WHEN (0.14331332399462846::DOUBLE) * x::DOUBLE + (-0.9896773672089357::DOUBLE) * y::DOUBLE >= (-0.9309710374831413::DOUBLE)
                                THEN CASE WHEN (0.18011702555012946::DOUBLE) * x::DOUBLE + (0.9836451886259465::DOUBLE) * y::DOUBLE >= (4.778011770005969::DOUBLE)
                                  THEN 997
                                  ELSE 990
                                END
                                ELSE CASE WHEN (0.9609649623469269::DOUBLE) * x::DOUBLE + (0.2766700944113212::DOUBLE) * y::DOUBLE >= (12.216847739029165::DOUBLE)
                                  THEN 997
                                  ELSE 984
                                END
                              END
                              ELSE CASE WHEN (0.08466503396966074::DOUBLE) * x::DOUBLE + (-0.9964094700588289::DOUBLE) * y::DOUBLE >= (-1.4990339204709704::DOUBLE)
                                THEN CASE WHEN (0.8259488447063904::DOUBLE) * x::DOUBLE + (0.5637450717551141::DOUBLE) * y::DOUBLE >= (11.08611908636853::DOUBLE)
                                  THEN 990
                                  ELSE 959
                                END
                                ELSE CASE WHEN (0.863145437546627::DOUBLE) * x::DOUBLE + (-0.5049553976763116::DOUBLE) * y::DOUBLE >= (8.850223159627125::DOUBLE)
                                  THEN 990
                                  ELSE 956
                                END
                              END
                            END
                          END
                          ELSE CASE WHEN (0.0037284198277090863::DOUBLE) * x::DOUBLE + (-0.9999930494186389::DOUBLE) * y::DOUBLE >= (-2.5334580811665623::DOUBLE)
                            THEN CASE WHEN (0.881007335417375::DOUBLE) * x::DOUBLE + (0.47310260508770924::DOUBLE) * y::DOUBLE >= (11.170129815353743::DOUBLE)
                              THEN CASE WHEN (0.2972483099711695::DOUBLE) * x::DOUBLE + (0.9548002106301001::DOUBLE) * y::DOUBLE >= (5.745665630648359::DOUBLE)
                                THEN CASE WHEN (0.630336475056985::DOUBLE) * x::DOUBLE + (-0.7763220518655483::DOUBLE) * y::DOUBLE >= (5.342098053039758::DOUBLE)
                                  THEN 959
                                  ELSE 942
                                END
                                ELSE CASE WHEN (0.9988794346022423::DOUBLE) * x::DOUBLE + (0.04732731905258004::DOUBLE) * y::DOUBLE >= (11.586109825489158::DOUBLE)
                                  THEN 959
                                  ELSE 935
                                END
                              END
                              ELSE CASE WHEN (0.6066214354668625::DOUBLE) * x::DOUBLE + (0.7949908389611312::DOUBLE) * y::DOUBLE >= (8.652304719003448::DOUBLE)
                                THEN CASE WHEN (0.6114267716622496::DOUBLE) * x::DOUBLE + (-0.7913010191416915::DOUBLE) * y::DOUBLE >= (4.968608197265982::DOUBLE)
                                  THEN 935
                                  ELSE 919
                                END
                                ELSE CASE WHEN (0.9991429623699796::DOUBLE) * x::DOUBLE + (0.041392520417841284::DOUBLE) * y::DOUBLE >= (11.26338122961661::DOUBLE)
                                  THEN 935
                                  ELSE 909
                                END
                              END
                            END
                            ELSE CASE WHEN (0.9006371797463485::DOUBLE) * x::DOUBLE + (0.4345718242805711::DOUBLE) * y::DOUBLE >= (11.504812374246152::DOUBLE)
                              THEN CASE WHEN (0.17767188017661475::DOUBLE) * x::DOUBLE + (0.9840897840108423::DOUBLE) * y::DOUBLE >= (4.754434567130376::DOUBLE)
                                THEN CASE WHEN (0.9056959838156374::DOUBLE) * x::DOUBLE + (-0.4239278062361851::DOUBLE) * y::DOUBLE >= (9.247159953420228::DOUBLE)
                                  THEN 957
                                  ELSE 944
                                END
                                ELSE CASE WHEN (0.7506842623217367::DOUBLE) * x::DOUBLE + (0.6606611372727098::DOUBLE) * y::DOUBLE >= (10.452757182374366::DOUBLE)
                                  THEN 957
                                  ELSE 942
                                END
                              END
                              ELSE CASE WHEN (0.3990555394832607::DOUBLE) * x::DOUBLE + (-0.9169267562939385::DOUBLE) * y::DOUBLE >= (1.9352949934989767::DOUBLE)
                                THEN CASE WHEN (0.07341945892268459::DOUBLE) * x::DOUBLE + (0.9973011496290879::DOUBLE) * y::DOUBLE >= (3.405204264819438::DOUBLE)
                                  THEN CASE WHEN (0.6395715851311896::DOUBLE) * x::DOUBLE + (0.7687315444892173::DOUBLE) * y::DOUBLE >= (9.314856997191766::DOUBLE)
                                    THEN CASE WHEN (0.4493588960517302::DOUBLE) * x::DOUBLE + (-0.893351320891826::DOUBLE) * y::DOUBLE >= (2.6694360461114726::DOUBLE)
                                      THEN 942
                                      ELSE 934
                                    END
                                    ELSE CASE WHEN (0.9817550959208312::DOUBLE) * x::DOUBLE + (-0.19014976106605963::DOUBLE) * y::DOUBLE >= (10.594460163957626::DOUBLE)
                                      THEN 942
                                      ELSE 921
                                    END
                                  END
                                  ELSE CASE WHEN (0.881007335417375::DOUBLE) * x::DOUBLE + (0.47310260508770924::DOUBLE) * y::DOUBLE >= (11.170129815353743::DOUBLE)
                                    THEN 942
                                    ELSE 919
                                  END
                                END
                                ELSE CASE WHEN (0.9987401266812819::DOUBLE) * x::DOUBLE + (0.050181264996579274::DOUBLE) * y::DOUBLE >= (11.352966350625822::DOUBLE)
                                  THEN 934
                                  ELSE 916
                                END
                              END
                            END
                          END
                        END
                        ELSE CASE WHEN (0.9508009605109365::DOUBLE) * x::DOUBLE + (-0.30980241040295436::DOUBLE) * y::DOUBLE >= (9.367661837323492::DOUBLE)
                          THEN CASE WHEN (0.32878095441599536::DOUBLE) * x::DOUBLE + (0.9444062071022761::DOUBLE) * y::DOUBLE >= (6.051972120261001::DOUBLE)
                            THEN CASE WHEN (0.9963333590445109::DOUBLE) * x::DOUBLE + (-0.0855560497865671::DOUBLE) * y::DOUBLE >= (10.594434812535933::DOUBLE)
                              THEN CASE WHEN (0.767412034638723::DOUBLE) * x::DOUBLE + (-0.6411542475034033::DOUBLE) * y::DOUBLE >= (6.823387351798345::DOUBLE)
                                THEN 919
                                ELSE CASE WHEN (0.11288431712535552::DOUBLE) * x::DOUBLE + (0.9936081375205932::DOUBLE) * y::DOUBLE >= (3.991669280168514::DOUBLE)
                                  THEN CASE WHEN (0.9859419531820408::DOUBLE) * x::DOUBLE + (-0.16708819514131584::DOUBLE) * y::DOUBLE >= (10.420434436664033::DOUBLE)
                                    THEN 916
                                    ELSE 905
                                  END
                                  ELSE CASE WHEN (0.8340633327097954::DOUBLE) * x::DOUBLE + (0.5516687022380636::DOUBLE) * y::DOUBLE >= (10.730306870389517::DOUBLE)
                                    THEN 916
                                    ELSE 902
                                  END
                                END
                              END
                              ELSE CASE WHEN (0.37032593406532827::DOUBLE) * x::DOUBLE + (0.9289018799413866::DOUBLE) * y::DOUBLE >= (6.50589467064855::DOUBLE)
                                THEN CASE WHEN (0.6992124388105144::DOUBLE) * x::DOUBLE + (-0.7149139566497863::DOUBLE) * y::DOUBLE >= (5.613078709280103::DOUBLE)
                                  THEN 902
                                  ELSE 888
                                END
                                ELSE CASE WHEN (0.923272072591317::DOUBLE) * x::DOUBLE + (0.3841466906963194::DOUBLE) * y::DOUBLE >= (11.000472298877046::DOUBLE)
                                  THEN 902
                                  ELSE 880
                                END
                              END
                            END
                            ELSE CASE WHEN (0.9983304469900615::DOUBLE) * x::DOUBLE + (0.05776087441013982::DOUBLE) * y::DOUBLE >= (10.970145904583537::DOUBLE)
                              THEN CASE WHEN (0.5816230346076064::DOUBLE) * x::DOUBLE + (-0.8134584473799746::DOUBLE) * y::DOUBLE >= (4.4107917880046035::DOUBLE)
                                THEN CASE WHEN (0.6066214354668625::DOUBLE) * x::DOUBLE + (0.7949908389611312::DOUBLE) * y::DOUBLE >= (8.652304719003448::DOUBLE)
                                  THEN 919
                                  ELSE 909
                                END
                                ELSE CASE WHEN (0.999351764979135::DOUBLE) * x::DOUBLE + (-0.03600069211956591::DOUBLE) * y::DOUBLE >= (10.936016534564404::DOUBLE)
                                  THEN 919
                                  ELSE 894
                                END
                              END
                              ELSE CASE WHEN (0.008881669376532179::DOUBLE) * x::DOUBLE + (0.9999605571966756::DOUBLE) * y::DOUBLE >= (2.5334305970878748::DOUBLE)
                                THEN CASE WHEN (0.9463522728838841::DOUBLE) * x::DOUBLE + (-0.3231367753869971::DOUBLE) * y::DOUBLE >= (9.380604681641605::DOUBLE)
                                  THEN 894
                                  ELSE 880
                                END
                                ELSE CASE WHEN (0.6793141037537407::DOUBLE) * x::DOUBLE + (0.7338476329874289::DOUBLE) * y::DOUBLE >= (9.088338959434125::DOUBLE)
                                  THEN 894
                                  ELSE 879
                                END
                              END
                            END
                          END
                          ELSE CASE WHEN (0.37420296952797644::DOUBLE) * x::DOUBLE + (0.9273468270266764::DOUBLE) * y::DOUBLE >= (6.331475300023289::DOUBLE)
                            THEN CASE WHEN (0.6628022919115282::DOUBLE) * x::DOUBLE + (0.7487944456503569::DOUBLE) * y::DOUBLE >= (9.049875286404662::DOUBLE)
                              THEN CASE WHEN (0.3026976023127421::DOUBLE) * x::DOUBLE + (-0.9530866495519266::DOUBLE) * y::DOUBLE >= (0.6415238478749248::DOUBLE)
                                THEN CASE WHEN (0.37032593406532827::DOUBLE) * x::DOUBLE + (0.9289018799413866::DOUBLE) * y::DOUBLE >= (6.50589467064855::DOUBLE)
                                  THEN 888
                                  ELSE 880
                                END
                                ELSE CASE WHEN (0.9836354126391711::DOUBLE) * x::DOUBLE + (0.18017040545596705::DOUBLE) * y::DOUBLE >= (11.034630357285893::DOUBLE)
                                  THEN 888
                                  ELSE 876
                                END
                              END
                              ELSE CASE WHEN (0.8748958263979788::DOUBLE) * x::DOUBLE + (-0.48431115303221967::DOUBLE) * y::DOUBLE >= (7.739590076588439::DOUBLE)
                                THEN CASE WHEN (0.9012927308770361::DOUBLE) * x::DOUBLE + (-0.43321058766864734::DOUBLE) * y::DOUBLE >= (8.393111067647467::DOUBLE)
                                  THEN 880
                                  ELSE 866
                                END
                                ELSE 852
                              END
                            END
                            ELSE CASE WHEN (0.1908070953190644::DOUBLE) * x::DOUBLE + (-0.9816275527795161::DOUBLE) * y::DOUBLE >= (-0.41841262682883196::DOUBLE)
                              THEN CASE WHEN (0.9439135299011212::DOUBLE) * x::DOUBLE + (-0.3301927438173125::DOUBLE) * y::DOUBLE >= (9.202663487244443::DOUBLE)
                                THEN CASE WHEN (0.008881669376532179::DOUBLE) * x::DOUBLE + (0.9999605571966756::DOUBLE) * y::DOUBLE >= (2.5334305970878748::DOUBLE)
                                  THEN 880
                                  ELSE 879
                                END
                                ELSE CASE WHEN (0.7274197900096216::DOUBLE) * x::DOUBLE + (0.6861927200884298::DOUBLE) * y::DOUBLE >= (9.386551121550161::DOUBLE)
                                  THEN 880
                                  ELSE 863
                                END
                              END
                              ELSE CASE WHEN (0.984025045685498::DOUBLE) * x::DOUBLE + (0.17803008022144365::DOUBLE) * y::DOUBLE >= (10.837364299793995::DOUBLE)
                                THEN 880
                                ELSE 861
                              END
                            END
                          END
                        END
                      END
                    END
                    ELSE CASE WHEN (0.9983660439257691::DOUBLE) * x::DOUBLE + (0.057142299008783544::DOUBLE) * y::DOUBLE >= (11.445572448696534::DOUBLE)
                      THEN CASE WHEN (0.8295906887989021::DOUBLE) * x::DOUBLE + (-0.5583719988127657::DOUBLE) * y::DOUBLE >= (7.885815670888188::DOUBLE)
                        THEN CASE WHEN (0.6470978820032635::DOUBLE) * x::DOUBLE + (0.7624069327510674::DOUBLE) * y::DOUBLE >= (10.025008252069066::DOUBLE)
                          THEN CASE WHEN (0.33139111346211864::DOUBLE) * x::DOUBLE + (-0.9434934710523106::DOUBLE) * y::DOUBLE >= (0.964700362643589::DOUBLE)
                            THEN CASE WHEN (0.41993382616503155::DOUBLE) * x::DOUBLE + (-0.9075547265274955::DOUBLE) * y::DOUBLE >= (2.177034504053917::DOUBLE)
                              THEN CASE WHEN (0.3318782909958792::DOUBLE) * x::DOUBLE + (-0.9433222142861126::DOUBLE) * y::DOUBLE >= (1.1852792467420175::DOUBLE)
                                THEN 997
                                ELSE CASE WHEN (0.7210714967013115::DOUBLE) * x::DOUBLE + (0.6928606617819563::DOUBLE) * y::DOUBLE >= (10.716027835359741::DOUBLE)
                                  THEN 999
                                  ELSE 991
                                END
                              END
                              ELSE CASE WHEN (0.9319407478830595::DOUBLE) * x::DOUBLE + (0.3626105933851959::DOUBLE) * y::DOUBLE >= (12.217398189626119::DOUBLE)
                                THEN CASE WHEN (0.356863631262369::DOUBLE) * x::DOUBLE + (-0.9341564904673284::DOUBLE) * y::DOUBLE >= (1.3285169226034395::DOUBLE)
                                  THEN 999
                                  ELSE 994
                                END
                                ELSE CASE WHEN (0.8815988890137229::DOUBLE) * x::DOUBLE + (-0.4719993632302585::DOUBLE) * y::DOUBLE >= (9.013012515396893::DOUBLE)
                                  THEN 999
                                  ELSE 982
                                END
                              END
                            END
                            ELSE CASE WHEN (0.30508306095818977::DOUBLE) * x::DOUBLE + (-0.9523257456964931::DOUBLE) * y::DOUBLE >= (0.4478613431270291::DOUBLE)
                              THEN CASE WHEN (0.9319407478830595::DOUBLE) * x::DOUBLE + (0.3626105933851959::DOUBLE) * y::DOUBLE >= (12.217398189626119::DOUBLE)
                                THEN CASE WHEN (0.8531173661119597::DOUBLE) * x::DOUBLE + (-0.5217190428172932::DOUBLE) * y::DOUBLE >= (8.44043467912957::DOUBLE)
                                  THEN CASE WHEN (0.2840611297527872::DOUBLE) * x::DOUBLE + (0.9588061715297675::DOUBLE) * y::DOUBLE >= (6.496510626385696::DOUBLE)
                                    THEN 995
                                    ELSE 994
                                  END
                                  ELSE CASE WHEN (0.9719237065663705::DOUBLE) * x::DOUBLE + (0.23529621461954672::DOUBLE) * y::DOUBLE >= (12.316258489451014::DOUBLE)
                                    THEN 995
                                    ELSE 978
                                  END
                                END
                                ELSE CASE WHEN (0.8258317766452778::DOUBLE) * x::DOUBLE + (0.5639165511695007::DOUBLE) * y::DOUBLE >= (11.522995485919443::DOUBLE)
                                  THEN CASE WHEN (0.20136263665485052::DOUBLE) * x::DOUBLE + (-0.9795167627761184::DOUBLE) * y::DOUBLE >= (-0.7601333063470919::DOUBLE)
                                    THEN 982
                                    ELSE 978
                                  END
                                  ELSE CASE WHEN (0.9813591174652342::DOUBLE) * x::DOUBLE + (-0.19218294036635175::DOUBLE) * y::DOUBLE >= (10.937339402223017::DOUBLE)
                                    THEN 982
                                    ELSE 964
                                  END
                                END
                              END
                              ELSE 971
                            END
                          END
                          ELSE CASE WHEN (0.9105247659484461::DOUBLE) * x::DOUBLE + (-0.4134545326810767::DOUBLE) * y::DOUBLE >= (9.438585263027383::DOUBLE)
                            THEN CASE WHEN (0.8149015113378084::DOUBLE) * x::DOUBLE + (0.5795994537776546::DOUBLE) * y::DOUBLE >= (11.173163689559294::DOUBLE)
                              THEN CASE WHEN (0.8474702579481486::DOUBLE) * x::DOUBLE + (-0.5308428787252386::DOUBLE) * y::DOUBLE >= (8.471627806025642::DOUBLE)
                                THEN CASE WHEN (0.9650406237658996::DOUBLE) * x::DOUBLE + (0.2621003519294155::DOUBLE) * y::DOUBLE >= (12.218505839043413::DOUBLE)
                                  THEN CASE WHEN (0.24455023759325867::DOUBLE) * x::DOUBLE + (0.969636623324986::DOUBLE) * y::DOUBLE >= (5.735099439670881::DOUBLE)
                                    THEN CASE WHEN (0.3318782909958792::DOUBLE) * x::DOUBLE + (-0.9433222142861126::DOUBLE) * y::DOUBLE >= (1.1852792467420175::DOUBLE)
                                      THEN 997
                                      ELSE 991
                                    END
                                    ELSE CASE WHEN (0.9609649623469269::DOUBLE) * x::DOUBLE + (0.2766700944113212::DOUBLE) * y::DOUBLE >= (12.216847739029165::DOUBLE)
                                      THEN 997
                                      ELSE 984
                                    END
                                  END
                                  ELSE CASE WHEN (0.2501398454268362::DOUBLE) * x::DOUBLE + (-0.9682097178451776::DOUBLE) * y::DOUBLE >= (0.13987622691469337::DOUBLE)
                                    THEN 984
                                    ELSE 975
                                  END
                                END
                                ELSE CASE WHEN (0.5247190512886223::DOUBLE) * x::DOUBLE + (0.8512754649434976::DOUBLE) * y::DOUBLE >= (8.677600764997429::DOUBLE)
                                  THEN CASE WHEN (0.11002243354118454::DOUBLE) * x::DOUBLE + (-0.993929104170753::DOUBLE) * y::DOUBLE >= (-1.732906122748399::DOUBLE)
                                    THEN CASE WHEN (0.9650406237658996::DOUBLE) * x::DOUBLE + (0.2621003519294155::DOUBLE) * y::DOUBLE >= (12.218505839043413::DOUBLE)
                                      THEN 991
                                      ELSE 975
                                    END
                                    ELSE CASE WHEN (0.819341721796203::DOUBLE) * x::DOUBLE + (-0.5733054534225479::DOUBLE) * y::DOUBLE >= (7.94393813848243::DOUBLE)
                                      THEN 991
                                      ELSE 973
                                    END
                                  END
                                  ELSE 966
                                END
                              END
                              ELSE 957
                            END
                            ELSE CASE WHEN (0.9557423811241932::DOUBLE) * x::DOUBLE + (0.2942048621676015::DOUBLE) * y::DOUBLE >= (12.002806163308604::DOUBLE)
                              THEN CASE WHEN (0.28070075836426706::DOUBLE) * x::DOUBLE + (-0.9597953345655131::DOUBLE) * y::DOUBLE >= (0.4359255468759091::DOUBLE)
                                THEN 966
                                ELSE CASE WHEN (0.13095001518614044::DOUBLE) * x::DOUBLE + (0.9913889718585484::DOUBLE) * y::DOUBLE >= (4.618955661162742::DOUBLE)
                                  THEN CASE WHEN (0.715139821249681::DOUBLE) * x::DOUBLE + (-0.698981427552245::DOUBLE) * y::DOUBLE >= (6.2019407696147635::DOUBLE)
                                    THEN 973
                                    ELSE 964
                                  END
                                  ELSE CASE WHEN (0.8916726154871771::DOUBLE) * x::DOUBLE + (0.4526808442934787::DOUBLE) * y::DOUBLE >= (11.853588576911584::DOUBLE)
                                    THEN 973
                                    ELSE 963
                                  END
                                END
                              END
                              ELSE CASE WHEN (0.6678477658702195::DOUBLE) * x::DOUBLE + (0.7442978984399703::DOUBLE) * y::DOUBLE >= (9.891771679469176::DOUBLE)
                                THEN CASE WHEN (0.30942615223996994::DOUBLE) * x::DOUBLE + (-0.9509234755278507::DOUBLE) * y::DOUBLE >= (0.8154442950858871::DOUBLE)
                                  THEN CASE WHEN (0.8149015113378084::DOUBLE) * x::DOUBLE + (0.5795994537776546::DOUBLE) * y::DOUBLE >= (11.173163689559294::DOUBLE)
                                    THEN 966
                                    ELSE 957
                                  END
                                  ELSE CASE WHEN (0.7924891938896454::DOUBLE) * x::DOUBLE + (-0.6098859545588339::DOUBLE) * y::DOUBLE >= (7.431312622937184::DOUBLE)
                                    THEN 966
                                    ELSE 952
                                  END
                                END
                                ELSE CASE WHEN (0.9056959838156374::DOUBLE) * x::DOUBLE + (-0.4239278062361851::DOUBLE) * y::DOUBLE >= (9.247159953420228::DOUBLE)
                                  THEN 957
                                  ELSE 944
                                END
                              END
                            END
                          END
                        END
                        ELSE CASE WHEN (0.7899859308588731::DOUBLE) * x::DOUBLE + (0.6131249701692469::DOUBLE) * y::DOUBLE >= (11.05346022582018::DOUBLE)
                          THEN CASE WHEN (0.14877747410717407::DOUBLE) * x::DOUBLE + (0.9888707009504777::DOUBLE) * y::DOUBLE >= (4.985642722808509::DOUBLE)
                            THEN CASE WHEN (0.396739642367069::DOUBLE) * x::DOUBLE + (-0.9179311827007787::DOUBLE) * y::DOUBLE >= (1.6298608027717552::DOUBLE)
                              THEN CASE WHEN (0.3978942541769721::DOUBLE) * x::DOUBLE + (0.917431284888929::DOUBLE) * y::DOUBLE >= (7.671056133414439::DOUBLE)
                                THEN CASE WHEN (0.30508306095818977::DOUBLE) * x::DOUBLE + (-0.9523257456964931::DOUBLE) * y::DOUBLE >= (0.4478613431270291::DOUBLE)
                                  THEN 978
                                  ELSE 971
                                END
                                ELSE CASE WHEN (0.8258317766452778::DOUBLE) * x::DOUBLE + (0.5639165511695007::DOUBLE) * y::DOUBLE >= (11.522995485919443::DOUBLE)
                                  THEN 978
                                  ELSE 964
                                END
                              END
                              ELSE CASE WHEN (0.9980140488318299::DOUBLE) * x::DOUBLE + (0.06299173226938524::DOUBLE) * y::DOUBLE >= (11.890350547931114::DOUBLE)
                                THEN 971
                                ELSE 955
                              END
                            END
                            ELSE CASE WHEN (0.3608962904607864::DOUBLE) * x::DOUBLE + (-0.9326059551234078::DOUBLE) * y::DOUBLE >= (1.2839432401868147::DOUBLE)
                              THEN 952
                              ELSE CASE WHEN (0.7072825078776739::DOUBLE) * x::DOUBLE + (-0.7069310108138334::DOUBLE) * y::DOUBLE >= (5.832999487061513::DOUBLE)
                                THEN CASE WHEN (0.8067491785214338::DOUBLE) * x::DOUBLE + (0.5908940369939367::DOUBLE) * y::DOUBLE >= (11.217645422073621::DOUBLE)
                                  THEN CASE WHEN (0.8475334381463895::DOUBLE) * x::DOUBLE + (-0.5307420006215452::DOUBLE) * y::DOUBLE >= (8.174819625413887::DOUBLE)
                                    THEN 964
                                    ELSE 954
                                  END
                                  ELSE CASE WHEN (0.9960255439376573::DOUBLE) * x::DOUBLE + (0.08906804041682917::DOUBLE) * y::DOUBLE >= (11.841677729999013::DOUBLE)
                                    THEN 964
                                    ELSE 947
                                  END
                                END
                                ELSE CASE WHEN (0.9908243514446083::DOUBLE) * x::DOUBLE + (-0.13515585294159863::DOUBLE) * y::DOUBLE >= (10.964969028534906::DOUBLE)
                                  THEN 954
                                  ELSE 941
                                END
                              END
                            END
                          END
                          ELSE CASE WHEN (0.1984355081570313::DOUBLE) * x::DOUBLE + (-0.9801139469992561::DOUBLE) * y::DOUBLE >= (-0.7709850394969195::DOUBLE)
                            THEN CASE WHEN (0.7744604163233042::DOUBLE) * x::DOUBLE + (0.6326223704140838::DOUBLE) * y::DOUBLE >= (10.69138363622975::DOUBLE)
                              THEN CASE WHEN (0.42793860889232144::DOUBLE) * x::DOUBLE + (-0.9038078042478415::DOUBLE) * y::DOUBLE >= (2.196702996336327::DOUBLE)
                                THEN CASE WHEN (0.6678477658702195::DOUBLE) * x::DOUBLE + (0.7442978984399703::DOUBLE) * y::DOUBLE >= (9.891771679469176::DOUBLE)
                                  THEN 952
                                  ELSE 944
                                END
                                ELSE CASE WHEN (0.765005993579066::DOUBLE) * x::DOUBLE + (0.6440231593569489::DOUBLE) * y::DOUBLE >= (10.763618096929294::DOUBLE)
                                  THEN CASE WHEN (0.3608962904607864::DOUBLE) * x::DOUBLE + (-0.9326059551234078::DOUBLE) * y::DOUBLE >= (1.2839432401868147::DOUBLE)
                                    THEN 952
                                    ELSE 947
                                  END
                                  ELSE CASE WHEN (0.9660104137056886::DOUBLE) * x::DOUBLE + (-0.258503153969472::DOUBLE) * y::DOUBLE >= (10.303206842743602::DOUBLE)
                                    THEN 952
                                    ELSE 939
                                  END
                                END
                              END
                              ELSE CASE WHEN (0.20879004432497614::DOUBLE) * x::DOUBLE + (-0.9779604886654544::DOUBLE) * y::DOUBLE >= (-0.47942485720443306::DOUBLE)
                                THEN CASE WHEN (0.9006371797463485::DOUBLE) * x::DOUBLE + (0.4345718242805711::DOUBLE) * y::DOUBLE >= (11.504812374246152::DOUBLE)
                                  THEN 944
                                  ELSE 934
                                END
                                ELSE CASE WHEN (0.9113328844688078::DOUBLE) * x::DOUBLE + (-0.41167022443427054::DOUBLE) * y::DOUBLE >= (9.157942696634752::DOUBLE)
                                  THEN 944
                                  ELSE 929
                                END
                              END
                            END
                            ELSE CASE WHEN (0.8199313147230393::DOUBLE) * x::DOUBLE + (-0.5724619106425757::DOUBLE) * y::DOUBLE >= (7.50133532728737::DOUBLE)
                              THEN CASE WHEN (0.10443407277427104::DOUBLE) * x::DOUBLE + (0.9945318116801384::DOUBLE) * y::DOUBLE >= (4.336368766574564::DOUBLE)
                                THEN CASE WHEN (0.7072825078776739::DOUBLE) * x::DOUBLE + (-0.7069310108138334::DOUBLE) * y::DOUBLE >= (5.832999487061513::DOUBLE)
                                  THEN 947
                                  ELSE 941
                                END
                                ELSE CASE WHEN (0.765005993579066::DOUBLE) * x::DOUBLE + (0.6440231593569489::DOUBLE) * y::DOUBLE >= (10.763618096929294::DOUBLE)
                                  THEN 947
                                  ELSE 939
                                END
                              END
                              ELSE CASE WHEN (0.059551360632934286::DOUBLE) * x::DOUBLE + (0.998225242841898::DOUBLE) * y::DOUBLE >= (3.905661723475859::DOUBLE)
                                THEN CASE WHEN (0.9274118159915113::DOUBLE) * x::DOUBLE + (-0.37404187407204453::DOUBLE) * y::DOUBLE >= (9.280189875703655::DOUBLE)
                                  THEN 941
                                  ELSE 927
                                END
                                ELSE CASE WHEN (0.8279338960487251::DOUBLE) * x::DOUBLE + (0.5608256982107531::DOUBLE) * y::DOUBLE >= (11.181715371949748::DOUBLE)
                                  THEN 941
                                  ELSE 926
                                END
                              END
                            END
                          END
                        END
                      END
                      ELSE CASE WHEN (0.9984692049721045::DOUBLE) * x::DOUBLE + (0.05531045762216632::DOUBLE) * y::DOUBLE >= (10.994540875094792::DOUBLE)
                        THEN CASE WHEN (0.32995669030658653::DOUBLE) * x::DOUBLE + (-0.9439960712428433::DOUBLE) * y::DOUBLE >= (0.7772333802475639::DOUBLE)
                          THEN CASE WHEN (0.9982890472227044::DOUBLE) * x::DOUBLE + (0.05847202916938299::DOUBLE) * y::DOUBLE >= (11.27659179334076::DOUBLE)
                            THEN CASE WHEN (0.007015785397346843::DOUBLE) * x::DOUBLE + (-0.9999753890747803::DOUBLE) * y::DOUBLE >= (-2.8896033872068783::DOUBLE)
                              THEN CASE WHEN (0.3234874748476823::DOUBLE) * x::DOUBLE + (0.9462324522106977::DOUBLE) * y::DOUBLE >= (6.346379277082701::DOUBLE)
                                THEN CASE WHEN (0.9937691246529855::DOUBLE) * x::DOUBLE + (0.11145818447489109::DOUBLE) * y::DOUBLE >= (11.496113655765528::DOUBLE)
                                  THEN CASE WHEN (0.20879004432497614::DOUBLE) * x::DOUBLE + (-0.9779604886654544::DOUBLE) * y::DOUBLE >= (-0.47942485720443306::DOUBLE)
                                    THEN 934
                                    ELSE 929
                                  END
                                  ELSE CASE WHEN (0.7018351229154958::DOUBLE) * x::DOUBLE + (-0.7123394276903329::DOUBLE) * y::DOUBLE >= (5.8322094282783965::DOUBLE)
                                    THEN 934
                                    ELSE 920
                                  END
                                END
                                ELSE CASE WHEN (0.9987401266812819::DOUBLE) * x::DOUBLE + (0.050181264996579274::DOUBLE) * y::DOUBLE >= (11.352966350625822::DOUBLE)
                                  THEN 934
                                  ELSE 916
                                END
                              END
                              ELSE CASE WHEN (0.33315775956362503::DOUBLE) * x::DOUBLE + (-0.9428710978933154::DOUBLE) * y::DOUBLE >= (0.8482751028245819::DOUBLE)
                                THEN CASE WHEN (0.34049537110498246::DOUBLE) * x::DOUBLE + (0.9402461923645744::DOUBLE) * y::DOUBLE >= (6.698557832085552::DOUBLE)
                                  THEN CASE WHEN (0.1984355081570313::DOUBLE) * x::DOUBLE + (-0.9801139469992561::DOUBLE) * y::DOUBLE >= (-0.7709850394969195::DOUBLE)
                                    THEN 929
                                    ELSE 926
                                  END
                                  ELSE CASE WHEN (0.9937691246529855::DOUBLE) * x::DOUBLE + (0.11145818447489109::DOUBLE) * y::DOUBLE >= (11.496113655765528::DOUBLE)
                                    THEN 929
                                    ELSE 920
                                  END
                                END
                                ELSE CASE WHEN (0.9493212499538544::DOUBLE) * x::DOUBLE + (0.3143074360972891::DOUBLE) * y::DOUBLE >= (11.60915536919514::DOUBLE)
                                  THEN 926
                                  ELSE 915
                                END
                              END
                            END
                            ELSE CASE WHEN (0.9906880109096047::DOUBLE) * x::DOUBLE + (-0.1361516251829959::DOUBLE) * y::DOUBLE >= (10.486185050002655::DOUBLE)
                              THEN CASE WHEN (0.39208891604625346::DOUBLE) * x::DOUBLE + (0.919927324256473::DOUBLE) * y::DOUBLE >= (7.145886816796224::DOUBLE)
                                THEN 915
                                ELSE CASE WHEN (0.6436968778320076::DOUBLE) * x::DOUBLE + (0.7652805560507372::DOUBLE) * y::DOUBLE >= (9.311850431279277::DOUBLE)
                                  THEN CASE WHEN (0.4374798294065137::DOUBLE) * x::DOUBLE + (-0.8992282240134857::DOUBLE) * y::DOUBLE >= (2.2565084640851096::DOUBLE)
                                    THEN 916
                                    ELSE 910
                                  END
                                  ELSE CASE WHEN (0.9859419531820408::DOUBLE) * x::DOUBLE + (-0.16708819514131584::DOUBLE) * y::DOUBLE >= (10.420434436664033::DOUBLE)
                                    THEN 916
                                    ELSE 905
                                  END
                                END
                              END
                              ELSE CASE WHEN (0.7486745465584967::DOUBLE) * x::DOUBLE + (0.6629377220640181::DOUBLE) * y::DOUBLE >= (10.064286308026153::DOUBLE)
                                THEN CASE WHEN (0.3097565569247337::DOUBLE) * x::DOUBLE + (-0.9508158998681786::DOUBLE) * y::DOUBLE >= (0.6207192573646498::DOUBLE)
                                  THEN 905
                                  ELSE 899
                                END
                                ELSE CASE WHEN (0.9963333590445109::DOUBLE) * x::DOUBLE + (-0.0855560497865671::DOUBLE) * y::DOUBLE >= (10.594434812535933::DOUBLE)
                                  THEN 905
                                  ELSE 888
                                END
                              END
                            END
                          END
                          ELSE CASE WHEN (0.9973036792869777::DOUBLE) * x::DOUBLE + (0.07338508895311802::DOUBLE) * y::DOUBLE >= (11.268537443456875::DOUBLE)
                            THEN CASE WHEN (0.9212005978141152::DOUBLE) * x::DOUBLE + (-0.38908798309240633::DOUBLE) * y::DOUBLE >= (8.991147274470698::DOUBLE)
                              THEN CASE WHEN (0.9493212499538544::DOUBLE) * x::DOUBLE + (0.3143074360972891::DOUBLE) * y::DOUBLE >= (11.60915536919514::DOUBLE)
                                THEN CASE WHEN (0.059551360632934286::DOUBLE) * x::DOUBLE + (0.998225242841898::DOUBLE) * y::DOUBLE >= (3.905661723475859::DOUBLE)
                                  THEN 927
                                  ELSE 926
                                END
                                ELSE CASE WHEN (0.535850370278946::DOUBLE) * x::DOUBLE + (0.8443129637000231::DOUBLE) * y::DOUBLE >= (8.718419811325555::DOUBLE)
                                  THEN 927
                                  ELSE 915
                                END
                              END
                              ELSE CASE WHEN (0.7522774381625641::DOUBLE) * x::DOUBLE + (0.6588464586165501::DOUBLE) * y::DOUBLE >= (10.493833799258503::DOUBLE)
                                THEN CASE WHEN (0.11505163962055374::DOUBLE) * x::DOUBLE + (-0.993359512070339::DOUBLE) * y::DOUBLE >= (-1.9553241575358016::DOUBLE)
                                  THEN 915
                                  ELSE 913
                                END
                                ELSE CASE WHEN (0.7294859886380981::DOUBLE) * x::DOUBLE + (-0.6839957546510772::DOUBLE) * y::DOUBLE >= (5.871304971735189::DOUBLE)
                                  THEN 915
                                  ELSE 904
                                END
                              END
                            END
                            ELSE CASE WHEN (0.34272911642010767::DOUBLE) * x::DOUBLE + (-0.9394342727183698::DOUBLE) * y::DOUBLE >= (0.8627889112367626::DOUBLE)
                              THEN CASE WHEN (0.56023897664329::DOUBLE) * x::DOUBLE + (0.8283310262507853::DOUBLE) * y::DOUBLE >= (8.665436225921995::DOUBLE)
                                THEN 907
                                ELSE 899
                              END
                              ELSE CASE WHEN (0.5541300188415997::DOUBLE) * x::DOUBLE + (0.8324301305326521::DOUBLE) * y::DOUBLE >= (8.7150733080186::DOUBLE)
                                THEN CASE WHEN (0.2852994584196151::DOUBLE) * x::DOUBLE + (-0.9584384273522604::DOUBLE) * y::DOUBLE >= (0.07533979374078381::DOUBLE)
                                  THEN 907
                                  ELSE 904
                                END
                                ELSE CASE WHEN (0.9849243679901529::DOUBLE) * x::DOUBLE + (-0.17298551771520554::DOUBLE) * y::DOUBLE >= (10.23406726136348::DOUBLE)
                                  THEN 907
                                  ELSE 892
                                END
                              END
                            END
                          END
                        END
                        ELSE CASE WHEN (0.9888178624831343::DOUBLE) * x::DOUBLE + (0.14912824961852583::DOUBLE) * y::DOUBLE >= (10.892955484157106::DOUBLE)
                          THEN CASE WHEN (0.20566646547090145::DOUBLE) * x::DOUBLE + (-0.9786221461732342::DOUBLE) * y::DOUBLE >= (-0.7176562777761077::DOUBLE)
                            THEN CASE WHEN (0.4870487149018082::DOUBLE) * x::DOUBLE + (0.8733748046013792::DOUBLE) * y::DOUBLE >= (7.768423885668126::DOUBLE)
                              THEN CASE WHEN (0.26613360353787935::DOUBLE) * x::DOUBLE + (-0.963936151966479::DOUBLE) * y::DOUBLE >= (0.009327884915262707::DOUBLE)
                                THEN CASE WHEN (0.7486745465584967::DOUBLE) * x::DOUBLE + (0.6629377220640181::DOUBLE) * y::DOUBLE >= (10.064286308026153::DOUBLE)
                                  THEN 899
                                  ELSE 888
                                END
                                ELSE CASE WHEN (0.9155777024638366::DOUBLE) * x::DOUBLE + (-0.40214110800941794::DOUBLE) * y::DOUBLE >= (8.700188637053856::DOUBLE)
                                  THEN 899
                                  ELSE 884
                                END
                              END
                              ELSE CASE WHEN (0.9836354126391711::DOUBLE) * x::DOUBLE + (0.18017040545596705::DOUBLE) * y::DOUBLE >= (11.034630357285893::DOUBLE)
                                THEN 888
                                ELSE 876
                              END
                            END
                            ELSE CASE WHEN (0.16432118535873605::DOUBLE) * x::DOUBLE + (-0.9864068876697384::DOUBLE) * y::DOUBLE >= (-1.3722016234526957::DOUBLE)
                              THEN CASE WHEN (0.9924091548448684::DOUBLE) * x::DOUBLE + (-0.12297995519634157::DOUBLE) * y::DOUBLE >= (10.183679145857452::DOUBLE)
                                THEN CASE WHEN (0.8794944439776642::DOUBLE) * x::DOUBLE + (0.4759091541590887::DOUBLE) * y::DOUBLE >= (10.973709287848136::DOUBLE)
                                  THEN CASE WHEN (0.34272911642010767::DOUBLE) * x::DOUBLE + (-0.9394342727183698::DOUBLE) * y::DOUBLE >= (0.8627889112367626::DOUBLE)
                                    THEN 899
                                    ELSE 892
                                  END
                                  ELSE CASE WHEN (0.9155777024638366::DOUBLE) * x::DOUBLE + (-0.40214110800941794::DOUBLE) * y::DOUBLE >= (8.700188637053856::DOUBLE)
                                    THEN 899
                                    ELSE 884
                                  END
                                END
                                ELSE 873
                              END
                              ELSE CASE WHEN (0.5818723911214871::DOUBLE) * x::DOUBLE + (0.8132800996277747::DOUBLE) * y::DOUBLE >= (8.773966671524125::DOUBLE)
                                THEN CASE WHEN (0.7353300435446087::DOUBLE) * x::DOUBLE + (-0.677709175871689::DOUBLE) * y::DOUBLE >= (5.751536597483829::DOUBLE)
                                  THEN CASE WHEN (0.5541300188415997::DOUBLE) * x::DOUBLE + (0.8324301305326521::DOUBLE) * y::DOUBLE >= (8.7150733080186::DOUBLE)
                                    THEN 904
                                    ELSE 892
                                  END
                                  ELSE CASE WHEN (0.998257936083099::DOUBLE) * x::DOUBLE + (-0.05900078852957293::DOUBLE) * y::DOUBLE >= (10.616459785367256::DOUBLE)
                                    THEN 904
                                    ELSE 881
                                  END
                                END
                                ELSE 873
                              END
                            END
                          END
                          ELSE CASE WHEN (0.20566646547090145::DOUBLE) * x::DOUBLE + (-0.9786221461732342::DOUBLE) * y::DOUBLE >= (-0.7176562777761077::DOUBLE)
                            THEN CASE WHEN (0.8748958263979788::DOUBLE) * x::DOUBLE + (-0.48431115303221967::DOUBLE) * y::DOUBLE >= (7.739590076588439::DOUBLE)
                              THEN CASE WHEN (0.28219378342554224::DOUBLE) * x::DOUBLE + (-0.9593574248401783::DOUBLE) * y::DOUBLE >= (0.21237278754156108::DOUBLE)
                                THEN CASE WHEN (0.6628022919115282::DOUBLE) * x::DOUBLE + (0.7487944456503569::DOUBLE) * y::DOUBLE >= (9.049875286404662::DOUBLE)
                                  THEN 876
                                  ELSE 866
                                END
                                ELSE CASE WHEN (0.7748080129182926::DOUBLE) * x::DOUBLE + (-0.6321966016340224::DOUBLE) * y::DOUBLE >= (6.285188525179766::DOUBLE)
                                  THEN 876
                                  ELSE 860
                                END
                              END
                              ELSE CASE WHEN (0.5318619279019265::DOUBLE) * x::DOUBLE + (0.8468310868458042::DOUBLE) * y::DOUBLE >= (7.950518895549412::DOUBLE)
                                THEN 860
                                ELSE 852
                              END
                            END
                            ELSE CASE WHEN (0.9665516078196092::DOUBLE) * x::DOUBLE + (0.2564722000945293::DOUBLE) * y::DOUBLE >= (10.834371936809308::DOUBLE)
                              THEN CASE WHEN (0.20987844339250525::DOUBLE) * x::DOUBLE + (0.9777274870837676::DOUBLE) * y::DOUBLE >= (5.329114805365681::DOUBLE)
                                THEN CASE WHEN (0.2366153049330149::DOUBLE) * x::DOUBLE + (-0.9716034157368203::DOUBLE) * y::DOUBLE >= (-0.6716358596489256::DOUBLE)
                                  THEN 873
                                  ELSE 864
                                END
                                ELSE CASE WHEN (0.9108905710800114::DOUBLE) * x::DOUBLE + (0.41264799468497443::DOUBLE) * y::DOUBLE >= (10.790538841567992::DOUBLE)
                                  THEN 873
                                  ELSE 860
                                END
                              END
                              ELSE CASE WHEN (0.06674816630738345::DOUBLE) * x::DOUBLE + (-0.9977698543725412::DOUBLE) * y::DOUBLE >= (-2.5198052988206574::DOUBLE)
                                THEN CASE WHEN (0.9490717400974409::DOUBLE) * x::DOUBLE + (-0.3150600453063124::DOUBLE) * y::DOUBLE >= (8.796354069234269::DOUBLE)
                                  THEN 860
                                  ELSE 849
                                END
                                ELSE CASE WHEN (0.5666627911864095::DOUBLE) * x::DOUBLE + (-0.8239498049546633::DOUBLE) * y::DOUBLE >= (3.2066161764492143::DOUBLE)
                                  THEN 860
                                  ELSE 846
                                END
                              END
                            END
                          END
                        END
                      END
                    END
                  END
                  ELSE CASE WHEN (0.19248274869219148::DOUBLE) * x::DOUBLE + (0.9813003574114803::DOUBLE) * y::DOUBLE >= (4.0892952923794965::DOUBLE)
                    THEN CASE WHEN (0.877296917570916::DOUBLE) * x::DOUBLE + (0.4799480372087892::DOUBLE) * y::DOUBLE >= (9.760357668574587::DOUBLE)
                      THEN CASE WHEN (0.5162005190871621::DOUBLE) * x::DOUBLE + (-0.8564677601020043::DOUBLE) * y::DOUBLE >= (2.825953535755205::DOUBLE)
                        THEN CASE WHEN (0.9616801502221439::DOUBLE) * x::DOUBLE + (-0.2741738292921382::DOUBLE) * y::DOUBLE >= (9.021676470941708::DOUBLE)
                          THEN CASE WHEN (0.053687842961628554::DOUBLE) * x::DOUBLE + (0.9985577677421209::DOUBLE) * y::DOUBLE >= (3.021688639041104::DOUBLE)
                            THEN CASE WHEN (0.5318619279019265::DOUBLE) * x::DOUBLE + (0.8468310868458042::DOUBLE) * y::DOUBLE >= (7.950518895549412::DOUBLE)
                              THEN 860
                              ELSE CASE WHEN (0.6828648102041842::DOUBLE) * x::DOUBLE + (0.730544763162945::DOUBLE) * y::DOUBLE >= (8.951591398982277::DOUBLE)
                                THEN CASE WHEN (0.08624691098056814::DOUBLE) * x::DOUBLE + (-0.9962737928633424::DOUBLE) * y::DOUBLE >= (-1.797467304832563::DOUBLE)
                                  THEN CASE WHEN (0.9641866583313865::DOUBLE) * x::DOUBLE + (-0.265224598964263::DOUBLE) * y::DOUBLE >= (9.297583639370005::DOUBLE)
                                    THEN CASE WHEN (0.37420296952797644::DOUBLE) * x::DOUBLE + (0.9273468270266764::DOUBLE) * y::DOUBLE >= (6.331475300023289::DOUBLE)
                                      THEN 866
                                      ELSE 861
                                    END
                                    ELSE CASE WHEN (0.8866144222785339::DOUBLE) * x::DOUBLE + (0.4625093147253375::DOUBLE) * y::DOUBLE >= (10.416584128062604::DOUBLE)
                                      THEN 866
                                      ELSE 854
                                    END
                                  END
                                  ELSE CASE WHEN (0.8748958263979788::DOUBLE) * x::DOUBLE + (-0.48431115303221967::DOUBLE) * y::DOUBLE >= (7.739590076588439::DOUBLE)
                                    THEN 866
                                    ELSE 852
                                  END
                                END
                                ELSE CASE WHEN (0.9641866583313865::DOUBLE) * x::DOUBLE + (-0.265224598964263::DOUBLE) * y::DOUBLE >= (9.297583639370005::DOUBLE)
                                  THEN 861
                                  ELSE CASE WHEN (0.017703176738081666::DOUBLE) * x::DOUBLE + (-0.9998432864871276::DOUBLE) * y::DOUBLE >= (-2.3966989370107235::DOUBLE)
                                    THEN CASE WHEN (0.8800579427375724::DOUBLE) * x::DOUBLE + (0.4748663153188608::DOUBLE) * y::DOUBLE >= (10.178234686195673::DOUBLE)
                                      THEN 854
                                      ELSE 842
                                    END
                                    ELSE CASE WHEN (0.8942686394949638::DOUBLE) * x::DOUBLE + (-0.4475305580804803::DOUBLE) * y::DOUBLE >= (7.9455976572214935::DOUBLE)
                                      THEN 854
                                      ELSE 841
                                    END
                                  END
                                END
                              END
                            END
                            ELSE CASE WHEN (0.32885383392886086::DOUBLE) * x::DOUBLE + (0.9443808320324429::DOUBLE) * y::DOUBLE >= (5.593420910444699::DOUBLE)
                              THEN CASE WHEN (0.7572020430444009::DOUBLE) * x::DOUBLE + (-0.6531807299740138::DOUBLE) * y::DOUBLE >= (6.12837660940521::DOUBLE)
                                THEN CASE WHEN (0.6746318157213703::DOUBLE) * x::DOUBLE + (0.7381543965976812::DOUBLE) * y::DOUBLE >= (8.788009596416876::DOUBLE)
                                  THEN CASE WHEN (0.1908070953190644::DOUBLE) * x::DOUBLE + (-0.9816275527795161::DOUBLE) * y::DOUBLE >= (-0.41841262682883196::DOUBLE)
                                    THEN 863
                                    ELSE 861
                                  END
                                  ELSE CASE WHEN (0.9999881185152805::DOUBLE) * x::DOUBLE + (0.004874713147397808::DOUBLE) * y::DOUBLE >= (10.368987920315112::DOUBLE)
                                    THEN 863
                                    ELSE 853
                                  END
                                END
                                ELSE 842
                              END
                              ELSE CASE WHEN (0.6380238588707624::DOUBLE) * x::DOUBLE + (-0.7700165943092794::DOUBLE) * y::DOUBLE >= (4.717735463173156::DOUBLE)
                                THEN CASE WHEN (0.44106595339672455::DOUBLE) * x::DOUBLE + (0.8974746930996096::DOUBLE) * y::DOUBLE >= (6.551714794470474::DOUBLE)
                                  THEN CASE WHEN (0.5430792105920301::DOUBLE) * x::DOUBLE + (-0.8396814699770011::DOUBLE) * y::DOUBLE >= (3.750488760215166::DOUBLE)
                                    THEN CASE WHEN (0.02710137287345384::DOUBLE) * x::DOUBLE + (0.9996326903359924::DOUBLE) * y::DOUBLE >= (2.512711588396249::DOUBLE)
                                      THEN 863
                                      ELSE 862
                                    END
                                    ELSE CASE WHEN (0.9999881185152805::DOUBLE) * x::DOUBLE + (0.004874713147397808::DOUBLE) * y::DOUBLE >= (10.368987920315112::DOUBLE)
                                      THEN 863
                                      ELSE 853
                                    END
                                  END
                                  ELSE CASE WHEN (0.9417745845468898::DOUBLE) * x::DOUBLE + (-0.33624489869964314::DOUBLE) * y::DOUBLE >= (8.989569949355097::DOUBLE)
                                    THEN 862
                                    ELSE 848
                                  END
                                END
                                ELSE CASE WHEN (0.9770230331300644::DOUBLE) * x::DOUBLE + (0.21313374376979577::DOUBLE) * y::DOUBLE >= (10.428425653128617::DOUBLE)
                                  THEN 853
                                  ELSE 838
                                END
                              END
                            END
                          END
                          ELSE CASE WHEN (0.7922385189128913::DOUBLE) * x::DOUBLE + (0.610211544589832::DOUBLE) * y::DOUBLE >= (9.403002189520208::DOUBLE)
                            THEN CASE WHEN (0.5898809113440788::DOUBLE) * x::DOUBLE + (0.8074902540785733::DOUBLE) * y::DOUBLE >= (7.9602857605665385::DOUBLE)
                              THEN CASE WHEN (0.6828648102041842::DOUBLE) * x::DOUBLE + (0.730544763162945::DOUBLE) * y::DOUBLE >= (8.951591398982277::DOUBLE)
                                THEN 852
                                ELSE CASE WHEN (0.992948296462721::DOUBLE) * x::DOUBLE + (-0.11854822036530233::DOUBLE) * y::DOUBLE >= (9.657904243607858::DOUBLE)
                                  THEN CASE WHEN (0.017703176738081666::DOUBLE) * x::DOUBLE + (-0.9998432864871276::DOUBLE) * y::DOUBLE >= (-2.3966989370107235::DOUBLE)
                                    THEN 842
                                    ELSE 841
                                  END
                                  ELSE CASE WHEN (0.6252631272433277::DOUBLE) * x::DOUBLE + (-0.7804140066079633::DOUBLE) * y::DOUBLE >= (4.2644630929239735::DOUBLE)
                                    THEN 842
                                    ELSE 832
                                  END
                                END
                              END
                              ELSE CASE WHEN (0.29891211992883715::DOUBLE) * x::DOUBLE + (-0.9542806424525483::DOUBLE) * y::DOUBLE >= (0.6075731974361855::DOUBLE)
                                THEN CASE WHEN (0.9076852193629784::DOUBLE) * x::DOUBLE + (-0.4196516919422366::DOUBLE) * y::DOUBLE >= (8.080466308578751::DOUBLE)
                                  THEN CASE WHEN (0.32885383392886086::DOUBLE) * x::DOUBLE + (0.9443808320324429::DOUBLE) * y::DOUBLE >= (5.593420910444699::DOUBLE)
                                    THEN 842
                                    ELSE 838
                                  END
                                  ELSE CASE WHEN (0.877693794926983::DOUBLE) * x::DOUBLE + (0.47922187173236475::DOUBLE) * y::DOUBLE >= (9.965310822445462::DOUBLE)
                                    THEN 842
                                    ELSE 829
                                  END
                                END
                                ELSE CASE WHEN (0.9822637199945001::DOUBLE) * x::DOUBLE + (-0.18750462496313625::DOUBLE) * y::DOUBLE >= (9.347866437265482::DOUBLE)
                                  THEN 842
                                  ELSE 824
                                END
                              END
                            END
                            ELSE CASE WHEN (0.9968102437760541::DOUBLE) * x::DOUBLE + (0.07980813181076027::DOUBLE) * y::DOUBLE >= (9.993618080751345::DOUBLE)
                              THEN CASE WHEN (0.29891211992883715::DOUBLE) * x::DOUBLE + (-0.9542806424525483::DOUBLE) * y::DOUBLE >= (0.6075731974361855::DOUBLE)
                                THEN CASE WHEN (0.2998545542089949::DOUBLE) * x::DOUBLE + (0.9539849298181419::DOUBLE) * y::DOUBLE >= (5.151945344291573::DOUBLE)
                                  THEN CASE WHEN (0.9076852193629784::DOUBLE) * x::DOUBLE + (-0.4196516919422366::DOUBLE) * y::DOUBLE >= (8.080466308578751::DOUBLE)
                                    THEN 838
                                    ELSE 829
                                  END
                                  ELSE CASE WHEN (0.8329798690790025::DOUBLE) * x::DOUBLE + (0.5533032963114606::DOUBLE) * y::DOUBLE >= (9.547612400896547::DOUBLE)
                                    THEN 838
                                    ELSE 823
                                  END
                                END
                                ELSE 824
                              END
                              ELSE CASE WHEN (0.9714575395229121::DOUBLE) * x::DOUBLE + (-0.23721350910959868::DOUBLE) * y::DOUBLE >= (8.911851547708947::DOUBLE)
                                THEN CASE WHEN (0.6120244335881092::DOUBLE) * x::DOUBLE + (0.790838853807243::DOUBLE) * y::DOUBLE >= (7.947785478758005::DOUBLE)
                                  THEN 824
                                  ELSE 814
                                END
                                ELSE CASE WHEN (0.43721349253569075::DOUBLE) * x::DOUBLE + (0.8993577496996084::DOUBLE) * y::DOUBLE >= (6.507092523140263::DOUBLE)
                                  THEN CASE WHEN (0.11993245887099158::DOUBLE) * x::DOUBLE + (-0.9927820532771319::DOUBLE) * y::DOUBLE >= (-1.2906374097814792::DOUBLE)
                                    THEN 814
                                    ELSE 812
                                  END
                                  ELSE CASE WHEN (0.6480703220896695::DOUBLE) * x::DOUBLE + (-0.7615804997678132::DOUBLE) * y::DOUBLE >= (4.447662565316738::DOUBLE)
                                    THEN 814
                                    ELSE 808
                                  END
                                END
                              END
                            END
                          END
                        END
                        ELSE CASE WHEN (0.9996844647059202::DOUBLE) * x::DOUBLE + (-0.02511913664197185::DOUBLE) * y::DOUBLE >= (9.801313596208006::DOUBLE)
                          THEN CASE WHEN (0.447884064237936::DOUBLE) * x::DOUBLE + (0.8940916423956262::DOUBLE) * y::DOUBLE >= (7.0838466744581305::DOUBLE)
                            THEN CASE WHEN (0.3869636998658926::DOUBLE) * x::DOUBLE + (-0.9220949490080179::DOUBLE) * y::DOUBLE >= (1.0562822706282113::DOUBLE)
                              THEN CASE WHEN (0.7245712283579152::DOUBLE) * x::DOUBLE + (0.6891999238507662::DOUBLE) * y::DOUBLE >= (9.376745314851533::DOUBLE)
                                THEN CASE WHEN (0.28293783842834097::DOUBLE) * x::DOUBLE + (-0.9591382484217268::DOUBLE) * y::DOUBLE >= (0.06829213618025376::DOUBLE)
                                  THEN CASE WHEN (0.5318619279019265::DOUBLE) * x::DOUBLE + (0.8468310868458042::DOUBLE) * y::DOUBLE >= (7.950518895549412::DOUBLE)
                                    THEN 860
                                    ELSE 852
                                  END
                                  ELSE CASE WHEN (0.9490717400974409::DOUBLE) * x::DOUBLE + (-0.3150600453063124::DOUBLE) * y::DOUBLE >= (8.796354069234269::DOUBLE)
                                    THEN 860
                                    ELSE 849
                                  END
                                END
                                ELSE CASE WHEN (0.9161066778514929::DOUBLE) * x::DOUBLE + (-0.40093460164458344::DOUBLE) * y::DOUBLE >= (8.133306878787927::DOUBLE)
                                  THEN 852
                                  ELSE 834
                                END
                              END
                              ELSE CASE WHEN (0.8056826364155552::DOUBLE) * x::DOUBLE + (0.5923474397500847::DOUBLE) * y::DOUBLE >= (10.003736389349333::DOUBLE)
                                THEN CASE WHEN (0.06674816630738345::DOUBLE) * x::DOUBLE + (-0.9977698543725412::DOUBLE) * y::DOUBLE >= (-2.5198052988206574::DOUBLE)
                                  THEN 849
                                  ELSE 846
                                END
                                ELSE CASE WHEN (0.9651904082096918::DOUBLE) * x::DOUBLE + (-0.26154822863098914::DOUBLE) * y::DOUBLE >= (8.877746797545406::DOUBLE)
                                  THEN 849
                                  ELSE 827
                                END
                              END
                            END
                            ELSE CASE WHEN (0.7471148735987373::DOUBLE) * x::DOUBLE + (0.6646949417947625::DOUBLE) * y::DOUBLE >= (9.331339216346779::DOUBLE)
                              THEN CASE WHEN (0.13182140040071907::DOUBLE) * x::DOUBLE + (0.9912734831500303::DOUBLE) * y::DOUBLE >= (4.0880995305794485::DOUBLE)
                                THEN CASE WHEN (0.39184180774346117::DOUBLE) * x::DOUBLE + (-0.9200326068701784::DOUBLE) * y::DOUBLE >= (1.3780190025636303::DOUBLE)
                                  THEN CASE WHEN (0.6828648102041842::DOUBLE) * x::DOUBLE + (0.730544763162945::DOUBLE) * y::DOUBLE >= (8.951591398982277::DOUBLE)
                                    THEN 852
                                    ELSE 841
                                  END
                                  ELSE CASE WHEN (0.9161066778514929::DOUBLE) * x::DOUBLE + (-0.40093460164458344::DOUBLE) * y::DOUBLE >= (8.133306878787927::DOUBLE)
                                    THEN 852
                                    ELSE 834
                                  END
                                END
                                ELSE CASE WHEN (0.992948296462721::DOUBLE) * x::DOUBLE + (-0.11854822036530233::DOUBLE) * y::DOUBLE >= (9.657904243607858::DOUBLE)
                                  THEN 841
                                  ELSE 832
                                END
                              END
                              ELSE CASE WHEN (0.7218981318149883::DOUBLE) * x::DOUBLE + (0.6919993405213835::DOUBLE) * y::DOUBLE >= (9.002880812010268::DOUBLE)
                                THEN CASE WHEN (0.5712613202723639::DOUBLE) * x::DOUBLE + (-0.8207682401023296::DOUBLE) * y::DOUBLE >= (3.4221127626524743::DOUBLE)
                                  THEN 832
                                  ELSE 825
                                END
                                ELSE CASE WHEN (0.9887400877001608::DOUBLE) * x::DOUBLE + (-0.14964303851057745::DOUBLE) * y::DOUBLE >= (9.361569078124061::DOUBLE)
                                  THEN 832
                                  ELSE 821
                                END
                              END
                            END
                          END
                          ELSE CASE WHEN (0.6814063619268442::DOUBLE) * x::DOUBLE + (-0.7319053012006559::DOUBLE) * y::DOUBLE >= (4.529870341530109::DOUBLE)
                            THEN CASE WHEN (0.5911912248304505::DOUBLE) * x::DOUBLE + (0.8065314226262185::DOUBLE) * y::DOUBLE >= (8.00630107689519::DOUBLE)
                              THEN CASE WHEN (0.5716874474577408::DOUBLE) * x::DOUBLE + (0.8204714878770942::DOUBLE) * y::DOUBLE >= (8.11007091655331::DOUBLE)
                                THEN 827
                                ELSE CASE WHEN (0.12372794807240506::DOUBLE) * x::DOUBLE + (-0.9923161768639026::DOUBLE) * y::DOUBLE >= (-1.5841569250240144::DOUBLE)
                                  THEN CASE WHEN (0.7218981318149883::DOUBLE) * x::DOUBLE + (0.6919993405213835::DOUBLE) * y::DOUBLE >= (9.002880812010268::DOUBLE)
                                    THEN 825
                                    ELSE 821
                                  END
                                  ELSE CASE WHEN (0.7528087473525746::DOUBLE) * x::DOUBLE + (-0.6582393105166596::DOUBLE) * y::DOUBLE >= (5.504108478869151::DOUBLE)
                                    THEN 825
                                    ELSE 816
                                  END
                                END
                              END
                              ELSE CASE WHEN (0.9887400877001608::DOUBLE) * x::DOUBLE + (-0.14964303851057745::DOUBLE) * y::DOUBLE >= (9.361569078124061::DOUBLE)
                                THEN 832
                                ELSE CASE WHEN (0.5602901018801584::DOUBLE) * x::DOUBLE + (-0.8282964455647035::DOUBLE) * y::DOUBLE >= (3.21522423959795::DOUBLE)
                                  THEN CASE WHEN (0.39888758322339063::DOUBLE) * x::DOUBLE + (0.9169998342149264::DOUBLE) * y::DOUBLE >= (6.311183470583042::DOUBLE)
                                    THEN 821
                                    ELSE 812
                                  END
                                  ELSE CASE WHEN (0.9805167625255675::DOUBLE) * x::DOUBLE + (-0.19643543062894697::DOUBLE) * y::DOUBLE >= (8.971886606920647::DOUBLE)
                                    THEN 821
                                    ELSE 805
                                  END
                                END
                              END
                            END
                            ELSE CASE WHEN (0.5716874474577408::DOUBLE) * x::DOUBLE + (0.8204714878770942::DOUBLE) * y::DOUBLE >= (8.11007091655331::DOUBLE)
                              THEN CASE WHEN (0.8250788274548827::DOUBLE) * x::DOUBLE + (0.5650176355527993::DOUBLE) * y::DOUBLE >= (9.806080285723443::DOUBLE)
                                THEN CASE WHEN (0.6596069218027086::DOUBLE) * x::DOUBLE + (-0.7516107428117::DOUBLE) * y::DOUBLE >= (4.048885279990723::DOUBLE)
                                  THEN 827
                                  ELSE 817
                                END
                                ELSE CASE WHEN (0.9926187880006301::DOUBLE) * x::DOUBLE + (-0.1212763031600161::DOUBLE) * y::DOUBLE >= (9.27398227677146::DOUBLE)
                                  THEN 827
                                  ELSE 800
                                END
                              END
                              ELSE CASE WHEN (0.5878542364346386::DOUBLE) * x::DOUBLE + (-0.8089668699680155::DOUBLE) * y::DOUBLE >= (3.1998264048422764::DOUBLE)
                                THEN CASE WHEN (0.22900654857794905::DOUBLE) * x::DOUBLE + (-0.9734248819032806::DOUBLE) * y::DOUBLE >= (-0.5608915437223176::DOUBLE)
                                  THEN CASE WHEN (0.5911912248304505::DOUBLE) * x::DOUBLE + (0.8065314226262185::DOUBLE) * y::DOUBLE >= (8.00630107689519::DOUBLE)
                                    THEN 816
                                    ELSE 805
                                  END
                                  ELSE CASE WHEN (0.9995722114785418::DOUBLE) * x::DOUBLE + (-0.029247120198357405::DOUBLE) * y::DOUBLE >= (9.569682444329633::DOUBLE)
                                    THEN 816
                                    ELSE 801
                                  END
                                END
                                ELSE CASE WHEN (0.7661438369966213::DOUBLE) * x::DOUBLE + (0.6426691380734683::DOUBLE) * y::DOUBLE >= (9.256455175008515::DOUBLE)
                                  THEN CASE WHEN (0.06091945463810781::DOUBLE) * x::DOUBLE + (-0.9981426852141908::DOUBLE) * y::DOUBLE >= (-2.472370568808648::DOUBLE)
                                    THEN 801
                                    ELSE 800
                                  END
                                  ELSE CASE WHEN (0.8518721962832313::DOUBLE) * x::DOUBLE + (-0.5237497123622924::DOUBLE) * y::DOUBLE >= (6.50563081850407::DOUBLE)
                                    THEN 801
                                    ELSE 786
                                  END
                                END
                              END
                            END
                          END
                        END
                      END
                      ELSE CASE WHEN (0.9341935789648234::DOUBLE) * x::DOUBLE + (-0.35676653012985143::DOUBLE) * y::DOUBLE >= (7.816739222040773::DOUBLE)
                        THEN CASE WHEN (0.25232350919538::DOUBLE) * x::DOUBLE + (0.9676429334766669::DOUBLE) * y::DOUBLE >= (4.825933651201727::DOUBLE)
                          THEN CASE WHEN (0.43721349253569075::DOUBLE) * x::DOUBLE + (0.8993577496996084::DOUBLE) * y::DOUBLE >= (6.507092523140263::DOUBLE)
                            THEN CASE WHEN (0.7785119932224591::DOUBLE) * x::DOUBLE + (-0.627629728748403::DOUBLE) * y::DOUBLE >= (5.737286399568638::DOUBLE)
                              THEN CASE WHEN (0.26259620062856925::DOUBLE) * x::DOUBLE + (0.9649058168626824::DOUBLE) * y::DOUBLE >= (5.091966362541777::DOUBLE)
                                THEN CASE WHEN (0.5602901018801584::DOUBLE) * x::DOUBLE + (-0.8282964455647035::DOUBLE) * y::DOUBLE >= (3.21522423959795::DOUBLE)
                                  THEN 812
                                  ELSE 805
                                END
                                ELSE CASE WHEN (0.9938933770704073::DOUBLE) * x::DOUBLE + (-0.11034470995739357::DOUBLE) * y::DOUBLE >= (9.304018465472497::DOUBLE)
                                  THEN 812
                                  ELSE 802
                                END
                              END
                              ELSE CASE WHEN (0.5108867946081618::DOUBLE) * x::DOUBLE + (0.8596479995294571::DOUBLE) * y::DOUBLE >= (7.276493007209208::DOUBLE)
                                THEN CASE WHEN (0.22900654857794905::DOUBLE) * x::DOUBLE + (-0.9734248819032806::DOUBLE) * y::DOUBLE >= (-0.5608915437223176::DOUBLE)
                                  THEN 805
                                  ELSE 801
                                END
                                ELSE CASE WHEN (0.9842118429769998::DOUBLE) * x::DOUBLE + (0.17699448619608898::DOUBLE) * y::DOUBLE >= (9.85686504589477::DOUBLE)
                                  THEN 805
                                  ELSE 790
                                END
                              END
                            END
                            ELSE CASE WHEN (0.7785119932224591::DOUBLE) * x::DOUBLE + (-0.627629728748403::DOUBLE) * y::DOUBLE >= (5.737286399568638::DOUBLE)
                              THEN CASE WHEN (0.6480703220896695::DOUBLE) * x::DOUBLE + (-0.7615804997678132::DOUBLE) * y::DOUBLE >= (4.447662565316738::DOUBLE)
                                THEN 814
                                ELSE CASE WHEN (0.7117731288966802::DOUBLE) * x::DOUBLE + (0.7024094340060005::DOUBLE) * y::DOUBLE >= (8.564939269831488::DOUBLE)
                                  THEN CASE WHEN (0.5844906369723757::DOUBLE) * x::DOUBLE + (-0.8114004531004566::DOUBLE) * y::DOUBLE >= (3.570198305540777::DOUBLE)
                                    THEN 808
                                    ELSE 802
                                  END
                                  ELSE CASE WHEN (0.9913984373516787::DOUBLE) * x::DOUBLE + (-0.13087833440508648::DOUBLE) * y::DOUBLE >= (9.16255328787252::DOUBLE)
                                    THEN 808
                                    ELSE 795
                                  END
                                END
                              END
                              ELSE CASE WHEN (0.38523679028516206::DOUBLE) * x::DOUBLE + (0.9228177585042381::DOUBLE) * y::DOUBLE >= (6.007418592307808::DOUBLE)
                                THEN CASE WHEN (0.15868657869618144::DOUBLE) * x::DOUBLE + (-0.9873290078498154::DOUBLE) * y::DOUBLE >= (-1.0658440028394298::DOUBLE)
                                  THEN 795
                                  ELSE 790
                                END
                                ELSE CASE WHEN (0.991283638576109::DOUBLE) * x::DOUBLE + (0.13174501087824855::DOUBLE) * y::DOUBLE >= (9.651357514475201::DOUBLE)
                                  THEN 795
                                  ELSE 780
                                END
                              END
                            END
                          END
                          ELSE CASE WHEN (0.9061117073198528::DOUBLE) * x::DOUBLE + (0.4230385016259175::DOUBLE) * y::DOUBLE >= (9.724119353685879::DOUBLE)
                            THEN CASE WHEN (0.024918633848617266::DOUBLE) * x::DOUBLE + (-0.9996894826330418::DOUBLE) * y::DOUBLE >= (-2.115543348845512::DOUBLE)
                              THEN CASE WHEN (0.5058144866926951::DOUBLE) * x::DOUBLE + (0.862642281048063::DOUBLE) * y::DOUBLE >= (6.904603689338236::DOUBLE)
                                THEN CASE WHEN (0.543574793551573::DOUBLE) * x::DOUBLE + (-0.8393607352118425::DOUBLE) * y::DOUBLE >= (3.412602231394774::DOUBLE)
                                  THEN CASE WHEN (0.2998545542089949::DOUBLE) * x::DOUBLE + (0.9539849298181419::DOUBLE) * y::DOUBLE >= (5.151945344291573::DOUBLE)
                                    THEN 829
                                    ELSE 823
                                  END
                                  ELSE CASE WHEN (0.9968102437760541::DOUBLE) * x::DOUBLE + (0.07980813181076027::DOUBLE) * y::DOUBLE >= (9.993618080751345::DOUBLE)
                                    THEN 829
                                    ELSE 814
                                  END
                                END
                                ELSE CASE WHEN (0.9618522804543448::DOUBLE) * x::DOUBLE + (-0.273569352422336::DOUBLE) * y::DOUBLE >= (8.78751292000398::DOUBLE)
                                  THEN 823
                                  ELSE 809
                                END
                              END
                              ELSE CASE WHEN (0.9913984373516787::DOUBLE) * x::DOUBLE + (-0.13087833440508648::DOUBLE) * y::DOUBLE >= (9.16255328787252::DOUBLE)
                                THEN CASE WHEN (0.6480703220896695::DOUBLE) * x::DOUBLE + (-0.7615804997678132::DOUBLE) * y::DOUBLE >= (4.447662565316738::DOUBLE)
                                  THEN 814
                                  ELSE 808
                                END
                                ELSE 795
                              END
                            END
                            ELSE CASE WHEN (0.0570309571008712::DOUBLE) * x::DOUBLE + (-0.998372410442195::DOUBLE) * y::DOUBLE >= (-1.8134870195572805::DOUBLE)
                              THEN CASE WHEN (0.6974256888057965::DOUBLE) * x::DOUBLE + (0.7166571067070779::DOUBLE) * y::DOUBLE >= (8.240918559666044::DOUBLE)
                                THEN CASE WHEN (0.0202805269546441::DOUBLE) * x::DOUBLE + (-0.9997943289629333::DOUBLE) * y::DOUBLE >= (-2.1594382126870224::DOUBLE)
                                  THEN CASE WHEN (0.9287766532961977::DOUBLE) * x::DOUBLE + (-0.3706398903139199::DOUBLE) * y::DOUBLE >= (8.071684478546691::DOUBLE)
                                    THEN 809
                                    ELSE 798
                                  END
                                  ELSE CASE WHEN (0.6995373935202344::DOUBLE) * x::DOUBLE + (-0.7145959942981187::DOUBLE) * y::DOUBLE >= (5.05388714200725::DOUBLE)
                                    THEN 809
                                    ELSE 797
                                  END
                                END
                                ELSE CASE WHEN (0.7261390468893238::DOUBLE) * x::DOUBLE + (-0.6875478780293516::DOUBLE) * y::DOUBLE >= (5.155304036759508::DOUBLE)
                                  THEN CASE WHEN (0.9045640943946539::DOUBLE) * x::DOUBLE + (0.42633765858997236::DOUBLE) * y::DOUBLE >= (9.505768537231791::DOUBLE)
                                    THEN 798
                                    ELSE 782
                                  END
                                  ELSE 774
                                END
                              END
                              ELSE CASE WHEN (0.8130236898613059::DOUBLE) * x::DOUBLE + (0.5822306069971822::DOUBLE) * y::DOUBLE >= (8.948183210613152::DOUBLE)
                                THEN CASE WHEN (0.991283638576109::DOUBLE) * x::DOUBLE + (0.13174501087824855::DOUBLE) * y::DOUBLE >= (9.651357514475201::DOUBLE)
                                  THEN CASE WHEN (0.49490336793177925::DOUBLE) * x::DOUBLE + (-0.8689480170929571::DOUBLE) * y::DOUBLE >= (2.5750369707897196::DOUBLE)
                                    THEN 797
                                    ELSE 795
                                  END
                                  ELSE CASE WHEN (0.9250692141119775::DOUBLE) * x::DOUBLE + (-0.379798563849639::DOUBLE) * y::DOUBLE >= (7.80003124881563::DOUBLE)
                                    THEN 797
                                    ELSE 780
                                  END
                                END
                                ELSE 774
                              END
                            END
                          END
                        END
                        ELSE CASE WHEN (0.09340035229593499::DOUBLE) * x::DOUBLE + (-0.9956286326693278::DOUBLE) * y::DOUBLE >= (-1.915005475925217::DOUBLE)
                          THEN CASE WHEN (0.7479963401735892::DOUBLE) * x::DOUBLE + (-0.6637028514982559::DOUBLE) * y::DOUBLE >= (5.099343207569387::DOUBLE)
                            THEN CASE WHEN (0.8130236898613059::DOUBLE) * x::DOUBLE + (0.5822306069971822::DOUBLE) * y::DOUBLE >= (8.948183210613152::DOUBLE)
                              THEN CASE WHEN (0.3905158294228958::DOUBLE) * x::DOUBLE + (0.920596212771999::DOUBLE) * y::DOUBLE >= (6.071108262391583::DOUBLE)
                                THEN CASE WHEN (0.9547912487929376::DOUBLE) * x::DOUBLE + (-0.2972770950282287::DOUBLE) * y::DOUBLE >= (8.12104379434652::DOUBLE)
                                  THEN 790
                                  ELSE 776
                                END
                                ELSE CASE WHEN (0.7508868448464393::DOUBLE) * x::DOUBLE + (-0.6604308792270084::DOUBLE) * y::DOUBLE >= (5.289359668309494::DOUBLE)
                                  THEN CASE WHEN (0.38523679028516206::DOUBLE) * x::DOUBLE + (0.9228177585042381::DOUBLE) * y::DOUBLE >= (6.007418592307808::DOUBLE)
                                    THEN 790
                                    ELSE 780
                                  END
                                  ELSE CASE WHEN (0.9003085890571763::DOUBLE) * x::DOUBLE + (0.4352521619359019::DOUBLE) * y::DOUBLE >= (9.545483173056507::DOUBLE)
                                    THEN 790
                                    ELSE 775
                                  END
                                END
                              END
                              ELSE CASE WHEN (0.6247896284260437::DOUBLE) * x::DOUBLE + (-0.7807931353510007::DOUBLE) * y::DOUBLE >= (3.8226690259596365::DOUBLE)
                                THEN CASE WHEN (0.029821025186397735::DOUBLE) * x::DOUBLE + (0.9995552543290601::DOUBLE) * y::DOUBLE >= (2.7570014328514345::DOUBLE)
                                  THEN 775
                                  ELSE 774
                                END
                                ELSE CASE WHEN (0.6629681946492243::DOUBLE) * x::DOUBLE + (0.7486475625309604::DOUBLE) * y::DOUBLE >= (7.97250437612977::DOUBLE)
                                  THEN 775
                                  ELSE 766
                                END
                              END
                            END
                            ELSE CASE WHEN (0.13281876482015506::DOUBLE) * x::DOUBLE + (0.9911403410777145::DOUBLE) * y::DOUBLE >= (3.8541917930937775::DOUBLE)
                              THEN CASE WHEN (0.6501815585808639::DOUBLE) * x::DOUBLE + (-0.7597788763063624::DOUBLE) * y::DOUBLE >= (3.887980754647638::DOUBLE)
                                THEN CASE WHEN (0.3905158294228958::DOUBLE) * x::DOUBLE + (0.920596212771999::DOUBLE) * y::DOUBLE >= (6.071108262391583::DOUBLE)
                                  THEN 776
                                  ELSE 775
                                END
                                ELSE CASE WHEN (0.9918832005322021::DOUBLE) * x::DOUBLE + (-0.12715233581022167::DOUBLE) * y::DOUBLE >= (8.731107091259577::DOUBLE)
                                  THEN 776
                                  ELSE 760
                                END
                              END
                              ELSE CASE WHEN (0.9935421496556777::DOUBLE) * x::DOUBLE + (0.11346363671932554::DOUBLE) * y::DOUBLE >= (9.343207524540396::DOUBLE)
                                THEN 775
                                ELSE 756
                              END
                            END
                          END
                          ELSE CASE WHEN (0.8954640184715378::DOUBLE) * x::DOUBLE + (0.4451339030256011::DOUBLE) * y::DOUBLE >= (9.475251493066292::DOUBLE)
                            THEN CASE WHEN (0.9547912487929376::DOUBLE) * x::DOUBLE + (-0.2972770950282287::DOUBLE) * y::DOUBLE >= (8.12104379434652::DOUBLE)
                              THEN CASE WHEN (0.1732773972316058::DOUBLE) * x::DOUBLE + (-0.9848730596420233::DOUBLE) * y::DOUBLE >= (-1.2022133366415528::DOUBLE)
                                THEN CASE WHEN (0.5108867946081618::DOUBLE) * x::DOUBLE + (0.8596479995294571::DOUBLE) * y::DOUBLE >= (7.276493007209208::DOUBLE)
                                  THEN 801
                                  ELSE 790
                                END
                                ELSE CASE WHEN (0.8518721962832313::DOUBLE) * x::DOUBLE + (-0.5237497123622924::DOUBLE) * y::DOUBLE >= (6.50563081850407::DOUBLE)
                                  THEN 801
                                  ELSE 786
                                END
                              END
                              ELSE CASE WHEN (0.30265465977856815::DOUBLE) * x::DOUBLE + (-0.9531002869133547::DOUBLE) * y::DOUBLE >= (-0.21663280581350453::DOUBLE)
                                THEN CASE WHEN (0.4295252956355886::DOUBLE) * x::DOUBLE + (-0.9030548269120543::DOUBLE) * y::DOUBLE >= (1.3725002189970974::DOUBLE)
                                  THEN CASE WHEN (0.334332786965283::DOUBLE) * x::DOUBLE + (0.9424550851685329::DOUBLE) * y::DOUBLE >= (5.852112206450678::DOUBLE)
                                    THEN 786
                                    ELSE 776
                                  END
                                  ELSE CASE WHEN (0.9489065996707694::DOUBLE) * x::DOUBLE + (0.31555707106838554::DOUBLE) * y::DOUBLE >= (9.749964398957456::DOUBLE)
                                    THEN 786
                                    ELSE 770
                                  END
                                END
                                ELSE CASE WHEN (0.7999819403263655::DOUBLE) * x::DOUBLE + (-0.6000240788098954::DOUBLE) * y::DOUBLE >= (5.485867478155541::DOUBLE)
                                  THEN 786
                                  ELSE 762
                                END
                              END
                            END
                            ELSE CASE WHEN (0.8069583952003552::DOUBLE) * x::DOUBLE + (-0.5906082867820832::DOUBLE) * y::DOUBLE >= (5.554431317993727::DOUBLE)
                              THEN CASE WHEN (0.5599761884224153::DOUBLE) * x::DOUBLE + (0.8285087014629984::DOUBLE) * y::DOUBLE >= (7.486183655177264::DOUBLE)
                                THEN CASE WHEN (0.4295252956355886::DOUBLE) * x::DOUBLE + (-0.9030548269120543::DOUBLE) * y::DOUBLE >= (1.3725002189970974::DOUBLE)
                                  THEN 776
                                  ELSE 770
                                END
                                ELSE CASE WHEN (0.9918832005322021::DOUBLE) * x::DOUBLE + (-0.12715233581022167::DOUBLE) * y::DOUBLE >= (8.731107091259577::DOUBLE)
                                  THEN 776
                                  ELSE 760
                                END
                              END
                              ELSE CASE WHEN (0.01695704854573234::DOUBLE) * x::DOUBLE + (-0.9998562189158087::DOUBLE) * y::DOUBLE >= (-2.886161507052691::DOUBLE)
                                THEN CASE WHEN (0.9645460763040442::DOUBLE) * x::DOUBLE + (0.2639145063964331::DOUBLE) * y::DOUBLE >= (9.483488410832663::DOUBLE)
                                  THEN 770
                                  ELSE 746
                                END
                                ELSE CASE WHEN (0.8233911427970908::DOUBLE) * x::DOUBLE + (-0.5674742513659106::DOUBLE) * y::DOUBLE >= (5.686250219754608::DOUBLE)
                                  THEN 770
                                  ELSE 745
                                END
                              END
                            END
                          END
                        END
                      END
                    END
                    ELSE CASE WHEN (0.7137344344173716::DOUBLE) * x::DOUBLE + (-0.7004164169456013::DOUBLE) * y::DOUBLE >= (5.9383551373566865::DOUBLE)
                      THEN CASE WHEN (0.19853191827490338::DOUBLE) * x::DOUBLE + (0.9800944227094076::DOUBLE) * y::DOUBLE >= (2.8283764497348867::DOUBLE)
                        THEN CASE WHEN (0.15599526181444778::DOUBLE) * x::DOUBLE + (0.98775780345763::DOUBLE) * y::DOUBLE >= (2.9436259304412413::DOUBLE)
                          THEN CASE WHEN (0.14267157812964198::DOUBLE) * x::DOUBLE + (-0.9897700848146489::DOUBLE) * y::DOUBLE >= (-0.1895198303239365::DOUBLE)
                            THEN CASE WHEN (0.7386974785287996::DOUBLE) * x::DOUBLE + (0.6740371170901447::DOUBLE) * y::DOUBLE >= (8.54115253392473::DOUBLE)
                              THEN CASE WHEN (0.5213630934442509::DOUBLE) * x::DOUBLE + (-0.8533349429117744::DOUBLE) * y::DOUBLE >= (4.13377720458926::DOUBLE)
                                THEN CASE WHEN (0.40851087870947506::DOUBLE) * x::DOUBLE + (0.9127534508157242::DOUBLE) * y::DOUBLE >= (5.796518688227524::DOUBLE)
                                  THEN 883
                                  ELSE 871
                                END
                                ELSE CASE WHEN (0.9567237351391098::DOUBLE) * x::DOUBLE + (0.2909977570729206::DOUBLE) * y::DOUBLE >= (10.588781806662242::DOUBLE)
                                  THEN 883
                                  ELSE 859
                                END
                              END
                              ELSE CASE WHEN (0.999928528845331::DOUBLE) * x::DOUBLE + (-0.011955634705532797::DOUBLE) * y::DOUBLE >= (10.244035244413844::DOUBLE)
                                THEN 871
                                ELSE 833
                              END
                            END
                            ELSE CASE WHEN (0.8954501005670579::DOUBLE) * x::DOUBLE + (0.445161900205359::DOUBLE) * y::DOUBLE >= (10.117381289094611::DOUBLE)
                              THEN CASE WHEN (0.2617900702074805::DOUBLE) * x::DOUBLE + (0.9651248412204312::DOUBLE) * y::DOUBLE >= (4.545837241432204::DOUBLE)
                                THEN CASE WHEN (0.7219945709047152::DOUBLE) * x::DOUBLE + (-0.6918987206117063::DOUBLE) * y::DOUBLE >= (6.294042748040007::DOUBLE)
                                  THEN 883
                                  ELSE 862
                                END
                                ELSE CASE WHEN (0.9567237351391098::DOUBLE) * x::DOUBLE + (0.2909977570729206::DOUBLE) * y::DOUBLE >= (10.588781806662242::DOUBLE)
                                  THEN 883
                                  ELSE 859
                                END
                              END
                              ELSE CASE WHEN (0.9604654618347355::DOUBLE) * x::DOUBLE + (0.27839916778357715::DOUBLE) * y::DOUBLE >= (10.167234462618637::DOUBLE)
                                THEN CASE WHEN (0.6007960688931847::DOUBLE) * x::DOUBLE + (-0.7994023289949159::DOUBLE) * y::DOUBLE >= (4.699859638615433::DOUBLE)
                                  THEN 859
                                  ELSE 844
                                END
                                ELSE CASE WHEN (0.9165149177293518::DOUBLE) * x::DOUBLE + (-0.40000050697412803::DOUBLE) * y::DOUBLE >= (8.566959938975117::DOUBLE)
                                  THEN 859
                                  ELSE 828
                                END
                              END
                            END
                          END
                          ELSE CASE WHEN (0.999928528845331::DOUBLE) * x::DOUBLE + (-0.011955634705532797::DOUBLE) * y::DOUBLE >= (10.244035244413844::DOUBLE)
                            THEN CASE WHEN (0.7357900980750799::DOUBLE) * x::DOUBLE + (-0.6772096658898663::DOUBLE) * y::DOUBLE >= (7.083296755458312::DOUBLE)
                              THEN CASE WHEN (0.5919110292130257::DOUBLE) * x::DOUBLE + (-0.806003308613542::DOUBLE) * y::DOUBLE >= (5.619460007669084::DOUBLE)
                                THEN CASE WHEN (0.5521091758932358::DOUBLE) * x::DOUBLE + (0.8337718260378506::DOUBLE) * y::DOUBLE >= (6.696621349787103::DOUBLE)
                                  THEN 897
                                  ELSE 882
                                END
                                ELSE CASE WHEN (0.9855644414093039::DOUBLE) * x::DOUBLE + (0.16930071420276677::DOUBLE) * y::DOUBLE >= (10.743616374888669::DOUBLE)
                                  THEN 897
                                  ELSE 872
                                END
                              END
                              ELSE CASE WHEN (0.6558491783905694::DOUBLE) * x::DOUBLE + (0.7548919493572672::DOUBLE) * y::DOUBLE >= (7.710439596497502::DOUBLE)
                                THEN CASE WHEN (0.03148736070962372::DOUBLE) * x::DOUBLE + (-0.9995041501242213::DOUBLE) * y::DOUBLE >= (-0.8291517237649946::DOUBLE)
                                  THEN 872
                                  ELSE 871
                                END
                                ELSE CASE WHEN (0.9794521002687299::DOUBLE) * x::DOUBLE + (-0.20167692797931502::DOUBLE) * y::DOUBLE >= (9.975905343350663::DOUBLE)
                                  THEN 872
                                  ELSE 850
                                END
                              END
                            END
                            ELSE CASE WHEN (0.6239729313532758::DOUBLE) * x::DOUBLE + (-0.7814459552255677::DOUBLE) * y::DOUBLE >= (5.152592313545107::DOUBLE)
                              THEN CASE WHEN (0.4616343463807494::DOUBLE) * x::DOUBLE + (0.8870703073835909::DOUBLE) * y::DOUBLE >= (5.572216811876412::DOUBLE)
                                THEN CASE WHEN (0.5601979891514461::DOUBLE) * x::DOUBLE + (-0.8283587465287466::DOUBLE) * y::DOUBLE >= (4.6710860960878::DOUBLE)
                                  THEN 850
                                  ELSE 833
                                END
                                ELSE CASE WHEN (0.977639889027239::DOUBLE) * x::DOUBLE + (0.2102861083923707::DOUBLE) * y::DOUBLE >= (9.969462810705553::DOUBLE)
                                  THEN 850
                                  ELSE 815
                                END
                              END
                              ELSE CASE WHEN (0.9713404094821183::DOUBLE) * x::DOUBLE + (0.23769267743687666::DOUBLE) * y::DOUBLE >= (9.767967614887533::DOUBLE)
                                THEN 833
                                ELSE 796
                              END
                            END
                          END
                        END
                        ELSE CASE WHEN (0.9976800080108524::DOUBLE) * x::DOUBLE + (-0.06807790842457855::DOUBLE) * y::DOUBLE >= (10.232999152776141::DOUBLE)
                          THEN CASE WHEN (0.9981130793319272::DOUBLE) * x::DOUBLE + (-0.06140261286409613::DOUBLE) * y::DOUBLE >= (10.501570035642958::DOUBLE)
                            THEN CASE WHEN (0.5450980115500914::DOUBLE) * x::DOUBLE + (-0.8383723264780014::DOUBLE) * y::DOUBLE >= (5.538171345503862::DOUBLE)
                              THEN CASE WHEN (0.5634897437713451::DOUBLE) * x::DOUBLE + (0.8261230590320693::DOUBLE) * y::DOUBLE >= (6.39666470311912::DOUBLE)
                                THEN CASE WHEN (0.5173574861544392::DOUBLE) * x::DOUBLE + (-0.855769379868174::DOUBLE) * y::DOUBLE >= (5.4424166582520455::DOUBLE)
                                  THEN 918
                                  ELSE 906
                                END
                                ELSE CASE WHEN (0.9996324098022736::DOUBLE) * x::DOUBLE + (0.0271117183686207::DOUBLE) * y::DOUBLE >= (10.96403776826694::DOUBLE)
                                  THEN 918
                                  ELSE 885
                                END
                              END
                              ELSE CASE WHEN (0.5671858355313868::DOUBLE) * x::DOUBLE + (0.8235898420770879::DOUBLE) * y::DOUBLE >= (6.52341881518528::DOUBLE)
                                THEN CASE WHEN (0.7632604930772287::DOUBLE) * x::DOUBLE + (-0.6460908757346028::DOUBLE) * y::DOUBLE >= (7.887470358570777::DOUBLE)
                                  THEN 906
                                  ELSE 882
                                END
                                ELSE CASE WHEN (0.9983833443902171::DOUBLE) * x::DOUBLE + (0.05683922628084402::DOUBLE) * y::DOUBLE >= (10.775325857208317::DOUBLE)
                                  THEN 906
                                  ELSE 874
                                END
                              END
                            END
                            ELSE CASE WHEN (0.7696504394454897::DOUBLE) * x::DOUBLE + (0.638465504989396::DOUBLE) * y::DOUBLE >= (8.468403305264824::DOUBLE)
                              THEN CASE WHEN (0.006851758419755607::DOUBLE) * x::DOUBLE + (-0.9999765264277745::DOUBLE) * y::DOUBLE >= (-0.6417781985506064::DOUBLE)
                                THEN CASE WHEN (0.5671858355313868::DOUBLE) * x::DOUBLE + (0.8235898420770879::DOUBLE) * y::DOUBLE >= (6.52341881518528::DOUBLE)
                                  THEN 882
                                  ELSE 874
                                END
                                ELSE CASE WHEN (0.5919110292130257::DOUBLE) * x::DOUBLE + (-0.806003308613542::DOUBLE) * y::DOUBLE >= (5.619460007669084::DOUBLE)
                                  THEN 882
                                  ELSE 872
                                END
                              END
                              ELSE CASE WHEN (0.35278006010273216::DOUBLE) * x::DOUBLE + (-0.9357062729264524::DOUBLE) * y::DOUBLE >= (3.2278156052090248::DOUBLE)
                                THEN CASE WHEN (0.6426269860231189::DOUBLE) * x::DOUBLE + (0.7661791936843771::DOUBLE) * y::DOUBLE >= (6.958599917478774::DOUBLE)
                                  THEN 874
                                  ELSE 857
                                END
                                ELSE CASE WHEN (0.9364671044466015::DOUBLE) * x::DOUBLE + (-0.3507554166216081::DOUBLE) * y::DOUBLE >= (9.499744581703347::DOUBLE)
                                  THEN 874
                                  ELSE 845
                                END
                              END
                            END
                          END
                          ELSE CASE WHEN (0.3993487197717943::DOUBLE) * x::DOUBLE + (0.9167991055932749::DOUBLE) * y::DOUBLE >= (4.556478243348449::DOUBLE)
                            THEN CASE WHEN (0.6239729313532758::DOUBLE) * x::DOUBLE + (-0.7814459552255677::DOUBLE) * y::DOUBLE >= (5.152592313545107::DOUBLE)
                              THEN CASE WHEN (0.8085753062055815::DOUBLE) * x::DOUBLE + (-0.5883927040629839::DOUBLE) * y::DOUBLE >= (7.591714886367273::DOUBLE)
                                THEN 845
                                ELSE 815
                              END
                              ELSE 796
                            END
                            ELSE CASE WHEN (0.9982614249818567::DOUBLE) * x::DOUBLE + (0.05894172879372439::DOUBLE) * y::DOUBLE >= (9.897595088018797::DOUBLE)
                              THEN CASE WHEN (0.48960308033107874::DOUBLE) * x::DOUBLE + (0.8719454247430393::DOUBLE) * y::DOUBLE >= (5.291808854081983::DOUBLE)
                                THEN CASE WHEN (0.35278006010273216::DOUBLE) * x::DOUBLE + (-0.9357062729264524::DOUBLE) * y::DOUBLE >= (3.2278156052090248::DOUBLE)
                                  THEN 857
                                  ELSE 845
                                END
                                ELSE CASE WHEN (0.9927448627536928::DOUBLE) * x::DOUBLE + (-0.12023991631796724::DOUBLE) * y::DOUBLE >= (10.02346698794462::DOUBLE)
                                  THEN 857
                                  ELSE 830
                                END
                              END
                              ELSE CASE WHEN (0.004257817476037288::DOUBLE) * x::DOUBLE + (0.9999909354540873::DOUBLE) * y::DOUBLE >= (0.42855308409865034::DOUBLE)
                                THEN CASE WHEN (0.6745122179101133::DOUBLE) * x::DOUBLE + (-0.7382636845260505::DOUBLE) * y::DOUBLE >= (6.283902657542084::DOUBLE)
                                  THEN 830
                                  ELSE 804
                                END
                                ELSE CASE WHEN (0.9863535914540122::DOUBLE) * x::DOUBLE + (0.1646407987886709::DOUBLE) * y::DOUBLE >= (9.670704639680137::DOUBLE)
                                  THEN 830
                                  ELSE 803
                                END
                              END
                            END
                          END
                        END
                      END
                      ELSE CASE WHEN (0.9767849131877053::DOUBLE) * x::DOUBLE + (0.21422239231435855::DOUBLE) * y::DOUBLE >= (9.762611389995822::DOUBLE)
                        THEN CASE WHEN (0.7460828350961654::DOUBLE) * x::DOUBLE + (0.6658531393444564::DOUBLE) * y::DOUBLE >= (8.695839554118239::DOUBLE)
                          THEN CASE WHEN (0.9604654618347355::DOUBLE) * x::DOUBLE + (0.27839916778357715::DOUBLE) * y::DOUBLE >= (10.167234462618637::DOUBLE)
                            THEN CASE WHEN (0.7513651892840647::DOUBLE) * x::DOUBLE + (-0.659886620816123::DOUBLE) * y::DOUBLE >= (6.152557948153541::DOUBLE)
                              THEN CASE WHEN (0.10628170367318625::DOUBLE) * x::DOUBLE + (0.9943360596218589::DOUBLE) * y::DOUBLE >= (3.1333964329007755::DOUBLE)
                                THEN CASE WHEN (0.9417745845468898::DOUBLE) * x::DOUBLE + (-0.33624489869964314::DOUBLE) * y::DOUBLE >= (8.989569949355097::DOUBLE)
                                  THEN 862
                                  ELSE 848
                                END
                                ELSE CASE WHEN (0.8954501005670579::DOUBLE) * x::DOUBLE + (0.445161900205359::DOUBLE) * y::DOUBLE >= (10.117381289094611::DOUBLE)
                                  THEN 862
                                  ELSE 844
                                END
                              END
                              ELSE CASE WHEN (0.8329798690790025::DOUBLE) * x::DOUBLE + (0.5533032963114606::DOUBLE) * y::DOUBLE >= (9.547612400896547::DOUBLE)
                                THEN CASE WHEN (0.6380238588707624::DOUBLE) * x::DOUBLE + (-0.7700165943092794::DOUBLE) * y::DOUBLE >= (4.717735463173156::DOUBLE)
                                  THEN 848
                                  ELSE 838
                                END
                                ELSE CASE WHEN (0.9997449378664195::DOUBLE) * x::DOUBLE + (-0.02258449048504165::DOUBLE) * y::DOUBLE >= (9.966315948603139::DOUBLE)
                                  THEN 848
                                  ELSE 823
                                END
                              END
                            END
                            ELSE CASE WHEN (0.9618522804543448::DOUBLE) * x::DOUBLE + (-0.273569352422336::DOUBLE) * y::DOUBLE >= (8.78751292000398::DOUBLE)
                              THEN CASE WHEN (0.16651675195722299::DOUBLE) * x::DOUBLE + (-0.9860386256722486::DOUBLE) * y::DOUBLE >= (-0.3599320836541544::DOUBLE)
                                THEN 828
                                ELSE 823
                              END
                              ELSE 809
                            END
                          END
                          ELSE CASE WHEN (0.2201348137263708::DOUBLE) * x::DOUBLE + (-0.9754694581511285::DOUBLE) * y::DOUBLE >= (0.16107622346090467::DOUBLE)
                            THEN CASE WHEN (0.3830957258997334::DOUBLE) * x::DOUBLE + (0.9237086471379146::DOUBLE) * y::DOUBLE >= (5.0276864858980685::DOUBLE)
                              THEN CASE WHEN (0.04236397036028643::DOUBLE) * x::DOUBLE + (0.9991022440247609::DOUBLE) * y::DOUBLE >= (2.2698460993354415::DOUBLE)
                                THEN CASE WHEN (0.840393838496423::DOUBLE) * x::DOUBLE + (-0.5419761952496145::DOUBLE) * y::DOUBLE >= (7.175266534508516::DOUBLE)
                                  THEN 828
                                  ELSE 810
                                END
                                ELSE CASE WHEN (0.8102150559330294::DOUBLE) * x::DOUBLE + (0.5861327180250543::DOUBLE) * y::DOUBLE >= (8.978598960610803::DOUBLE)
                                  THEN 828
                                  ELSE 807
                                END
                              END
                              ELSE 796
                            END
                            ELSE CASE WHEN (0.13833169860946803::DOUBLE) * x::DOUBLE + (-0.9903859556555816::DOUBLE) * y::DOUBLE >= (-0.8984745703466175::DOUBLE)
                              THEN CASE WHEN (0.8584947449067928::DOUBLE) * x::DOUBLE + (0.5128223600501647::DOUBLE) * y::DOUBLE >= (9.382377676462944::DOUBLE)
                                THEN CASE WHEN (0.026675173381355895::DOUBLE) * x::DOUBLE + (-0.9996441542494382::DOUBLE) * y::DOUBLE >= (-1.8799396940544464::DOUBLE)
                                  THEN 810
                                  ELSE 809
                                END
                                ELSE CASE WHEN (0.6852663059982348::DOUBLE) * x::DOUBLE + (-0.7282925853415876::DOUBLE) * y::DOUBLE >= (5.056737318216142::DOUBLE)
                                  THEN 810
                                  ELSE 799
                                END
                              END
                              ELSE CASE WHEN (0.9287766532961977::DOUBLE) * x::DOUBLE + (-0.3706398903139199::DOUBLE) * y::DOUBLE >= (8.071684478546691::DOUBLE)
                                THEN 809
                                ELSE 798
                              END
                            END
                          END
                        END
                        ELSE CASE WHEN (0.5632591327207632::DOUBLE) * x::DOUBLE + (0.8262803092211829::DOUBLE) * y::DOUBLE >= (6.948014757713458::DOUBLE)
                          THEN CASE WHEN (0.45955433553548874::DOUBLE) * x::DOUBLE + (-0.8881496566967391::DOUBLE) * y::DOUBLE >= (2.2518874996530824::DOUBLE)
                            THEN CASE WHEN (0.8815678993723719::DOUBLE) * x::DOUBLE + (0.47205724101657803::DOUBLE) * y::DOUBLE >= (9.203303481317288::DOUBLE)
                              THEN CASE WHEN (0.2949568878377947::DOUBLE) * x::DOUBLE + (-0.9555105621169462::DOUBLE) * y::DOUBLE >= (0.7634468475171547::DOUBLE)
                                THEN CASE WHEN (0.49821088518536355::DOUBLE) * x::DOUBLE + (0.8670558885578349::DOUBLE) * y::DOUBLE >= (6.525285242108083::DOUBLE)
                                  THEN 799
                                  ELSE 789
                                END
                                ELSE CASE WHEN (0.9045640943946539::DOUBLE) * x::DOUBLE + (0.42633765858997236::DOUBLE) * y::DOUBLE >= (9.505768537231791::DOUBLE)
                                  THEN CASE WHEN (0.13833169860946803::DOUBLE) * x::DOUBLE + (-0.9903859556555816::DOUBLE) * y::DOUBLE >= (-0.8984745703466175::DOUBLE)
                                    THEN 799
                                    ELSE 798
                                  END
                                  ELSE CASE WHEN (0.9615466406440604::DOUBLE) * x::DOUBLE + (-0.2746416899637094::DOUBLE) * y::DOUBLE >= (8.482742721020003::DOUBLE)
                                    THEN 799
                                    ELSE 782
                                  END
                                END
                              END
                              ELSE CASE WHEN (0.8346412186333563::DOUBLE) * x::DOUBLE + (-0.5507940051945246::DOUBLE) * y::DOUBLE >= (6.638288372288585::DOUBLE)
                                THEN 789
                                ELSE 772
                              END
                            END
                            ELSE CASE WHEN (0.052873955802614274::DOUBLE) * x::DOUBLE + (-0.9986011940698766::DOUBLE) * y::DOUBLE >= (-1.8905528661903628::DOUBLE)
                              THEN CASE WHEN (0.587889198293237::DOUBLE) * x::DOUBLE + (0.8089414629811821::DOUBLE) * y::DOUBLE >= (7.261849815011587::DOUBLE)
                                THEN CASE WHEN (0.7261390468893238::DOUBLE) * x::DOUBLE + (-0.6875478780293516::DOUBLE) * y::DOUBLE >= (5.155304036759508::DOUBLE)
                                  THEN 782
                                  ELSE 774
                                END
                                ELSE CASE WHEN (0.9853609009536721::DOUBLE) * x::DOUBLE + (-0.17048136224164684::DOUBLE) * y::DOUBLE >= (8.719981969343737::DOUBLE)
                                  THEN 782
                                  ELSE 768
                                END
                              END
                              ELSE CASE WHEN (0.6247896284260437::DOUBLE) * x::DOUBLE + (-0.7807931353510007::DOUBLE) * y::DOUBLE >= (3.8226690259596365::DOUBLE)
                                THEN 774
                                ELSE 766
                              END
                            END
                          END
                          ELSE CASE WHEN (0.31313192746463536::DOUBLE) * x::DOUBLE + (-0.9497096377326505::DOUBLE) * y::DOUBLE >= (1.181986009487652::DOUBLE)
                            THEN CASE WHEN (0.40513935655894057::DOUBLE) * x::DOUBLE + (0.9142549435288866::DOUBLE) * y::DOUBLE >= (5.44150787922674::DOUBLE)
                              THEN CASE WHEN (0.6358467906974814::DOUBLE) * x::DOUBLE + (-0.7718153009365086::DOUBLE) * y::DOUBLE >= (4.655147604989647::DOUBLE)
                                THEN 807
                                ELSE 789
                              END
                              ELSE CASE WHEN (0.4611592443461358::DOUBLE) * x::DOUBLE + (-0.8873173904269548::DOUBLE) * y::DOUBLE >= (3.0453892184857194::DOUBLE)
                                THEN CASE WHEN (0.3830957258997334::DOUBLE) * x::DOUBLE + (0.9237086471379146::DOUBLE) * y::DOUBLE >= (5.0276864858980685::DOUBLE)
                                  THEN 807
                                  ELSE 796
                                END
                                ELSE CASE WHEN (0.9884662619778323::DOUBLE) * x::DOUBLE + (0.15144123920376298::DOUBLE) * y::DOUBLE >= (9.615758551079026::DOUBLE)
                                  THEN 807
                                  ELSE 777
                                END
                              END
                            END
                            ELSE CASE WHEN (0.07987341980384623::DOUBLE) * x::DOUBLE + (0.9968050144380488::DOUBLE) * y::DOUBLE >= (2.775418749898916::DOUBLE)
                              THEN CASE WHEN (0.8346412186333563::DOUBLE) * x::DOUBLE + (-0.5507940051945246::DOUBLE) * y::DOUBLE >= (6.638288372288585::DOUBLE)
                                THEN 789
                                ELSE 772
                              END
                              ELSE CASE WHEN (0.9983201142861863::DOUBLE) * x::DOUBLE + (0.05793918718463595::DOUBLE) * y::DOUBLE >= (9.401679175863176::DOUBLE)
                                THEN 789
                                ELSE 771
                              END
                            END
                          END
                        END
                      END
                    END
                  END
                END
                ELSE CASE WHEN (0.3921066883509715::DOUBLE) * x::DOUBLE + (-0.9199197491903488::DOUBLE) * y::DOUBLE >= (-1.1121168294238855::DOUBLE)
                  THEN CASE WHEN (0.7872239093877874::DOUBLE) * x::DOUBLE + (-0.6166672656207791::DOUBLE) * y::DOUBLE >= (5.90529434503856::DOUBLE)
                    THEN CASE WHEN (0.9069314368662019::DOUBLE) * x::DOUBLE + (-0.4212782558165163::DOUBLE) * y::DOUBLE >= (8.817029754618916::DOUBLE)
                      THEN CASE WHEN (0.7205892595002743::DOUBLE) * x::DOUBLE + (0.6933621846429515::DOUBLE) * y::DOUBLE >= (10.938728853940702::DOUBLE)
                        THEN CASE WHEN (0.3999725834720633::DOUBLE) * x::DOUBLE + (-0.9165271040567669::DOUBLE) * y::DOUBLE >= (1.282595938078273::DOUBLE)
                          THEN CASE WHEN (0.28817337019795286::DOUBLE) * x::DOUBLE + (0.9575782520028082::DOUBLE) * y::DOUBLE >= (6.816112524769438::DOUBLE)
                            THEN CASE WHEN (0.9658107507937547::DOUBLE) * x::DOUBLE + (-0.25924813143242464::DOUBLE) * y::DOUBLE >= (10.522227715108608::DOUBLE)
                              THEN CASE WHEN (0.7521541295594096::DOUBLE) * x::DOUBLE + (-0.6589872270285115::DOUBLE) * y::DOUBLE >= (6.597830853447482::DOUBLE)
                                THEN CASE WHEN (0.022028940878230006::DOUBLE) * x::DOUBLE + (0.9997573334383615::DOUBLE) * y::DOUBLE >= (3.8846875738113114::DOUBLE)
                                  THEN 998
                                  ELSE 996
                                END
                                ELSE CASE WHEN (0.7155889506163581::DOUBLE) * x::DOUBLE + (0.6985216201061921::DOUBLE) * y::DOUBLE >= (11.078499714920554::DOUBLE)
                                  THEN 998
                                  ELSE 987
                                END
                              END
                              ELSE CASE WHEN (0.6625970250394023::DOUBLE) * x::DOUBLE + (0.7489760893439347::DOUBLE) * y::DOUBLE >= (10.569202207601347::DOUBLE)
                                THEN CASE WHEN (0.15200213260723597::DOUBLE) * x::DOUBLE + (-0.988380165565281::DOUBLE) * y::DOUBLE >= (-1.8363312691088318::DOUBLE)
                                  THEN 987
                                  ELSE 983
                                END
                                ELSE CASE WHEN (0.9950059590066203::DOUBLE) * x::DOUBLE + (-0.09981553757464855::DOUBLE) * y::DOUBLE >= (11.37428798648901::DOUBLE)
                                  THEN 987
                                  ELSE 967
                                END
                              END
                            END
                            ELSE CASE WHEN (0.7131524359003186::DOUBLE) * x::DOUBLE + (-0.7010089893642177::DOUBLE) * y::DOUBLE >= (6.044159699290324::DOUBLE)
                              THEN CASE WHEN (0.300809825108243::DOUBLE) * x::DOUBLE + (-0.9536841453638351::DOUBLE) * y::DOUBLE >= (0.3969266793770787::DOUBLE)
                                THEN 995
                                ELSE CASE WHEN (0.28165604834589986::DOUBLE) * x::DOUBLE + (0.9595154352224733::DOUBLE) * y::DOUBLE >= (6.688518964594746::DOUBLE)
                                  THEN 996
                                  ELSE 993
                                END
                              END
                              ELSE CASE WHEN (0.5461220806096141::DOUBLE) * x::DOUBLE + (-0.8377056004770567::DOUBLE) * y::DOUBLE >= (3.4477927991578032::DOUBLE)
                                THEN CASE WHEN (0.9625302493062474::DOUBLE) * x::DOUBLE + (0.2711743335392435::DOUBLE) * y::DOUBLE >= (12.392798769998755::DOUBLE)
                                  THEN 996
                                  ELSE 980
                                END
                                ELSE 967
                              END
                            END
                          END
                          ELSE CASE WHEN (0.1382869421300537::DOUBLE) * x::DOUBLE + (0.9903922059650505::DOUBLE) * y::DOUBLE >= (5.5900227060904015::DOUBLE)
                            THEN CASE WHEN (0.038551827542528116::DOUBLE) * x::DOUBLE + (0.9992566019762547::DOUBLE) * y::DOUBLE >= (5.022835959024765::DOUBLE)
                              THEN 976
                              ELSE CASE WHEN (0.47459750683615387::DOUBLE) * x::DOUBLE + (0.880202934842248::DOUBLE) * y::DOUBLE >= (9.222656154198917::DOUBLE)
                                THEN CASE WHEN (0.4167415434815245::DOUBLE) * x::DOUBLE + (-0.9090250194228081::DOUBLE) * y::DOUBLE >= (1.1080860057390227::DOUBLE)
                                  THEN 992
                                  ELSE 972
                                END
                                ELSE CASE WHEN (0.9707047588835068::DOUBLE) * x::DOUBLE + (0.2402754067334254::DOUBLE) * y::DOUBLE >= (12.379667655070616::DOUBLE)
                                  THEN 992
                                  ELSE 953
                                END
                              END
                            END
                            ELSE CASE WHEN (0.9728000103681783::DOUBLE) * x::DOUBLE + (-0.23164658388949327::DOUBLE) * y::DOUBLE >= (10.559075384880124::DOUBLE)
                              THEN CASE WHEN (0.20595636984932833::DOUBLE) * x::DOUBLE + (0.9785611752560424::DOUBLE) * y::DOUBLE >= (6.174498345100534::DOUBLE)
                                THEN CASE WHEN (0.4504195060205913::DOUBLE) * x::DOUBLE + (-0.8928170409418531::DOUBLE) * y::DOUBLE >= (1.9723881043593852::DOUBLE)
                                  THEN 998
                                  ELSE 988
                                END
                                ELSE CASE WHEN (0.9658107507937547::DOUBLE) * x::DOUBLE + (-0.25924813143242464::DOUBLE) * y::DOUBLE >= (10.522227715108608::DOUBLE)
                                  THEN 998
                                  ELSE 983
                                END
                              END
                              ELSE CASE WHEN (0.24025019591725863::DOUBLE) * x::DOUBLE + (-0.9707109988877838::DOUBLE) * y::DOUBLE >= (-0.9889196383299201::DOUBLE)
                                THEN CASE WHEN (0.8908033293933911::DOUBLE) * x::DOUBLE + (0.45438907154733527::DOUBLE) * y::DOUBLE >= (12.22390629426432::DOUBLE)
                                  THEN 988
                                  ELSE 960
                                END
                                ELSE CASE WHEN (0.8982264476718939::DOUBLE) * x::DOUBLE + (-0.4395329893224519::DOUBLE) * y::DOUBLE >= (8.80664035932153::DOUBLE)
                                  THEN 988
                                  ELSE 953
                                END
                              END
                            END
                          END
                        END
                        ELSE CASE WHEN (0.9443108093254297::DOUBLE) * x::DOUBLE + (-0.32905485164505927::DOUBLE) * y::DOUBLE >= (9.879131772912654::DOUBLE)
                          THEN CASE WHEN (0.7131524359003186::DOUBLE) * x::DOUBLE + (-0.7010089893642177::DOUBLE) * y::DOUBLE >= (6.044159699290324::DOUBLE)
                            THEN CASE WHEN (0.30508306095818977::DOUBLE) * x::DOUBLE + (-0.9523257456964931::DOUBLE) * y::DOUBLE >= (0.4478613431270291::DOUBLE)
                              THEN CASE WHEN (0.5711418883898933::DOUBLE) * x::DOUBLE + (0.8208513527590893::DOUBLE) * y::DOUBLE >= (9.508321074668608::DOUBLE)
                                THEN CASE WHEN (0.300809825108243::DOUBLE) * x::DOUBLE + (-0.9536841453638351::DOUBLE) * y::DOUBLE >= (0.3969266793770787::DOUBLE)
                                  THEN 995
                                  ELSE 993
                                END
                                ELSE CASE WHEN (0.9719237065663705::DOUBLE) * x::DOUBLE + (0.23529621461954672::DOUBLE) * y::DOUBLE >= (12.316258489451014::DOUBLE)
                                  THEN 995
                                  ELSE 978
                                END
                              END
                              ELSE CASE WHEN (0.9498643081350316::DOUBLE) * x::DOUBLE + (0.3126624315954154::DOUBLE) * y::DOUBLE >= (12.308617096214252::DOUBLE)
                                THEN 993
                                ELSE 971
                              END
                            END
                            ELSE CASE WHEN (0.29709085897280996::DOUBLE) * x::DOUBLE + (0.9548492140200975::DOUBLE) * y::DOUBLE >= (6.777991827528871::DOUBLE)
                              THEN CASE WHEN (0.40791816147060966::DOUBLE) * x::DOUBLE + (0.9130184957285573::DOUBLE) * y::DOUBLE >= (8.030463852944663::DOUBLE)
                                THEN CASE WHEN (0.5461220806096141::DOUBLE) * x::DOUBLE + (-0.8377056004770567::DOUBLE) * y::DOUBLE >= (3.4477927991578032::DOUBLE)
                                  THEN 980
                                  ELSE 967
                                END
                                ELSE CASE WHEN (0.9985061874894765::DOUBLE) * x::DOUBLE + (-0.054638754975110976::DOUBLE) * y::DOUBLE >= (11.540080265504919::DOUBLE)
                                  THEN 980
                                  ELSE 962
                                END
                              END
                              ELSE CASE WHEN (0.31384862739838476::DOUBLE) * x::DOUBLE + (0.9494730323080007::DOUBLE) * y::DOUBLE >= (6.910649347286109::DOUBLE)
                                THEN CASE WHEN (0.5681453518360401::DOUBLE) * x::DOUBLE + (-0.822928222378539::DOUBLE) * y::DOUBLE >= (3.8392227823496046::DOUBLE)
                                  THEN 971
                                  ELSE 962
                                END
                                ELSE CASE WHEN (0.9980140488318299::DOUBLE) * x::DOUBLE + (0.06299173226938524::DOUBLE) * y::DOUBLE >= (11.890350547931114::DOUBLE)
                                  THEN 971
                                  ELSE 955
                                END
                              END
                            END
                          END
                          ELSE CASE WHEN (0.5196658680505759::DOUBLE) * x::DOUBLE + (0.8543695837184523::DOUBLE) * y::DOUBLE >= (8.826462956329665::DOUBLE)
                            THEN CASE WHEN (0.057608099931992854::DOUBLE) * x::DOUBLE + (0.998339274406364::DOUBLE) * y::DOUBLE >= (4.211842444959152::DOUBLE)
                              THEN CASE WHEN (0.7763008224583144::DOUBLE) * x::DOUBLE + (0.6303626202833925::DOUBLE) * y::DOUBLE >= (11.135673466477057::DOUBLE)
                                THEN CASE WHEN (0.6813353090056278::DOUBLE) * x::DOUBLE + (-0.7319714452778917::DOUBLE) * y::DOUBLE >= (5.286476404855447::DOUBLE)
                                  THEN CASE WHEN (0.40791816147060966::DOUBLE) * x::DOUBLE + (0.9130184957285573::DOUBLE) * y::DOUBLE >= (8.030463852944663::DOUBLE)
                                    THEN 967
                                    ELSE 962
                                  END
                                  ELSE CASE WHEN (0.9886735450434844::DOUBLE) * x::DOUBLE + (-0.1500820486638871::DOUBLE) * y::DOUBLE >= (10.955179876090641::DOUBLE)
                                    THEN 967
                                    ELSE 950
                                  END
                                END
                                ELSE 936
                              END
                              ELSE CASE WHEN (0.9599870517091594::DOUBLE) * x::DOUBLE + (-0.28004439032188416::DOUBLE) * y::DOUBLE >= (10.000838833435363::DOUBLE)
                                THEN CASE WHEN (0.7281380981547682::DOUBLE) * x::DOUBLE + (-0.6854304560023264::DOUBLE) * y::DOUBLE >= (6.097701095737525::DOUBLE)
                                  THEN CASE WHEN (0.31384862739838476::DOUBLE) * x::DOUBLE + (0.9494730323080007::DOUBLE) * y::DOUBLE >= (6.910649347286109::DOUBLE)
                                    THEN 962
                                    ELSE 955
                                  END
                                  ELSE CASE WHEN (0.9445785967898929::DOUBLE) * x::DOUBLE + (0.3282853552725691::DOUBLE) * y::DOUBLE >= (12.098186306300345::DOUBLE)
                                    THEN 962
                                    ELSE 949
                                  END
                                END
                                ELSE 936
                              END
                            END
                            ELSE CASE WHEN (0.9701427113048252::DOUBLE) * x::DOUBLE + (-0.24253478039679674::DOUBLE) * y::DOUBLE >= (10.298465043531492::DOUBLE)
                              THEN CASE WHEN (0.9908243514446083::DOUBLE) * x::DOUBLE + (-0.13515585294159863::DOUBLE) * y::DOUBLE >= (10.964969028534906::DOUBLE)
                                THEN CASE WHEN (0.14877747410717407::DOUBLE) * x::DOUBLE + (0.9888707009504777::DOUBLE) * y::DOUBLE >= (4.985642722808509::DOUBLE)
                                  THEN 955
                                  ELSE 954
                                END
                                ELSE CASE WHEN (0.9313080538104213::DOUBLE) * x::DOUBLE + (0.3642324929325302::DOUBLE) * y::DOUBLE >= (11.9318789644144::DOUBLE)
                                  THEN 955
                                  ELSE 941
                                END
                              END
                              ELSE CASE WHEN (0.41255037917858156::DOUBLE) * x::DOUBLE + (0.9109347861617805::DOUBLE) * y::DOUBLE >= (7.771584829164995::DOUBLE)
                                THEN CASE WHEN (0.27749822109821404::DOUBLE) * x::DOUBLE + (-0.9607261510374987::DOUBLE) * y::DOUBLE >= (-0.09376175961598232::DOUBLE)
                                  THEN 941
                                  ELSE 936
                                END
                                ELSE CASE WHEN (0.9274118159915113::DOUBLE) * x::DOUBLE + (-0.37404187407204453::DOUBLE) * y::DOUBLE >= (9.280189875703655::DOUBLE)
                                  THEN 941
                                  ELSE 927
                                END
                              END
                            END
                          END
                        END
                      END
                      ELSE CASE WHEN (0.27742432282243007::DOUBLE) * x::DOUBLE + (0.9607474928962948::DOUBLE) * y::DOUBLE >= (6.554008595988265::DOUBLE)
                        THEN CASE WHEN (0.22214427225971567::DOUBLE) * x::DOUBLE + (0.9750138062110717::DOUBLE) * y::DOUBLE >= (6.589231714311046::DOUBLE)
                          THEN CASE WHEN (0.34701745638856824::DOUBLE) * x::DOUBLE + (-0.9378586700359539::DOUBLE) * y::DOUBLE >= (-0.5676360259791933::DOUBLE)
                            THEN CASE WHEN (0.9851925043948183::DOUBLE) * x::DOUBLE + (-0.17145182788254512::DOUBLE) * y::DOUBLE >= (10.295365545829254::DOUBLE)
                              THEN CASE WHEN (0.4852470592271964::DOUBLE) * x::DOUBLE + (0.8743770877095063::DOUBLE) * y::DOUBLE >= (9.384729247401::DOUBLE)
                                THEN CASE WHEN (0.7580075296305867::DOUBLE) * x::DOUBLE + (-0.6522458010775809::DOUBLE) * y::DOUBLE >= (5.907823302188312::DOUBLE)
                                  THEN CASE WHEN (0.038551827542528116::DOUBLE) * x::DOUBLE + (0.9992566019762547::DOUBLE) * y::DOUBLE >= (5.022835959024765::DOUBLE)
                                    THEN 976
                                    ELSE 972
                                  END
                                  ELSE CASE WHEN (0.8159006900595108::DOUBLE) * x::DOUBLE + (0.5781920649407204::DOUBLE) * y::DOUBLE >= (12.214958699445583::DOUBLE)
                                    THEN 976
                                    ELSE 946
                                  END
                                END
                                ELSE CASE WHEN (0.8141292976976031::DOUBLE) * x::DOUBLE + (-0.580683637302109::DOUBLE) * y::DOUBLE >= (6.924654803190181::DOUBLE)
                                  THEN CASE WHEN (0.47459750683615387::DOUBLE) * x::DOUBLE + (0.880202934842248::DOUBLE) * y::DOUBLE >= (9.222656154198917::DOUBLE)
                                    THEN 972
                                    ELSE 953
                                  END
                                  ELSE CASE WHEN (0.9832598753979774::DOUBLE) * x::DOUBLE + (0.1822087194191158::DOUBLE) * y::DOUBLE >= (12.122829832323777::DOUBLE)
                                    THEN 972
                                    ELSE 931
                                  END
                                END
                              END
                              ELSE CASE WHEN (0.1837188411185582::DOUBLE) * x::DOUBLE + (0.9829788336571921::DOUBLE) * y::DOUBLE >= (6.360082199139901::DOUBLE)
                                THEN CASE WHEN (0.5228157438863902::DOUBLE) * x::DOUBLE + (-0.8524457155411835::DOUBLE) * y::DOUBLE >= (2.037590738610026::DOUBLE)
                                  THEN 931
                                  ELSE 908
                                END
                                ELSE CASE WHEN (0.9799915437651908::DOUBLE) * x::DOUBLE + (0.19903912718035627::DOUBLE) * y::DOUBLE >= (11.727050957859138::DOUBLE)
                                  THEN 931
                                  ELSE 900
                                END
                              END
                            END
                            ELSE CASE WHEN (0.8758213513629303::DOUBLE) * x::DOUBLE + (0.4826354322848777::DOUBLE) * y::DOUBLE >= (12.609794142221489::DOUBLE)
                              THEN CASE WHEN (0.051277031738772204::DOUBLE) * x::DOUBLE + (-0.9986844676954083::DOUBLE) * y::DOUBLE >= (-4.450706104780302::DOUBLE)
                                THEN 976
                                ELSE CASE WHEN (0.081872248017463::DOUBLE) * x::DOUBLE + (0.9966428322145136::DOUBLE) * y::DOUBLE >= (6.546057984902114::DOUBLE)
                                  THEN 981
                                  ELSE 970
                                END
                              END
                              ELSE CASE WHEN (0.5852454969715217::DOUBLE) * x::DOUBLE + (0.8108561575733125::DOUBLE) * y::DOUBLE >= (10.478308408426084::DOUBLE)
                                THEN CASE WHEN (0.8950552098284046::DOUBLE) * x::DOUBLE + (-0.4459553468218881::DOUBLE) * y::DOUBLE >= (8.141135946146989::DOUBLE)
                                  THEN 976
                                  ELSE 932
                                END
                                ELSE 908
                              END
                            END
                          END
                          ELSE CASE WHEN (0.9639601290084171::DOUBLE) * x::DOUBLE + (-0.266046743415656::DOUBLE) * y::DOUBLE >= (9.678934373960496::DOUBLE)
                            THEN CASE WHEN (0.35618361437675217::DOUBLE) * x::DOUBLE + (0.93441598490689::DOUBLE) * y::DOUBLE >= (7.615478140728346::DOUBLE)
                              THEN CASE WHEN (0.5437915491970156::DOUBLE) * x::DOUBLE + (-0.8392203232893671::DOUBLE) * y::DOUBLE >= (3.0423143417361485::DOUBLE)
                                THEN 950
                                ELSE CASE WHEN (0.21861219975248872::DOUBLE) * x::DOUBLE + (-0.9758118190098837::DOUBLE) * y::DOUBLE >= (-1.5088685467151364::DOUBLE)
                                  THEN CASE WHEN (0.9437524427875623::DOUBLE) * x::DOUBLE + (0.3306528795164334::DOUBLE) * y::DOUBLE >= (12.151005256124439::DOUBLE)
                                    THEN 953
                                    ELSE 937
                                  END
                                  ELSE CASE WHEN (0.8141292976976031::DOUBLE) * x::DOUBLE + (-0.580683637302109::DOUBLE) * y::DOUBLE >= (6.924654803190181::DOUBLE)
                                    THEN 953
                                    ELSE 931
                                  END
                                END
                              END
                              ELSE CASE WHEN (0.9163710436770173::DOUBLE) * x::DOUBLE + (0.40033000176141476::DOUBLE) * y::DOUBLE >= (11.730473948890758::DOUBLE)
                                THEN CASE WHEN (0.21306378412399649::DOUBLE) * x::DOUBLE + (-0.9770382919286035::DOUBLE) * y::DOUBLE >= (-1.1269665566285112::DOUBLE)
                                  THEN CASE WHEN (0.7763008224583144::DOUBLE) * x::DOUBLE + (0.6303626202833925::DOUBLE) * y::DOUBLE >= (11.135673466477057::DOUBLE)
                                    THEN 950
                                    ELSE 936
                                  END
                                  ELSE CASE WHEN (0.9481171521142602::DOUBLE) * x::DOUBLE + (-0.31792116297400647::DOUBLE) * y::DOUBLE >= (9.643455979613755::DOUBLE)
                                    THEN 950
                                    ELSE 930
                                  END
                                END
                                ELSE CASE WHEN (0.8657428017738638::DOUBLE) * x::DOUBLE + (-0.5004891618973787::DOUBLE) * y::DOUBLE >= (7.91743671055793::DOUBLE)
                                  THEN 936
                                  ELSE 912
                                END
                              END
                            END
                            ELSE CASE WHEN (0.9876088019302612::DOUBLE) * x::DOUBLE + (0.15693582876409767::DOUBLE) * y::DOUBLE >= (11.596255380182711::DOUBLE)
                              THEN CASE WHEN (0.9799915437651908::DOUBLE) * x::DOUBLE + (0.19903912718035627::DOUBLE) * y::DOUBLE >= (11.727050957859138::DOUBLE)
                                THEN CASE WHEN (0.21861219975248872::DOUBLE) * x::DOUBLE + (-0.9758118190098837::DOUBLE) * y::DOUBLE >= (-1.5088685467151364::DOUBLE)
                                  THEN 937
                                  ELSE 931
                                END
                                ELSE CASE WHEN (0.8685637907926105::DOUBLE) * x::DOUBLE + (-0.49557738177197963::DOUBLE) * y::DOUBLE >= (7.676705960663356::DOUBLE)
                                  THEN 937
                                  ELSE 900
                                END
                              END
                              ELSE CASE WHEN (0.6998904233358382::DOUBLE) * x::DOUBLE + (-0.7142502329875582::DOUBLE) * y::DOUBLE >= (5.00980724593205::DOUBLE)
                                THEN 912
                                ELSE CASE WHEN (0.9902440472175671::DOUBLE) * x::DOUBLE + (-0.13934391608596658::DOUBLE) * y::DOUBLE >= (10.03594206968778::DOUBLE)
                                  THEN CASE WHEN (0.14886990746535375::DOUBLE) * x::DOUBLE + (0.9888567897583841::DOUBLE) * y::DOUBLE >= (5.5895512987604326::DOUBLE)
                                    THEN 900
                                    ELSE 895
                                  END
                                  ELSE CASE WHEN (0.8715528464319039::DOUBLE) * x::DOUBLE + (0.49030157645723094::DOUBLE) * y::DOUBLE >= (11.31003025378934::DOUBLE)
                                    THEN 900
                                    ELSE 865
                                  END
                                END
                              END
                            END
                          END
                        END
                        ELSE CASE WHEN (0.998257936083099::DOUBLE) * x::DOUBLE + (-0.05900078852957293::DOUBLE) * y::DOUBLE >= (10.616459785367256::DOUBLE)
                          THEN CASE WHEN (0.986398933128617::DOUBLE) * x::DOUBLE + (0.16436892870225264::DOUBLE) * y::DOUBLE >= (11.502354338692596::DOUBLE)
                            THEN CASE WHEN (0.05140219325060898::DOUBLE) * x::DOUBLE + (-0.9986780334667561::DOUBLE) * y::DOUBLE >= (-2.9475160325107748::DOUBLE)
                              THEN CASE WHEN (0.9212005978141152::DOUBLE) * x::DOUBLE + (-0.38908798309240633::DOUBLE) * y::DOUBLE >= (8.991147274470698::DOUBLE)
                                THEN CASE WHEN (0.41255037917858156::DOUBLE) * x::DOUBLE + (0.9109347861617805::DOUBLE) * y::DOUBLE >= (7.771584829164995::DOUBLE)
                                  THEN 936
                                  ELSE 927
                                END
                                ELSE CASE WHEN (0.914757213152768::DOUBLE) * x::DOUBLE + (0.40400401110011414::DOUBLE) * y::DOUBLE >= (11.65584190941074::DOUBLE)
                                  THEN 936
                                  ELSE 913
                                END
                              END
                              ELSE CASE WHEN (0.8657428017738638::DOUBLE) * x::DOUBLE + (-0.5004891618973787::DOUBLE) * y::DOUBLE >= (7.91743671055793::DOUBLE)
                                THEN 936
                                ELSE 912
                              END
                            END
                            ELSE CASE WHEN (0.7522774381625641::DOUBLE) * x::DOUBLE + (0.6588464586165501::DOUBLE) * y::DOUBLE >= (10.493833799258503::DOUBLE)
                              THEN CASE WHEN (0.924514476062707::DOUBLE) * x::DOUBLE + (0.3811469317080991::DOUBLE) * y::DOUBLE >= (11.48249331259876::DOUBLE)
                                THEN CASE WHEN (0.05140219325060898::DOUBLE) * x::DOUBLE + (-0.9986780334667561::DOUBLE) * y::DOUBLE >= (-2.9475160325107748::DOUBLE)
                                  THEN 913
                                  ELSE 912
                                END
                                ELSE CASE WHEN (0.9102123415729763::DOUBLE) * x::DOUBLE + (-0.4141418757482023::DOUBLE) * y::DOUBLE >= (8.529301016937497::DOUBLE)
                                  THEN 913
                                  ELSE 889
                                END
                              END
                              ELSE CASE WHEN (0.5429309899006551::DOUBLE) * x::DOUBLE + (-0.8397773158436078::DOUBLE) * y::DOUBLE >= (3.0482211948320734::DOUBLE)
                                THEN 904
                                ELSE 889
                              END
                            END
                          END
                          ELSE CASE WHEN (0.9643570518041452::DOUBLE) * x::DOUBLE + (-0.26460437758211286::DOUBLE) * y::DOUBLE >= (9.183775571726144::DOUBLE)
                            THEN CASE WHEN (0.37749257339383324::DOUBLE) * x::DOUBLE + (0.9260126117027249::DOUBLE) * y::DOUBLE >= (7.2150986290419965::DOUBLE)
                              THEN CASE WHEN (0.00999552700560452::DOUBLE) * x::DOUBLE + (0.9999500434721128::DOUBLE) * y::DOUBLE >= (3.7672876539169113::DOUBLE)
                                THEN CASE WHEN (0.6474793224801979::DOUBLE) * x::DOUBLE + (-0.7620830184176681::DOUBLE) * y::DOUBLE >= (4.050525452870721::DOUBLE)
                                  THEN 889
                                  ELSE 865
                                END
                                ELSE CASE WHEN (0.9429585695128485::DOUBLE) * x::DOUBLE + (0.3329101022532696::DOUBLE) * y::DOUBLE >= (11.182224295194665::DOUBLE)
                                  THEN 889
                                  ELSE 864
                                END
                              END
                              ELSE CASE WHEN (0.2366153049330149::DOUBLE) * x::DOUBLE + (-0.9716034157368203::DOUBLE) * y::DOUBLE >= (-0.6716358596489256::DOUBLE)
                                THEN CASE WHEN (0.5818723911214871::DOUBLE) * x::DOUBLE + (0.8132800996277747::DOUBLE) * y::DOUBLE >= (8.773966671524125::DOUBLE)
                                  THEN 881
                                  ELSE 873
                                END
                                ELSE CASE WHEN (0.8749994987553946::DOUBLE) * x::DOUBLE + (-0.48412382422042394::DOUBLE) * y::DOUBLE >= (7.636735913721482::DOUBLE)
                                  THEN 881
                                  ELSE 864
                                END
                              END
                            END
                            ELSE CASE WHEN (0.20401449134809624::DOUBLE) * x::DOUBLE + (0.9789678683797429::DOUBLE) * y::DOUBLE >= (5.516033663210624::DOUBLE)
                              THEN CASE WHEN (0.6610896377126194::DOUBLE) * x::DOUBLE + (-0.7503069311348506::DOUBLE) * y::DOUBLE >= (4.1780665528836485::DOUBLE)
                                THEN CASE WHEN (0.00999552700560452::DOUBLE) * x::DOUBLE + (0.9999500434721128::DOUBLE) * y::DOUBLE >= (3.7672876539169113::DOUBLE)
                                  THEN 865
                                  ELSE 864
                                END
                                ELSE CASE WHEN (0.7358799933375489::DOUBLE) * x::DOUBLE + (0.6771119814369917::DOUBLE) * y::DOUBLE >= (10.189921536592472::DOUBLE)
                                  THEN 865
                                  ELSE 851
                                END
                              END
                              ELSE CASE WHEN (0.8056826364155552::DOUBLE) * x::DOUBLE + (0.5923474397500847::DOUBLE) * y::DOUBLE >= (10.003736389349333::DOUBLE)
                                THEN CASE WHEN (0.9665516078196092::DOUBLE) * x::DOUBLE + (0.2564722000945293::DOUBLE) * y::DOUBLE >= (10.834371936809308::DOUBLE)
                                  THEN 864
                                  ELSE 846
                                END
                                ELSE 827
                              END
                            END
                          END
                        END
                      END
                    END
                    ELSE CASE WHEN (0.897687559666272::DOUBLE) * x::DOUBLE + (0.4406325512492389::DOUBLE) * y::DOUBLE >= (10.782067793446123::DOUBLE)
                      THEN CASE WHEN (0.7525788316755437::DOUBLE) * x::DOUBLE + (0.6585021656106178::DOUBLE) * y::DOUBLE >= (11.312030850191125::DOUBLE)
                        THEN CASE WHEN (0.9185722348980735::DOUBLE) * x::DOUBLE + (0.3952531458120967::DOUBLE) * y::DOUBLE >= (12.361350317362398::DOUBLE)
                          THEN CASE WHEN (0.6070199147753774::DOUBLE) * x::DOUBLE + (-0.7946866194079861::DOUBLE) * y::DOUBLE >= (2.1700319857181087::DOUBLE)
                            THEN CASE WHEN (0.6385019919941544::DOUBLE) * x::DOUBLE + (0.7696201700965852::DOUBLE) * y::DOUBLE >= (11.57155304636095::DOUBLE)
                              THEN CASE WHEN (0.40119017317879063::DOUBLE) * x::DOUBLE + (0.9159947843436511::DOUBLE) * y::DOUBLE >= (10.195340152347962::DOUBLE)
                                THEN CASE WHEN (0.23956516670963707::DOUBLE) * x::DOUBLE + (-0.9708802865953062::DOUBLE) * y::DOUBLE >= (-3.1162113382389873::DOUBLE)
                                  THEN 981
                                  ELSE 965
                                END
                                ELSE CASE WHEN (0.5587974972198694::DOUBLE) * x::DOUBLE + (-0.8293041402892006::DOUBLE) * y::DOUBLE >= (1.895120857210089::DOUBLE)
                                  THEN CASE WHEN (0.081872248017463::DOUBLE) * x::DOUBLE + (0.9966428322145136::DOUBLE) * y::DOUBLE >= (6.546057984902114::DOUBLE)
                                    THEN 981
                                    ELSE 970
                                  END
                                  ELSE CASE WHEN (0.9540832210456933::DOUBLE) * x::DOUBLE + (0.29954166207570315::DOUBLE) * y::DOUBLE >= (12.852791629417364::DOUBLE)
                                    THEN 981
                                    ELSE 943
                                  END
                                END
                              END
                              ELSE CASE WHEN (0.20888614638827502::DOUBLE) * x::DOUBLE + (-0.9779399663819125::DOUBLE) * y::DOUBLE >= (-2.799316089487368::DOUBLE)
                                THEN CASE WHEN (0.8758213513629303::DOUBLE) * x::DOUBLE + (0.4826354322848777::DOUBLE) * y::DOUBLE >= (12.609794142221489::DOUBLE)
                                  THEN 970
                                  ELSE 932
                                END
                                ELSE CASE WHEN (0.9563699959641286::DOUBLE) * x::DOUBLE + (-0.29215822908070294::DOUBLE) * y::DOUBLE >= (9.417634514646272::DOUBLE)
                                  THEN 970
                                  ELSE 922
                                END
                              END
                            END
                            ELSE CASE WHEN (0.8913082550558427::DOUBLE) * x::DOUBLE + (0.45339783244884285::DOUBLE) * y::DOUBLE >= (13.03587947859888::DOUBLE)
                              THEN 965
                              ELSE CASE WHEN (0.7307730620282008::DOUBLE) * x::DOUBLE + (-0.6826204888618032::DOUBLE) * y::DOUBLE >= (4.161845433077694::DOUBLE)
                                THEN CASE WHEN (0.002729555783199635::DOUBLE) * x::DOUBLE + (0.9999962747556745::DOUBLE) * y::DOUBLE >= (5.816053577021211::DOUBLE)
                                  THEN 923
                                  ELSE 922
                                END
                                ELSE CASE WHEN (0.9024739353959083::DOUBLE) * x::DOUBLE + (0.4307444670927556::DOUBLE) * y::DOUBLE >= (12.509350012732185::DOUBLE)
                                  THEN 923
                                  ELSE 887
                                END
                              END
                            END
                          END
                          ELSE CASE WHEN (0.4760503093691792::DOUBLE) * x::DOUBLE + (-0.879418047887072::DOUBLE) * y::DOUBLE >= (0.4908184712663637::DOUBLE)
                            THEN CASE WHEN (0.5852454969715217::DOUBLE) * x::DOUBLE + (0.8108561575733125::DOUBLE) * y::DOUBLE >= (10.478308408426084::DOUBLE)
                              THEN CASE WHEN (0.7045810211427732::DOUBLE) * x::DOUBLE + (0.7096235513604428::DOUBLE) * y::DOUBLE >= (11.511065764666537::DOUBLE)
                                THEN CASE WHEN (0.20888614638827502::DOUBLE) * x::DOUBLE + (-0.9779399663819125::DOUBLE) * y::DOUBLE >= (-2.799316089487368::DOUBLE)
                                  THEN 932
                                  ELSE 922
                                END
                                ELSE CASE WHEN (0.9987979966249093::DOUBLE) * x::DOUBLE + (-0.049015935552303186::DOUBLE) * y::DOUBLE >= (10.802976989698765::DOUBLE)
                                  THEN 932
                                  ELSE 890
                                END
                              END
                              ELSE CASE WHEN (0.995744389080078::DOUBLE) * x::DOUBLE + (0.092158079491394::DOUBLE) * y::DOUBLE >= (10.974014963997607::DOUBLE)
                                THEN CASE WHEN (0.4501075646511882::DOUBLE) * x::DOUBLE + (-0.8929743446727775::DOUBLE) * y::DOUBLE >= (0.565354614397406::DOUBLE)
                                  THEN 908
                                  ELSE 890
                                END
                                ELSE 855
                              END
                            END
                            ELSE CASE WHEN (0.48501461581651517::DOUBLE) * x::DOUBLE + (0.8745060448300849::DOUBLE) * y::DOUBLE >= (9.796159382384758::DOUBLE)
                              THEN CASE WHEN (0.6686810201562118::DOUBLE) * x::DOUBLE + (-0.7435493885969162::DOUBLE) * y::DOUBLE >= (2.8507523647133377::DOUBLE)
                                THEN CASE WHEN (0.3088753884237038::DOUBLE) * x::DOUBLE + (0.9511025152033328::DOUBLE) * y::DOUBLE >= (8.683581290866693::DOUBLE)
                                  THEN CASE WHEN (0.7307730620282008::DOUBLE) * x::DOUBLE + (-0.6826204888618032::DOUBLE) * y::DOUBLE >= (4.161845433077694::DOUBLE)
                                    THEN 922
                                    ELSE 887
                                  END
                                  ELSE CASE WHEN (0.9943796353399574::DOUBLE) * x::DOUBLE + (0.10587322995532492::DOUBLE) * y::DOUBLE >= (11.443081399296698::DOUBLE)
                                    THEN 922
                                    ELSE 878
                                  END
                                END
                                ELSE CASE WHEN (0.9684428604758493::DOUBLE) * x::DOUBLE + (0.2492356836276756::DOUBLE) * y::DOUBLE >= (11.675009471096384::DOUBLE)
                                  THEN 887
                                  ELSE 858
                                END
                              END
                              ELSE CASE WHEN (0.985097777692962::DOUBLE) * x::DOUBLE + (0.1719952568659607::DOUBLE) * y::DOUBLE >= (11.127670083248162::DOUBLE)
                                THEN CASE WHEN (0.6699464461038592::DOUBLE) * x::DOUBLE + (0.7424094283835632::DOUBLE) * y::DOUBLE >= (10.887347083565476::DOUBLE)
                                  THEN 878
                                  ELSE 855
                                END
                                ELSE 839
                              END
                            END
                          END
                        END
                        ELSE CASE WHEN (0.5714070720222106::DOUBLE) * x::DOUBLE + (-0.8206667764951887::DOUBLE) * y::DOUBLE >= (1.947846528090286::DOUBLE)
                          THEN CASE WHEN (0.9030118205953144::DOUBLE) * x::DOUBLE + (0.42961570253557513::DOUBLE) * y::DOUBLE >= (11.340483878767571::DOUBLE)
                            THEN CASE WHEN (0.24283691871289126::DOUBLE) * x::DOUBLE + (-0.9700671270123675::DOUBLE) * y::DOUBLE >= (-1.8179520828851397::DOUBLE)
                              THEN CASE WHEN (0.2996625957672061::DOUBLE) * x::DOUBLE + (0.9540452445759896::DOUBLE) * y::DOUBLE >= (7.089152608313071::DOUBLE)
                                THEN CASE WHEN (0.8970100529612647::DOUBLE) * x::DOUBLE + (-0.4420101411579028::DOUBLE) * y::DOUBLE >= (7.7832269206138225::DOUBLE)
                                  THEN CASE WHEN (0.1837188411185582::DOUBLE) * x::DOUBLE + (0.9829788336571921::DOUBLE) * y::DOUBLE >= (6.360082199139901::DOUBLE)
                                    THEN 908
                                    ELSE 900
                                  END
                                  ELSE CASE WHEN (0.7820704437513564::DOUBLE) * x::DOUBLE + (0.6231900360327953::DOUBLE) * y::DOUBLE >= (11.263559063181864::DOUBLE)
                                    THEN 908
                                    ELSE 877
                                  END
                                END
                                ELSE CASE WHEN (0.8715528464319039::DOUBLE) * x::DOUBLE + (0.49030157645723094::DOUBLE) * y::DOUBLE >= (11.31003025378934::DOUBLE)
                                  THEN 900
                                  ELSE 865
                                END
                              END
                              ELSE CASE WHEN (0.6331500032078786::DOUBLE) * x::DOUBLE + (0.7740291166602605::DOUBLE) * y::DOUBLE >= (10.540156585091704::DOUBLE)
                                THEN CASE WHEN (0.4501075646511882::DOUBLE) * x::DOUBLE + (-0.8929743446727775::DOUBLE) * y::DOUBLE >= (0.565354614397406::DOUBLE)
                                  THEN 908
                                  ELSE 890
                                END
                                ELSE CASE WHEN (0.99735855484824::DOUBLE) * x::DOUBLE + (-0.07263548079988533::DOUBLE) * y::DOUBLE >= (10.401895018382476::DOUBLE)
                                  THEN 908
                                  ELSE 868
                                END
                              END
                            END
                            ELSE CASE WHEN (0.4738167632279603::DOUBLE) * x::DOUBLE + (0.8806234580592202::DOUBLE) * y::DOUBLE >= (8.54328801883677::DOUBLE)
                              THEN CASE WHEN (0.5260697759376212::DOUBLE) * x::DOUBLE + (-0.8504414094133358::DOUBLE) * y::DOUBLE >= (1.834434206298854::DOUBLE)
                                THEN CASE WHEN (0.2996625957672061::DOUBLE) * x::DOUBLE + (0.9540452445759896::DOUBLE) * y::DOUBLE >= (7.089152608313071::DOUBLE)
                                  THEN 877
                                  ELSE 865
                                END
                                ELSE CASE WHEN (0.8999023368477924::DOUBLE) * x::DOUBLE + (0.4360914859704124::DOUBLE) * y::DOUBLE >= (11.285338878476193::DOUBLE)
                                  THEN CASE WHEN (0.24283691871289126::DOUBLE) * x::DOUBLE + (-0.9700671270123675::DOUBLE) * y::DOUBLE >= (-1.8179520828851397::DOUBLE)
                                    THEN 877
                                    ELSE 868
                                  END
                                  ELSE CASE WHEN (0.9437324465560509::DOUBLE) * x::DOUBLE + (-0.3307099474121254::DOUBLE) * y::DOUBLE >= (8.311685310469224::DOUBLE)
                                    THEN 877
                                    ELSE 840
                                  END
                                END
                              END
                              ELSE CASE WHEN (0.5939735845292576::DOUBLE) * x::DOUBLE + (-0.8044845435938871::DOUBLE) * y::DOUBLE >= (2.8352034865602826::DOUBLE)
                                THEN CASE WHEN (0.7358799933375489::DOUBLE) * x::DOUBLE + (0.6771119814369917::DOUBLE) * y::DOUBLE >= (10.189921536592472::DOUBLE)
                                  THEN 865
                                  ELSE 851
                                END
                                ELSE CASE WHEN (0.9320586547719119::DOUBLE) * x::DOUBLE + (-0.36230741651914067::DOUBLE) * y::DOUBLE >= (8.03972648906548::DOUBLE)
                                  THEN 865
                                  ELSE 826
                                END
                              END
                            END
                          END
                          ELSE CASE WHEN (0.576912353483442::DOUBLE) * x::DOUBLE + (-0.8168060580077722::DOUBLE) * y::DOUBLE >= (1.6468323529907707::DOUBLE)
                            THEN CASE WHEN (0.8184880199925442::DOUBLE) * x::DOUBLE + (0.5745235949277319::DOUBLE) * y::DOUBLE >= (11.287414841071836::DOUBLE)
                              THEN CASE WHEN (0.6699464461038592::DOUBLE) * x::DOUBLE + (0.7424094283835632::DOUBLE) * y::DOUBLE >= (10.887347083565476::DOUBLE)
                                THEN 878
                                ELSE CASE WHEN (0.995744389080078::DOUBLE) * x::DOUBLE + (0.092158079491394::DOUBLE) * y::DOUBLE >= (10.974014963997607::DOUBLE)
                                  THEN 890
                                  ELSE 855
                                END
                              END
                              ELSE CASE WHEN (0.7470914666354804::DOUBLE) * x::DOUBLE + (-0.6647212502097755::DOUBLE) * y::DOUBLE >= (4.326897753711024::DOUBLE)
                                THEN CASE WHEN (0.3268643779265043::DOUBLE) * x::DOUBLE + (0.945071255748856::DOUBLE) * y::DOUBLE >= (7.839006381812974::DOUBLE)
                                  THEN 855
                                  ELSE 840
                                END
                                ELSE CASE WHEN (0.919342480886415::DOUBLE) * x::DOUBLE + (0.39345826060410993::DOUBLE) * y::DOUBLE >= (11.15276735602421::DOUBLE)
                                  THEN 855
                                  ELSE 819
                                END
                              END
                            END
                            ELSE CASE WHEN (0.9400624496933292::DOUBLE) * x::DOUBLE + (-0.341002332362371::DOUBLE) * y::DOUBLE >= (7.495700868514873::DOUBLE)
                              THEN CASE WHEN (0.5215079133783764::DOUBLE) * x::DOUBLE + (0.8532464452218549::DOUBLE) * y::DOUBLE >= (9.496510335560389::DOUBLE)
                                THEN CASE WHEN (0.985097777692962::DOUBLE) * x::DOUBLE + (0.1719952568659607::DOUBLE) * y::DOUBLE >= (11.127670083248162::DOUBLE)
                                  THEN 878
                                  ELSE 839
                                END
                                ELSE 819
                              END
                              ELSE CASE WHEN (0.7198489298084407::DOUBLE) * x::DOUBLE + (-0.6941307645203768::DOUBLE) * y::DOUBLE >= (3.4751945888141904::DOUBLE)
                                THEN CASE WHEN (0.004797562805818165::DOUBLE) * x::DOUBLE + (0.9999884916293408::DOUBLE) * y::DOUBLE >= (5.168077255614366::DOUBLE)
                                  THEN 820
                                  ELSE 819
                                END
                                ELSE CASE WHEN (0.6975680977800839::DOUBLE) * x::DOUBLE + (0.7165184917079779::DOUBLE) * y::DOUBLE >= (10.481934708279265::DOUBLE)
                                  THEN 820
                                  ELSE 793
                                END
                              END
                            END
                          END
                        END
                      END
                      ELSE CASE WHEN (0.5971987753416073::DOUBLE) * x::DOUBLE + (-0.8020932755798944::DOUBLE) * y::DOUBLE >= (2.51658524699432::DOUBLE)
                        THEN CASE WHEN (0.7260912535404692::DOUBLE) * x::DOUBLE + (0.6875983504430692::DOUBLE) * y::DOUBLE >= (9.3262409695799::DOUBLE)
                          THEN CASE WHEN (0.3294198333943664::DOUBLE) * x::DOUBLE + (-0.9441835485573914::DOUBLE) * y::DOUBLE >= (-0.10264615666233246::DOUBLE)
                            THEN CASE WHEN (0.518887346881775::DOUBLE) * x::DOUBLE + (0.8548426295207748::DOUBLE) * y::DOUBLE >= (8.090611020689467::DOUBLE)
                              THEN CASE WHEN (0.5671360763113829::DOUBLE) * x::DOUBLE + (-0.8236241077980473::DOUBLE) * y::DOUBLE >= (2.825866433389461::DOUBLE)
                                THEN CASE WHEN (0.20401449134809624::DOUBLE) * x::DOUBLE + (0.9789678683797429::DOUBLE) * y::DOUBLE >= (5.516033663210624::DOUBLE)
                                  THEN 851
                                  ELSE 846
                                END
                                ELSE CASE WHEN (0.9903973176220684::DOUBLE) * x::DOUBLE + (0.13825032819856758::DOUBLE) * y::DOUBLE >= (10.497452633579803::DOUBLE)
                                  THEN 851
                                  ELSE 831
                                END
                              END
                              ELSE CASE WHEN (0.6596069218027086::DOUBLE) * x::DOUBLE + (-0.7516107428117::DOUBLE) * y::DOUBLE >= (4.048885279990723::DOUBLE)
                                THEN CASE WHEN (0.8056826364155552::DOUBLE) * x::DOUBLE + (0.5923474397500847::DOUBLE) * y::DOUBLE >= (10.003736389349333::DOUBLE)
                                  THEN 846
                                  ELSE 827
                                END
                                ELSE CASE WHEN (0.9999204301720356::DOUBLE) * x::DOUBLE + (0.012614805768268548::DOUBLE) * y::DOUBLE >= (9.995784046627515::DOUBLE)
                                  THEN 846
                                  ELSE 817
                                END
                              END
                            END
                            ELSE CASE WHEN (0.9997029707185318::DOUBLE) * x::DOUBLE + (-0.02437150665310802::DOUBLE) * y::DOUBLE >= (9.698661535030261::DOUBLE)
                              THEN CASE WHEN (0.08315127851546149::DOUBLE) * x::DOUBLE + (-0.9965369360346079::DOUBLE) * y::DOUBLE >= (-3.0499790695763194::DOUBLE)
                                THEN CASE WHEN (0.9903973176220684::DOUBLE) * x::DOUBLE + (0.13825032819856758::DOUBLE) * y::DOUBLE >= (10.497452633579803::DOUBLE)
                                  THEN 851
                                  ELSE 831
                                END
                                ELSE CASE WHEN (0.5939735845292576::DOUBLE) * x::DOUBLE + (-0.8044845435938871::DOUBLE) * y::DOUBLE >= (2.8352034865602826::DOUBLE)
                                  THEN 851
                                  ELSE 826
                                END
                              END
                              ELSE CASE WHEN (0.6240301869723999::DOUBLE) * x::DOUBLE + (0.7814002340332332::DOUBLE) * y::DOUBLE >= (8.76234768709454::DOUBLE)
                                THEN CASE WHEN (0.5314006008243811::DOUBLE) * x::DOUBLE + (-0.8471206534157261::DOUBLE) * y::DOUBLE >= (1.844668101847044::DOUBLE)
                                  THEN CASE WHEN (0.48516226023449455::DOUBLE) * x::DOUBLE + (0.8744241426471232::DOUBLE) * y::DOUBLE >= (8.14367652860312::DOUBLE)
                                    THEN 826
                                    ELSE 806
                                  END
                                  ELSE CASE WHEN (0.9378990527072391::DOUBLE) * x::DOUBLE + (0.3469082975814553::DOUBLE) * y::DOUBLE >= (10.476558984747657::DOUBLE)
                                    THEN 826
                                    ELSE 791
                                  END
                                END
                                ELSE CASE WHEN (0.9953732961489::DOUBLE) * x::DOUBLE + (0.09608330403183633::DOUBLE) * y::DOUBLE >= (9.704739404150052::DOUBLE)
                                  THEN 806
                                  ELSE 769
                                END
                              END
                            END
                          END
                          ELSE CASE WHEN (0.7999819403263655::DOUBLE) * x::DOUBLE + (-0.6000240788098954::DOUBLE) * y::DOUBLE >= (5.485867478155541::DOUBLE)
                            THEN CASE WHEN (0.9824256940472282::DOUBLE) * x::DOUBLE + (-0.18665410704247015::DOUBLE) * y::DOUBLE >= (8.764913016355262::DOUBLE)
                              THEN CASE WHEN (0.8250788274548827::DOUBLE) * x::DOUBLE + (0.5650176355527993::DOUBLE) * y::DOUBLE >= (9.806080285723443::DOUBLE)
                                THEN 817
                                ELSE 800
                              END
                              ELSE CASE WHEN (0.017532920965124193::DOUBLE) * x::DOUBLE + (-0.9998462865272996::DOUBLE) * y::DOUBLE >= (-3.0584799288275013::DOUBLE)
                                THEN CASE WHEN (0.7661438369966213::DOUBLE) * x::DOUBLE + (0.6426691380734683::DOUBLE) * y::DOUBLE >= (9.256455175008515::DOUBLE)
                                  THEN 800
                                  ELSE 786
                                END
                                ELSE CASE WHEN (0.65879235018338::DOUBLE) * x::DOUBLE + (-0.7523248230251738::DOUBLE) * y::DOUBLE >= (3.753094134709458::DOUBLE)
                                  THEN 800
                                  ELSE 785
                                END
                              END
                            END
                            ELSE CASE WHEN (0.9500218042371266::DOUBLE) * x::DOUBLE + (0.31218355413768145::DOUBLE) * y::DOUBLE >= (9.580805772655301::DOUBLE)
                              THEN CASE WHEN (0.2457666926732418::DOUBLE) * x::DOUBLE + (0.9693290116221924::DOUBLE) * y::DOUBLE >= (5.575073947574559::DOUBLE)
                                THEN CASE WHEN (0.7129685334301151::DOUBLE) * x::DOUBLE + (-0.7011960284674401::DOUBLE) * y::DOUBLE >= (4.149428826841211::DOUBLE)
                                  THEN 785
                                  ELSE 769
                                END
                                ELSE CASE WHEN (0.9160740451853154::DOUBLE) * x::DOUBLE + (0.40100915667577064::DOUBLE) * y::DOUBLE >= (9.787385668997029::DOUBLE)
                                  THEN 785
                                  ELSE 762
                                END
                              END
                              ELSE CASE WHEN (0.5722577393264042::DOUBLE) * x::DOUBLE + (-0.8200738258114528::DOUBLE) * y::DOUBLE >= (2.3100624746981953::DOUBLE)
                                THEN CASE WHEN (0.8954640184715378::DOUBLE) * x::DOUBLE + (0.4451339030256011::DOUBLE) * y::DOUBLE >= (9.475251493066292::DOUBLE)
                                  THEN 762
                                  ELSE 745
                                END
                                ELSE CASE WHEN (0.9066155187656574::DOUBLE) * x::DOUBLE + (-0.42195770064460014::DOUBLE) * y::DOUBLE >= (6.634369595233906::DOUBLE)
                                  THEN 762
                                  ELSE 730
                                END
                              END
                            END
                          END
                        END
                        ELSE CASE WHEN (0.601641649648182::DOUBLE) * x::DOUBLE + (0.7987661268535454::DOUBLE) * y::DOUBLE >= (9.00194503191996::DOUBLE)
                          THEN CASE WHEN (0.7010550510602856::DOUBLE) * x::DOUBLE + (-0.7131071556104738::DOUBLE) * y::DOUBLE >= (3.3820315519838666::DOUBLE)
                            THEN CASE WHEN (0.7992218851115787::DOUBLE) * x::DOUBLE + (0.6010360874013264::DOUBLE) * y::DOUBLE >= (10.443105384136718::DOUBLE)
                              THEN CASE WHEN (0.19831704801177896::DOUBLE) * x::DOUBLE + (-0.9801379231862697::DOUBLE) * y::DOUBLE >= (-2.430482251831254::DOUBLE)
                                THEN CASE WHEN (0.4738167632279603::DOUBLE) * x::DOUBLE + (0.8806234580592202::DOUBLE) * y::DOUBLE >= (8.54328801883677::DOUBLE)
                                  THEN 840
                                  ELSE 826
                                END
                                ELSE CASE WHEN (0.7470914666354804::DOUBLE) * x::DOUBLE + (-0.6647212502097755::DOUBLE) * y::DOUBLE >= (4.326897753711024::DOUBLE)
                                  THEN 840
                                  ELSE 819
                                END
                              END
                              ELSE CASE WHEN (0.14682612304512263::DOUBLE) * x::DOUBLE + (-0.9891623171105632::DOUBLE) * y::DOUBLE >= (-2.806819224407106::DOUBLE)
                                THEN CASE WHEN (0.9378990527072391::DOUBLE) * x::DOUBLE + (0.3469082975814553::DOUBLE) * y::DOUBLE >= (10.476558984747657::DOUBLE)
                                  THEN 826
                                  ELSE 791
                                END
                                ELSE CASE WHEN (0.8218411663488521::DOUBLE) * x::DOUBLE + (-0.569716681600915::DOUBLE) * y::DOUBLE >= (5.456772000041802::DOUBLE)
                                  THEN 826
                                  ELSE 784
                                END
                              END
                            END
                            ELSE CASE WHEN (0.9956772117648118::DOUBLE) * x::DOUBLE + (-0.09288105281622171::DOUBLE) * y::DOUBLE >= (8.653760172654698::DOUBLE)
                              THEN CASE WHEN (0.55136117945446::DOUBLE) * x::DOUBLE + (-0.8342666538886635::DOUBLE) * y::DOUBLE >= (1.1469572908782997::DOUBLE)
                                THEN CASE WHEN (0.1460503177622584::DOUBLE) * x::DOUBLE + (0.989277162721117::DOUBLE) * y::DOUBLE >= (6.130057582357711::DOUBLE)
                                  THEN CASE WHEN (0.7198489298084407::DOUBLE) * x::DOUBLE + (-0.6941307645203768::DOUBLE) * y::DOUBLE >= (3.4751945888141904::DOUBLE)
                                    THEN 819
                                    ELSE 793
                                  END
                                  ELSE CASE WHEN (0.7992218851115787::DOUBLE) * x::DOUBLE + (0.6010360874013264::DOUBLE) * y::DOUBLE >= (10.443105384136718::DOUBLE)
                                    THEN 819
                                    ELSE 784
                                  END
                                END
                                ELSE CASE WHEN (0.9047240685613044::DOUBLE) * x::DOUBLE + (0.4259980748382325::DOUBLE) * y::DOUBLE >= (10.522896339873778::DOUBLE)
                                  THEN 793
                                  ELSE 763
                                END
                              END
                              ELSE CASE WHEN (0.6799989475207444::DOUBLE) * x::DOUBLE + (-0.7332130872881907::DOUBLE) * y::DOUBLE >= (2.4730224936923153::DOUBLE)
                                THEN CASE WHEN (0.4915257380248206::DOUBLE) * x::DOUBLE + (0.8708630482797829::DOUBLE) * y::DOUBLE >= (8.540509623519444::DOUBLE)
                                  THEN 763
                                  ELSE 742
                                END
                                ELSE CASE WHEN (0.9922018192455394::DOUBLE) * x::DOUBLE + (0.12464168598764289::DOUBLE) * y::DOUBLE >= (9.366574683933754::DOUBLE)
                                  THEN 763
                                  ELSE 722
                                END
                              END
                            END
                          END
                          ELSE CASE WHEN (0.5531130918990248::DOUBLE) * x::DOUBLE + (-0.8331061802494931::DOUBLE) * y::DOUBLE >= (1.5703321499677667::DOUBLE)
                            THEN CASE WHEN (0.5554091388189003::DOUBLE) * x::DOUBLE + (0.8315772294359963::DOUBLE) * y::DOUBLE >= (7.880718503351855::DOUBLE)
                              THEN CASE WHEN (0.8706797498315375::DOUBLE) * x::DOUBLE + (-0.49185035654484505::DOUBLE) * y::DOUBLE >= (6.048461808040339::DOUBLE)
                                THEN CASE WHEN (0.13932120900002345::DOUBLE) * x::DOUBLE + (-0.9902472422192207::DOUBLE) * y::DOUBLE >= (-2.5634973966901953::DOUBLE)
                                  THEN CASE WHEN (0.6240301869723999::DOUBLE) * x::DOUBLE + (0.7814002340332332::DOUBLE) * y::DOUBLE >= (8.76234768709454::DOUBLE)
                                    THEN 791
                                    ELSE 769
                                  END
                                  ELSE CASE WHEN (0.8973309021304215::DOUBLE) * x::DOUBLE + (-0.4413584168018138::DOUBLE) * y::DOUBLE >= (6.526797036680683::DOUBLE)
                                    THEN 791
                                    ELSE 764
                                  END
                                END
                                ELSE CASE WHEN (0.45404759841758396::DOUBLE) * x::DOUBLE + (0.8909774286541855::DOUBLE) * y::DOUBLE >= (7.599511400030266::DOUBLE)
                                  THEN 764
                                  ELSE 747
                                END
                              END
                              ELSE CASE WHEN (0.9500218042371266::DOUBLE) * x::DOUBLE + (0.31218355413768145::DOUBLE) * y::DOUBLE >= (9.580805772655301::DOUBLE)
                                THEN 769
                                ELSE 730
                              END
                            END
                            ELSE CASE WHEN (0.39269632351223105::DOUBLE) * x::DOUBLE + (-0.9196681996785456::DOUBLE) * y::DOUBLE >= (-0.5572516542803427::DOUBLE)
                              THEN CASE WHEN (0.4400785345091322::DOUBLE) * x::DOUBLE + (0.8979592883111652::DOUBLE) * y::DOUBLE >= (7.74827446440447::DOUBLE)
                                THEN CASE WHEN (0.47328214764875104::DOUBLE) * x::DOUBLE + (-0.8809108971496412::DOUBLE) * y::DOUBLE >= (0.4205808834254481::DOUBLE)
                                  THEN 764
                                  ELSE 742
                                END
                                ELSE CASE WHEN (0.9992656258232527::DOUBLE) * x::DOUBLE + (0.038317216079237854::DOUBLE) * y::DOUBLE >= (9.021427372730427::DOUBLE)
                                  THEN 764
                                  ELSE 727
                                END
                              END
                              ELSE CASE WHEN (0.1023672783402433::DOUBLE) * x::DOUBLE + (0.9947466714320843::DOUBLE) * y::DOUBLE >= (5.497959211701245::DOUBLE)
                                THEN CASE WHEN (0.6799989475207444::DOUBLE) * x::DOUBLE + (-0.7332130872881907::DOUBLE) * y::DOUBLE >= (2.4730224936923153::DOUBLE)
                                  THEN 742
                                  ELSE 722
                                END
                                ELSE CASE WHEN (0.9372946582621735::DOUBLE) * x::DOUBLE + (0.34853798013013637::DOUBLE) * y::DOUBLE >= (9.712765174178024::DOUBLE)
                                  THEN 742
                                  ELSE 717
                                END
                              END
                            END
                          END
                        END
                      END
                    END
                  END
                  ELSE CASE WHEN (0.9999104810796182::DOUBLE) * x::DOUBLE + (-0.013380202805878965::DOUBLE) * y::DOUBLE >= (9.417530007100424::DOUBLE)
                    THEN CASE WHEN (0.9168620239352218::DOUBLE) * x::DOUBLE + (0.39920424479883576::DOUBLE) * y::DOUBLE >= (12.22799052016088::DOUBLE)
                      THEN CASE WHEN (0.11818283049681313::DOUBLE) * x::DOUBLE + (-0.9929918522202293::DOUBLE) * y::DOUBLE >= (-5.61562920073586::DOUBLE)
                        THEN CASE WHEN (0.5919443679357571::DOUBLE) * x::DOUBLE + (0.8059788243304764::DOUBLE) * y::DOUBLE >= (12.002172848786351::DOUBLE)
                          THEN CASE WHEN (0.4481902941032152::DOUBLE) * x::DOUBLE + (-0.8939381747479371::DOUBLE) * y::DOUBLE >= (-0.9778118445647213::DOUBLE)
                            THEN CASE WHEN (0.7327998605266778::DOUBLE) * x::DOUBLE + (0.6804442404871114::DOUBLE) * y::DOUBLE >= (12.882860366135537::DOUBLE)
                              THEN CASE WHEN (0.367440153234468::DOUBLE) * x::DOUBLE + (0.9300471675087402::DOUBLE) * y::DOUBLE >= (10.706057608360705::DOUBLE)
                                THEN CASE WHEN (0.5596415494581761::DOUBLE) * x::DOUBLE + (-0.8287347803248346::DOUBLE) * y::DOUBLE >= (0.8470041732870186::DOUBLE)
                                  THEN 989
                                  ELSE 961
                                END
                                ELSE CASE WHEN (0.3607226630108706::DOUBLE) * x::DOUBLE + (-0.9326731262293054::DOUBLE) * y::DOUBLE >= (-1.9160807158813071::DOUBLE)
                                  THEN CASE WHEN (0.3691442109174659::DOUBLE) * x::DOUBLE + (0.9293721275926674::DOUBLE) * y::DOUBLE >= (10.448110114104837::DOUBLE)
                                    THEN 989
                                    ELSE 965
                                  END
                                  ELSE CASE WHEN (0.9994028203425172::DOUBLE) * x::DOUBLE + (0.034554344031137614::DOUBLE) * y::DOUBLE >= (11.940249570238587::DOUBLE)
                                    THEN 989
                                    ELSE 951
                                  END
                                END
                              END
                              ELSE CASE WHEN (0.9204934802433538::DOUBLE) * x::DOUBLE + (-0.3907579210066999::DOUBLE) * y::DOUBLE >= (8.069085174439344::DOUBLE)
                                THEN 965
                                ELSE 928
                              END
                            END
                            ELSE CASE WHEN (0.6166209919618336::DOUBLE) * x::DOUBLE + (0.7872601553946473::DOUBLE) * y::DOUBLE >= (12.440284905553012::DOUBLE)
                              THEN CASE WHEN (0.5011611235738839::DOUBLE) * x::DOUBLE + (-0.8653539901208998::DOUBLE) * y::DOUBLE >= (-0.29826267649468896::DOUBLE)
                                THEN CASE WHEN (0.367440153234468::DOUBLE) * x::DOUBLE + (0.9300471675087402::DOUBLE) * y::DOUBLE >= (10.706057608360705::DOUBLE)
                                  THEN 961
                                  ELSE 951
                                END
                                ELSE CASE WHEN (0.9779957790439824::DOUBLE) * x::DOUBLE + (-0.20862467776405005::DOUBLE) * y::DOUBLE >= (9.753149808045901::DOUBLE)
                                  THEN 961
                                  ELSE 933
                                END
                              END
                              ELSE CASE WHEN (0.7994807286179865::DOUBLE) * x::DOUBLE + (-0.6006917383887125::DOUBLE) * y::DOUBLE >= (4.625462099199132::DOUBLE)
                                THEN CASE WHEN (0.9634806403499269::DOUBLE) * x::DOUBLE + (-0.26777799698798066::DOUBLE) * y::DOUBLE >= (9.079605158733788::DOUBLE)
                                  THEN 951
                                  ELSE 914
                                END
                                ELSE 898
                              END
                            END
                          END
                          ELSE CASE WHEN (0.3972627549771288::DOUBLE) * x::DOUBLE + (-0.9177049109098097::DOUBLE) * y::DOUBLE >= (-1.462329176915297::DOUBLE)
                            THEN CASE WHEN (0.9024739353959083::DOUBLE) * x::DOUBLE + (0.4307444670927556::DOUBLE) * y::DOUBLE >= (12.509350012732185::DOUBLE)
                              THEN CASE WHEN (0.7756819998656403::DOUBLE) * x::DOUBLE + (-0.6311239458968743::DOUBLE) * y::DOUBLE >= (4.637543105186035::DOUBLE)
                                THEN CASE WHEN (0.1421994112242181::DOUBLE) * x::DOUBLE + (0.9898380309159098::DOUBLE) * y::DOUBLE >= (7.8407156474505255::DOUBLE)
                                  THEN CASE WHEN (0.9204934802433538::DOUBLE) * x::DOUBLE + (-0.3907579210066999::DOUBLE) * y::DOUBLE >= (8.069085174439344::DOUBLE)
                                    THEN 965
                                    ELSE 928
                                  END
                                  ELSE CASE WHEN (0.8913082550558427::DOUBLE) * x::DOUBLE + (0.45339783244884285::DOUBLE) * y::DOUBLE >= (13.03587947859888::DOUBLE)
                                    THEN 965
                                    ELSE 923
                                  END
                                END
                                ELSE CASE WHEN (0.9385094217795884::DOUBLE) * x::DOUBLE + (0.3452536245008047::DOUBLE) * y::DOUBLE >= (12.622600444464558::DOUBLE)
                                  THEN 928
                                  ELSE 893
                                END
                              END
                              ELSE CASE WHEN (0.45461025309957487::DOUBLE) * x::DOUBLE + (-0.8906904724856668::DOUBLE) * y::DOUBLE >= (-0.6266321865244704::DOUBLE)
                                THEN CASE WHEN (0.17790880062194095::DOUBLE) * x::DOUBLE + (0.9840469799055644::DOUBLE) * y::DOUBLE >= (7.956189549081847::DOUBLE)
                                  THEN 893
                                  ELSE 887
                                END
                                ELSE CASE WHEN (0.996303799910029::DOUBLE) * x::DOUBLE + (-0.08589958256497496::DOUBLE) * y::DOUBLE >= (10.111395228856981::DOUBLE)
                                  THEN 893
                                  ELSE 870
                                END
                              END
                            END
                            ELSE CASE WHEN (0.06422688551312176::DOUBLE) * x::DOUBLE + (-0.9979353221413121::DOUBLE) * y::DOUBLE >= (-5.953035631434223::DOUBLE)
                              THEN CASE WHEN (0.996303799910029::DOUBLE) * x::DOUBLE + (-0.08589958256497496::DOUBLE) * y::DOUBLE >= (10.111395228856981::DOUBLE)
                                THEN CASE WHEN (0.24260747254748777::DOUBLE) * x::DOUBLE + (0.9701245354407443::DOUBLE) * y::DOUBLE >= (8.986963405375107::DOUBLE)
                                  THEN CASE WHEN (0.877555469073605::DOUBLE) * x::DOUBLE + (-0.4794751283424458::DOUBLE) * y::DOUBLE >= (6.589362285062468::DOUBLE)
                                    THEN 928
                                    ELSE 903
                                  END
                                  ELSE CASE WHEN (0.9385094217795884::DOUBLE) * x::DOUBLE + (0.3452536245008047::DOUBLE) * y::DOUBLE >= (12.622600444464558::DOUBLE)
                                    THEN 928
                                    ELSE 893
                                  END
                                END
                                ELSE CASE WHEN (0.8255514747275169::DOUBLE) * x::DOUBLE + (0.5643268224842961::DOUBLE) * y::DOUBLE >= (12.562442591578826::DOUBLE)
                                  THEN 903
                                  ELSE 870
                                END
                              END
                              ELSE CASE WHEN (0.877555469073605::DOUBLE) * x::DOUBLE + (-0.4794751283424458::DOUBLE) * y::DOUBLE >= (6.589362285062468::DOUBLE)
                                THEN 928
                                ELSE CASE WHEN (0.9532886749208851::DOUBLE) * x::DOUBLE + (0.30206075923162085::DOUBLE) * y::DOUBLE >= (12.307038922359284::DOUBLE)
                                  THEN CASE WHEN (0.10610329304952676::DOUBLE) * x::DOUBLE + (-0.9943551132286927::DOUBLE) * y::DOUBLE >= (-5.658597236168952::DOUBLE)
                                    THEN 903
                                    ELSE 898
                                  END
                                  ELSE CASE WHEN (0.9288423962694106::DOUBLE) * x::DOUBLE + (-0.3704751042816496::DOUBLE) * y::DOUBLE >= (7.4461813570700155::DOUBLE)
                                    THEN 903
                                    ELSE 867
                                  END
                                END
                              END
                            END
                          END
                        END
                        ELSE CASE WHEN (0.9982987916582299::DOUBLE) * x::DOUBLE + (0.05830542490813551::DOUBLE) * y::DOUBLE >= (11.354476590997228::DOUBLE)
                          THEN CASE WHEN (0.9830154354227947::DOUBLE) * x::DOUBLE + (0.1835228969925373::DOUBLE) * y::DOUBLE >= (12.472234463148903::DOUBLE)
                            THEN CASE WHEN (0.38377127175297626::DOUBLE) * x::DOUBLE + (-0.9234281839846038::DOUBLE) * y::DOUBLE >= (-2.491655845437819::DOUBLE)
                              THEN CASE WHEN (0.11754774291606974::DOUBLE) * x::DOUBLE + (0.9930672324346109::DOUBLE) * y::DOUBLE >= (8.905378991669815::DOUBLE)
                                THEN 977
                                ELSE CASE WHEN (0.9779957790439824::DOUBLE) * x::DOUBLE + (-0.20862467776405005::DOUBLE) * y::DOUBLE >= (9.753149808045901::DOUBLE)
                                  THEN CASE WHEN (0.2801892955585645::DOUBLE) * x::DOUBLE + (0.9599447685436884::DOUBLE) * y::DOUBLE >= (10.22328099444866::DOUBLE)
                                    THEN 968
                                    ELSE 961
                                  END
                                  ELSE CASE WHEN (0.9024612264626202::DOUBLE) * x::DOUBLE + (0.43077109319403417::DOUBLE) * y::DOUBLE >= (13.540764928119529::DOUBLE)
                                    THEN 968
                                    ELSE 933
                                  END
                                END
                              END
                              ELSE CASE WHEN (0.719661194785705::DOUBLE) * x::DOUBLE + (0.6943254026172538::DOUBLE) * y::DOUBLE >= (13.441439792480331::DOUBLE)
                                THEN CASE WHEN (0.6585673258545852::DOUBLE) * x::DOUBLE + (-0.7525218118544742::DOUBLE) * y::DOUBLE >= (1.9110224613107745::DOUBLE)
                                  THEN CASE WHEN (0.11754774291606974::DOUBLE) * x::DOUBLE + (0.9930672324346109::DOUBLE) * y::DOUBLE >= (8.905378991669815::DOUBLE)
                                    THEN 977
                                    ELSE 968
                                  END
                                  ELSE CASE WHEN (0.9979463421467102::DOUBLE) * x::DOUBLE + (-0.06405543065190669::DOUBLE) * y::DOUBLE >= (11.07175563009051::DOUBLE)
                                    THEN 977
                                    ELSE 938
                                  END
                                END
                                ELSE CASE WHEN (0.9540150312481869::DOUBLE) * x::DOUBLE + (-0.2997587699342939::DOUBLE) * y::DOUBLE >= (8.684698623097784::DOUBLE)
                                  THEN 968
                                  ELSE 917
                                END
                              END
                            END
                            ELSE CASE WHEN (0.2648756191866037::DOUBLE) * x::DOUBLE + (-0.9642825863617539::DOUBLE) * y::DOUBLE >= (-4.212503800159702::DOUBLE)
                              THEN CASE WHEN (0.13797605082393888::DOUBLE) * x::DOUBLE + (-0.9904355654958227::DOUBLE) * y::DOUBLE >= (-5.543288614957326::DOUBLE)
                                THEN CASE WHEN (0.7994807286179865::DOUBLE) * x::DOUBLE + (-0.6006917383887125::DOUBLE) * y::DOUBLE >= (4.625462099199132::DOUBLE)
                                  THEN CASE WHEN (0.6166209919618336::DOUBLE) * x::DOUBLE + (0.7872601553946473::DOUBLE) * y::DOUBLE >= (12.440284905553012::DOUBLE)
                                    THEN 933
                                    ELSE 914
                                  END
                                  ELSE CASE WHEN (0.9378685681920126::DOUBLE) * x::DOUBLE + (0.3469907041945997::DOUBLE) * y::DOUBLE >= (12.887690564217277::DOUBLE)
                                    THEN 933
                                    ELSE 898
                                  END
                                END
                                ELSE CASE WHEN (0.5778060125127875::DOUBLE) * x::DOUBLE + (0.8161741308716371::DOUBLE) * y::DOUBLE >= (12.399601945933032::DOUBLE)
                                  THEN CASE WHEN (0.38377127175297626::DOUBLE) * x::DOUBLE + (-0.9234281839846038::DOUBLE) * y::DOUBLE >= (-2.491655845437819::DOUBLE)
                                    THEN 933
                                    ELSE 917
                                  END
                                  ELSE CASE WHEN (0.9926435453842438::DOUBLE) * x::DOUBLE + (-0.1210734975417771::DOUBLE) * y::DOUBLE >= (10.152256601209407::DOUBLE)
                                    THEN 933
                                    ELSE 896
                                  END
                                END
                              END
                              ELSE CASE WHEN (0.9954474530889585::DOUBLE) * x::DOUBLE + (-0.09531195170966693::DOUBLE) * y::DOUBLE >= (10.278500397092536::DOUBLE)
                                THEN CASE WHEN (0.719661194785705::DOUBLE) * x::DOUBLE + (0.6943254026172538::DOUBLE) * y::DOUBLE >= (13.441439792480331::DOUBLE)
                                  THEN 938
                                  ELSE 917
                                END
                                ELSE CASE WHEN (0.1491295510821736::DOUBLE) * x::DOUBLE + (-0.9888176662024346::DOUBLE) * y::DOUBLE >= (-5.977648292700727::DOUBLE)
                                  THEN CASE WHEN (0.9718602836794594::DOUBLE) * x::DOUBLE + (0.23555803744827009::DOUBLE) * y::DOUBLE >= (12.446942680270793::DOUBLE)
                                    THEN 917
                                    ELSE 891
                                  END
                                  ELSE CASE WHEN (0.794297189779313::DOUBLE) * x::DOUBLE + (-0.6075294020116936::DOUBLE) * y::DOUBLE >= (4.016052038700555::DOUBLE)
                                    THEN 917
                                    ELSE 886
                                  END
                                END
                              END
                            END
                          END
                          ELSE CASE WHEN (0.7656880328872652::DOUBLE) * x::DOUBLE + (-0.6432121238699022::DOUBLE) * y::DOUBLE >= (3.069159909700014::DOUBLE)
                            THEN CASE WHEN (0.6679125668954249::DOUBLE) * x::DOUBLE + (-0.7442397483225177::DOUBLE) * y::DOUBLE >= (1.6186268672419208::DOUBLE)
                              THEN CASE WHEN (0.1946801750782682::DOUBLE) * x::DOUBLE + (0.980866774557837::DOUBLE) * y::DOUBLE >= (8.958741944297067::DOUBLE)
                                THEN CASE WHEN (0.2648756191866037::DOUBLE) * x::DOUBLE + (-0.9642825863617539::DOUBLE) * y::DOUBLE >= (-4.212503800159702::DOUBLE)
                                  THEN CASE WHEN (0.9997510747157857::DOUBLE) * x::DOUBLE + (0.02231117667518527::DOUBLE) * y::DOUBLE >= (10.884414675557215::DOUBLE)
                                    THEN CASE WHEN (0.13797605082393888::DOUBLE) * x::DOUBLE + (-0.9904355654958227::DOUBLE) * y::DOUBLE >= (-5.543288614957326::DOUBLE)
                                      THEN 898
                                      ELSE 896
                                    END
                                    ELSE CASE WHEN (0.8899121196871292::DOUBLE) * x::DOUBLE + (-0.45613201952281374::DOUBLE) * y::DOUBLE >= (6.313115473900865::DOUBLE)
                                      THEN 898
                                      ELSE 875
                                    END
                                  END
                                  ELSE CASE WHEN (0.6837761428356309::DOUBLE) * x::DOUBLE + (0.7296918435126069::DOUBLE) * y::DOUBLE >= (12.669890464256888::DOUBLE)
                                    THEN 891
                                    ELSE 875
                                  END
                                END
                                ELSE CASE WHEN (0.9532886749208851::DOUBLE) * x::DOUBLE + (0.30206075923162085::DOUBLE) * y::DOUBLE >= (12.307038922359284::DOUBLE)
                                  THEN 898
                                  ELSE 867
                                END
                              END
                              ELSE CASE WHEN (0.6837761428356309::DOUBLE) * x::DOUBLE + (0.7296918435126069::DOUBLE) * y::DOUBLE >= (12.669890464256888::DOUBLE)
                                THEN CASE WHEN (0.6139944553037124::DOUBLE) * x::DOUBLE + (0.7893103374822209::DOUBLE) * y::DOUBLE >= (12.607524862657897::DOUBLE)
                                  THEN CASE WHEN (0.1491295510821736::DOUBLE) * x::DOUBLE + (-0.9888176662024346::DOUBLE) * y::DOUBLE >= (-5.977648292700727::DOUBLE)
                                    THEN 891
                                    ELSE 886
                                  END
                                  ELSE CASE WHEN (0.9882262516870397::DOUBLE) * x::DOUBLE + (-0.15299959306018868::DOUBLE) * y::DOUBLE >= (9.392288744357746::DOUBLE)
                                    THEN 891
                                    ELSE 869
                                  END
                                END
                                ELSE CASE WHEN (0.828885122704716::DOUBLE) * x::DOUBLE + (0.5594188532385977::DOUBLE) * y::DOUBLE >= (12.702119002725777::DOUBLE)
                                  THEN CASE WHEN (0.12920781111996446::DOUBLE) * x::DOUBLE + (-0.9916175379376806::DOUBLE) * y::DOUBLE >= (-5.948015971596613::DOUBLE)
                                    THEN 875
                                    ELSE 869
                                  END
                                  ELSE CASE WHEN (0.9850863762363113::DOUBLE) * x::DOUBLE + (-0.17206054560419312::DOUBLE) * y::DOUBLE >= (8.945583314365422::DOUBLE)
                                    THEN 875
                                    ELSE 843
                                  END
                                END
                              END
                            END
                            ELSE CASE WHEN (0.9375661618878505::DOUBLE) * x::DOUBLE + (-0.3478069753223543::DOUBLE) * y::DOUBLE >= (6.8507635363123764::DOUBLE)
                              THEN CASE WHEN (0.37400632214063934::DOUBLE) * x::DOUBLE + (0.927426153932933::DOUBLE) * y::DOUBLE >= (10.773392986424295::DOUBLE)
                                THEN CASE WHEN (0.950251187097459::DOUBLE) * x::DOUBLE + (0.31148464074472426::DOUBLE) * y::DOUBLE >= (12.436583706484093::DOUBLE)
                                  THEN 886
                                  ELSE 856
                                END
                                ELSE 843
                              END
                              ELSE CASE WHEN (0.9983148502389368::DOUBLE) * x::DOUBLE + (0.05802981813179525::DOUBLE) * y::DOUBLE >= (10.327491466110187::DOUBLE)
                                THEN CASE WHEN (0.14560847263479262::DOUBLE) * x::DOUBLE + (-0.9893422929891165::DOUBLE) * y::DOUBLE >= (-5.989821404254803::DOUBLE)
                                  THEN 843
                                  ELSE 837
                                END
                                ELSE 813
                              END
                            END
                          END
                        END
                      END
                      ELSE CASE WHEN (0.5554628642601916::DOUBLE) * x::DOUBLE + (-0.8315413437874654::DOUBLE) * y::DOUBLE >= (0.12107901964382162::DOUBLE)
                        THEN CASE WHEN (0.5409869841087661::DOUBLE) * x::DOUBLE + (0.8410309643674849::DOUBLE) * y::DOUBLE >= (10.450264990496166::DOUBLE)
                          THEN CASE WHEN (0.29983889396712304::DOUBLE) * x::DOUBLE + (0.9539898519714832::DOUBLE) * y::DOUBLE >= (9.12857608285969::DOUBLE)
                            THEN CASE WHEN (0.7328105266901104::DOUBLE) * x::DOUBLE + (0.6804327534533908::DOUBLE) * y::DOUBLE >= (12.14651204152175::DOUBLE)
                              THEN CASE WHEN (0.06422688551312176::DOUBLE) * x::DOUBLE + (-0.9979353221413121::DOUBLE) * y::DOUBLE >= (-5.953035631434223::DOUBLE)
                                THEN 870
                                ELSE 867
                              END
                              ELSE CASE WHEN (0.9002670534050814::DOUBLE) * x::DOUBLE + (-0.4353380669701793::DOUBLE) * y::DOUBLE >= (6.486594771616808::DOUBLE)
                                THEN 870
                                ELSE 847
                              END
                            END
                            ELSE CASE WHEN (0.5300565156239774::DOUBLE) * x::DOUBLE + (-0.8479623165238936::DOUBLE) * y::DOUBLE >= (0.3221356223518672::DOUBLE)
                              THEN CASE WHEN (0.2968699687500025::DOUBLE) * x::DOUBLE + (0.954917913568686::DOUBLE) * y::DOUBLE >= (8.903208558260989::DOUBLE)
                                THEN CASE WHEN (0.45461025309957487::DOUBLE) * x::DOUBLE + (-0.8906904724856668::DOUBLE) * y::DOUBLE >= (-0.6266321865244704::DOUBLE)
                                  THEN 887
                                  ELSE 870
                                END
                                ELSE CASE WHEN (0.9684428604758493::DOUBLE) * x::DOUBLE + (0.2492356836276756::DOUBLE) * y::DOUBLE >= (11.675009471096384::DOUBLE)
                                  THEN 887
                                  ELSE 858
                                END
                              END
                              ELSE CASE WHEN (0.994104412174277::DOUBLE) * x::DOUBLE + (0.10842701552489227::DOUBLE) * y::DOUBLE >= (10.365858729037154::DOUBLE)
                                THEN CASE WHEN (0.9286849137183218::DOUBLE) * x::DOUBLE + (0.37086969548885135::DOUBLE) * y::DOUBLE >= (11.890306746538435::DOUBLE)
                                  THEN 870
                                  ELSE 836
                                END
                                ELSE 794
                              END
                            END
                          END
                          ELSE CASE WHEN (0.9385893322955601::DOUBLE) * x::DOUBLE + (-0.34503632461086553::DOUBLE) * y::DOUBLE >= (7.075972346227417::DOUBLE)
                            THEN CASE WHEN (0.6975680977800839::DOUBLE) * x::DOUBLE + (0.7165184917079779::DOUBLE) * y::DOUBLE >= (10.481934708279265::DOUBLE)
                              THEN CASE WHEN (0.9825106260722695::DOUBLE) * x::DOUBLE + (-0.1862065242011593::DOUBLE) * y::DOUBLE >= (8.815232921630216::DOUBLE)
                                THEN CASE WHEN (0.48501461581651517::DOUBLE) * x::DOUBLE + (0.8745060448300849::DOUBLE) * y::DOUBLE >= (9.796159382384758::DOUBLE)
                                  THEN 858
                                  ELSE 839
                                END
                                ELSE CASE WHEN (0.12302458373729862::DOUBLE) * x::DOUBLE + (0.9924036234296327::DOUBLE) * y::DOUBLE >= (6.809597215180007::DOUBLE)
                                  THEN CASE WHEN (0.4326796271877949::DOUBLE) * x::DOUBLE + (-0.9015477470531612::DOUBLE) * y::DOUBLE >= (-0.7349900503610804::DOUBLE)
                                    THEN 839
                                    ELSE 822
                                  END
                                  ELSE CASE WHEN (0.9400624496933292::DOUBLE) * x::DOUBLE + (-0.341002332362371::DOUBLE) * y::DOUBLE >= (7.495700868514873::DOUBLE)
                                    THEN 839
                                    ELSE 820
                                  END
                                END
                              END
                              ELSE 793
                            END
                            ELSE CASE WHEN (0.1918689566066317::DOUBLE) * x::DOUBLE + (-0.9814205538354506::DOUBLE) * y::DOUBLE >= (-3.4433393684639713::DOUBLE)
                              THEN 793
                              ELSE CASE WHEN (0.1753287303689651::DOUBLE) * x::DOUBLE + (0.9845099472870789::DOUBLE) * y::DOUBLE >= (7.424699010778069::DOUBLE)
                                THEN CASE WHEN (0.7843186333655544::DOUBLE) * x::DOUBLE + (-0.6203581879491793::DOUBLE) * y::DOUBLE >= (3.837263622821136::DOUBLE)
                                  THEN 822
                                  ELSE 794
                                END
                                ELSE CASE WHEN (0.8591346779114833::DOUBLE) * x::DOUBLE + (0.5117495532093133::DOUBLE) * y::DOUBLE >= (11.168347956129407::DOUBLE)
                                  THEN 822
                                  ELSE 783
                                END
                              END
                            END
                          END
                        END
                        ELSE CASE WHEN (0.9874248493082761::DOUBLE) * x::DOUBLE + (0.15808911084742133::DOUBLE) * y::DOUBLE >= (10.688810005489426::DOUBLE)
                          THEN CASE WHEN (0.5378306703565848::DOUBLE) * x::DOUBLE + (-0.8430528868486168::DOUBLE) * y::DOUBLE >= (-0.6884507632406072::DOUBLE)
                            THEN CASE WHEN (0.8104141185088803::DOUBLE) * x::DOUBLE + (0.5858574540973892::DOUBLE) * y::DOUBLE >= (11.988353502328854::DOUBLE)
                              THEN CASE WHEN (0.30534732098383643::DOUBLE) * x::DOUBLE + (0.9522410480377298::DOUBLE) * y::DOUBLE >= (9.83796183129391::DOUBLE)
                                THEN CASE WHEN (0.6679125668954249::DOUBLE) * x::DOUBLE + (-0.7442397483225177::DOUBLE) * y::DOUBLE >= (1.6186268672419208::DOUBLE)
                                  THEN 867
                                  ELSE 843
                                END
                                ELSE CASE WHEN (0.3813600152597559::DOUBLE) * x::DOUBLE + (-0.9244265999856769::DOUBLE) * y::DOUBLE >= (-2.3893292973779903::DOUBLE)
                                  THEN CASE WHEN (0.7328105266901104::DOUBLE) * x::DOUBLE + (0.6804327534533908::DOUBLE) * y::DOUBLE >= (12.14651204152175::DOUBLE)
                                    THEN 867
                                    ELSE 847
                                  END
                                  ELSE CASE WHEN (0.9969672481848597::DOUBLE) * x::DOUBLE + (-0.07782227217646764::DOUBLE) * y::DOUBLE >= (9.688036447122423::DOUBLE)
                                    THEN 867
                                    ELSE 835
                                  END
                                END
                              END
                              ELSE CASE WHEN (0.9617274142759249::DOUBLE) * x::DOUBLE + (-0.2740079937340216::DOUBLE) * y::DOUBLE >= (7.7408334497003946::DOUBLE)
                                THEN 847
                                ELSE 811
                              END
                            END
                            ELSE CASE WHEN (0.14560847263479262::DOUBLE) * x::DOUBLE + (-0.9893422929891165::DOUBLE) * y::DOUBLE >= (-5.989821404254803::DOUBLE)
                              THEN CASE WHEN (0.061280782555880424::DOUBLE) * x::DOUBLE + (0.9981205667099236::DOUBLE) * y::DOUBLE >= (7.599917701688576::DOUBLE)
                                THEN CASE WHEN (0.9911240647372307::DOUBLE) * x::DOUBLE + (-0.1329401681161485::DOUBLE) * y::DOUBLE >= (8.88705940694981::DOUBLE)
                                  THEN 843
                                  ELSE 818
                                END
                                ELSE 811
                              END
                              ELSE CASE WHEN (0.0716976176551811::DOUBLE) * x::DOUBLE + (-0.9974264141391943::DOUBLE) * y::DOUBLE >= (-6.838222154188807::DOUBLE)
                                THEN CASE WHEN (0.5401478042374063::DOUBLE) * x::DOUBLE + (0.8415701691347601::DOUBLE) * y::DOUBLE >= (11.719064911681318::DOUBLE)
                                  THEN 837
                                  ELSE 818
                                END
                                ELSE CASE WHEN (0.9983148502389368::DOUBLE) * x::DOUBLE + (0.05802981813179525::DOUBLE) * y::DOUBLE >= (10.327491466110187::DOUBLE)
                                  THEN 837
                                  ELSE 813
                                END
                              END
                            END
                          END
                          ELSE CASE WHEN (0.061280782555880424::DOUBLE) * x::DOUBLE + (0.9981205667099236::DOUBLE) * y::DOUBLE >= (7.599917701688576::DOUBLE)
                            THEN CASE WHEN (0.11909516219531666::DOUBLE) * x::DOUBLE + (-0.9928828442176203::DOUBLE) * y::DOUBLE >= (-6.30413282876083::DOUBLE)
                              THEN CASE WHEN (0.9545840883564102::DOUBLE) * x::DOUBLE + (0.2979416356549739::DOUBLE) * y::DOUBLE >= (11.335207327694413::DOUBLE)
                                THEN 818
                                ELSE 792
                              END
                              ELSE CASE WHEN (0.9859537444079124::DOUBLE) * x::DOUBLE + (0.1670186034189514::DOUBLE) * y::DOUBLE >= (10.71659915211506::DOUBLE)
                                THEN CASE WHEN (0.0716976176551811::DOUBLE) * x::DOUBLE + (-0.9974264141391943::DOUBLE) * y::DOUBLE >= (-6.838222154188807::DOUBLE)
                                  THEN 818
                                  ELSE 813
                                END
                                ELSE CASE WHEN (0.6859599373254199::DOUBLE) * x::DOUBLE + (-0.727639309262842::DOUBLE) * y::DOUBLE >= (1.0888618455668002::DOUBLE)
                                  THEN 818
                                  ELSE 787
                                END
                              END
                            END
                            ELSE CASE WHEN (0.2638905061816237::DOUBLE) * x::DOUBLE + (0.964552642807642::DOUBLE) * y::DOUBLE >= (8.902605698423331::DOUBLE)
                              THEN CASE WHEN (0.03983659390229648::DOUBLE) * x::DOUBLE + (0.9992062078401353::DOUBLE) * y::DOUBLE >= (7.399632453298382::DOUBLE)
                                THEN CASE WHEN (0.456871288932537::DOUBLE) * x::DOUBLE + (-0.8895328129693262::DOUBLE) * y::DOUBLE >= (-1.8201214123370857::DOUBLE)
                                  THEN 811
                                  ELSE 792
                                END
                                ELSE CASE WHEN (0.9201970002131651::DOUBLE) * x::DOUBLE + (-0.3914555923712066::DOUBLE) * y::DOUBLE >= (6.162533830015222::DOUBLE)
                                  THEN 811
                                  ELSE 788
                                END
                              END
                              ELSE CASE WHEN (0.3205828106076745::DOUBLE) * x::DOUBLE + (-0.9472204925691188::DOUBLE) * y::DOUBLE >= (-2.9756913866056998::DOUBLE)
                                THEN CASE WHEN (0.42263866495018076::DOUBLE) * x::DOUBLE + (0.9062982725842132::DOUBLE) * y::DOUBLE >= (9.874978935683755::DOUBLE)
                                  THEN 811
                                  ELSE 794
                                END
                                ELSE CASE WHEN (0.8818778042230278::DOUBLE) * x::DOUBLE + (0.47147803598764954::DOUBLE) * y::DOUBLE >= (11.515994491121662::DOUBLE)
                                  THEN 811
                                  ELSE 779
                                END
                              END
                            END
                          END
                        END
                      END
                    END
                    ELSE CASE WHEN (0.3021260518261008::DOUBLE) * x::DOUBLE + (-0.9532679837317376::DOUBLE) * y::DOUBLE >= (-3.944791182295679::DOUBLE)
                      THEN CASE WHEN (0.3205828106076745::DOUBLE) * x::DOUBLE + (-0.9472204925691188::DOUBLE) * y::DOUBLE >= (-2.9756913866056998::DOUBLE)
                        THEN CASE WHEN (0.23539578955153473::DOUBLE) * x::DOUBLE + (0.9718995947428981::DOUBLE) * y::DOUBLE >= (7.514820074264467::DOUBLE)
                          THEN CASE WHEN (0.9699448180901254::DOUBLE) * x::DOUBLE + (0.24332498815393688::DOUBLE) * y::DOUBLE >= (9.964428615987712::DOUBLE)
                            THEN CASE WHEN (0.1753287303689651::DOUBLE) * x::DOUBLE + (0.9845099472870789::DOUBLE) * y::DOUBLE >= (7.424699010778069::DOUBLE)
                              THEN CASE WHEN (0.19892225957902165::DOUBLE) * x::DOUBLE + (-0.9800152726585317::DOUBLE) * y::DOUBLE >= (-4.162450628316052::DOUBLE)
                                THEN CASE WHEN (0.8663222178215836::DOUBLE) * x::DOUBLE + (0.49948555025014746::DOUBLE) * y::DOUBLE >= (11.00797402991681::DOUBLE)
                                  THEN 794
                                  ELSE 757
                                END
                                ELSE CASE WHEN (0.9807428164622836::DOUBLE) * x::DOUBLE + (-0.19530368137244::DOUBLE) * y::DOUBLE >= (7.812641551712771::DOUBLE)
                                  THEN 794
                                  ELSE 751
                                END
                              END
                              ELSE CASE WHEN (0.6326814696641746::DOUBLE) * x::DOUBLE + (0.7744121370068913::DOUBLE) * y::DOUBLE >= (10.081316196685666::DOUBLE)
                                THEN CASE WHEN (0.7508856428123428::DOUBLE) * x::DOUBLE + (-0.6604322458952885::DOUBLE) * y::DOUBLE >= (3.1092975501340354::DOUBLE)
                                  THEN 783
                                  ELSE 757
                                END
                                ELSE CASE WHEN (0.9992910254209942::DOUBLE) * x::DOUBLE + (-0.03764899086373888::DOUBLE) * y::DOUBLE >= (8.854399632068382::DOUBLE)
                                  THEN 783
                                  ELSE 737
                                END
                              END
                            END
                            ELSE CASE WHEN (0.4080556170386191::DOUBLE) * x::DOUBLE + (0.9129570709530826::DOUBLE) * y::DOUBLE >= (8.837829373613001::DOUBLE)
                              THEN CASE WHEN (0.47280834895404056::DOUBLE) * x::DOUBLE + (-0.8811652882174572::DOUBLE) * y::DOUBLE >= (-1.0895542903720745::DOUBLE)
                                THEN CASE WHEN (0.6326814696641746::DOUBLE) * x::DOUBLE + (0.7744121370068913::DOUBLE) * y::DOUBLE >= (10.081316196685666::DOUBLE)
                                  THEN 757
                                  ELSE 737
                                END
                                ELSE CASE WHEN (0.900472628432814::DOUBLE) * x::DOUBLE + (-0.43491268714915565::DOUBLE) * y::DOUBLE >= (5.268861117769877::DOUBLE)
                                  THEN 757
                                  ELSE 714
                                END
                              END
                              ELSE CASE WHEN (0.9767780030572293::DOUBLE) * x::DOUBLE + (-0.21425389784909762::DOUBLE) * y::DOUBLE >= (7.13404984481422::DOUBLE)
                                THEN 737
                                ELSE 698
                              END
                            END
                          END
                          ELSE CASE WHEN (0.5214933412154924::DOUBLE) * x::DOUBLE + (-0.8532553516198429::DOUBLE) * y::DOUBLE >= (0.062185754153525785::DOUBLE)
                            THEN CASE WHEN (0.9047240685613044::DOUBLE) * x::DOUBLE + (0.4259980748382325::DOUBLE) * y::DOUBLE >= (10.522896339873778::DOUBLE)
                              THEN CASE WHEN (0.8286736359615196::DOUBLE) * x::DOUBLE + (0.5597320832883488::DOUBLE) * y::DOUBLE >= (10.579724450178528::DOUBLE)
                                THEN CASE WHEN (0.1918689566066317::DOUBLE) * x::DOUBLE + (-0.9814205538354506::DOUBLE) * y::DOUBLE >= (-3.4433393684639713::DOUBLE)
                                  THEN 793
                                  ELSE 783
                                END
                                ELSE CASE WHEN (0.9747125111833459::DOUBLE) * x::DOUBLE + (-0.22346257078682258::DOUBLE) * y::DOUBLE >= (7.766870927320652::DOUBLE)
                                  THEN 793
                                  ELSE 741
                                END
                              END
                              ELSE CASE WHEN (0.6098111307677377::DOUBLE) * x::DOUBLE + (0.7925467713591251::DOUBLE) * y::DOUBLE >= (9.322416330093027::DOUBLE)
                                THEN CASE WHEN (0.5794258736293643::DOUBLE) * x::DOUBLE + (-0.8150249425439985::DOUBLE) * y::DOUBLE >= (1.048216595798083::DOUBLE)
                                  THEN 763
                                  ELSE 741
                                END
                                ELSE CASE WHEN (0.9922018192455394::DOUBLE) * x::DOUBLE + (0.12464168598764289::DOUBLE) * y::DOUBLE >= (9.366574683933754::DOUBLE)
                                  THEN 763
                                  ELSE 722
                                END
                              END
                            END
                            ELSE CASE WHEN (0.9955515318226154::DOUBLE) * x::DOUBLE + (-0.09421861538806434::DOUBLE) * y::DOUBLE >= (8.047711027876776::DOUBLE)
                              THEN CASE WHEN (0.20376565310687023::DOUBLE) * x::DOUBLE + (-0.9790196926589019::DOUBLE) * y::DOUBLE >= (-3.5153005096285987::DOUBLE)
                                THEN CASE WHEN (0.8286736359615196::DOUBLE) * x::DOUBLE + (0.5597320832883488::DOUBLE) * y::DOUBLE >= (10.579724450178528::DOUBLE)
                                  THEN 783
                                  ELSE 741
                                END
                                ELSE CASE WHEN (0.9992910254209942::DOUBLE) * x::DOUBLE + (-0.03764899086373888::DOUBLE) * y::DOUBLE >= (8.854399632068382::DOUBLE)
                                  THEN 783
                                  ELSE 737
                                END
                              END
                              ELSE CASE WHEN (0.0007646775554785575::DOUBLE) * x::DOUBLE + (-0.9999997076340753::DOUBLE) * y::DOUBLE >= (-5.498469287312635::DOUBLE)
                                THEN CASE WHEN (0.8392434668371741::DOUBLE) * x::DOUBLE + (0.5437558306548272::DOUBLE) * y::DOUBLE >= (10.136299291241222::DOUBLE)
                                  THEN 737
                                  ELSE 699
                                END
                                ELSE CASE WHEN (0.9767780030572293::DOUBLE) * x::DOUBLE + (-0.21425389784909762::DOUBLE) * y::DOUBLE >= (7.13404984481422::DOUBLE)
                                  THEN 737
                                  ELSE 698
                                END
                              END
                            END
                          END
                        END
                        ELSE CASE WHEN (0.9822132382991192::DOUBLE) * x::DOUBLE + (0.18776888589422272::DOUBLE) * y::DOUBLE >= (9.824820162172042::DOUBLE)
                          THEN CASE WHEN (0.6867765586039951::DOUBLE) * x::DOUBLE + (0.7268685978579988::DOUBLE) * y::DOUBLE >= (11.144345772158461::DOUBLE)
                            THEN CASE WHEN (0.7519701500902708::DOUBLE) * x::DOUBLE + (-0.6591971581956461::DOUBLE) * y::DOUBLE >= (2.2427022561211::DOUBLE)
                              THEN CASE WHEN (0.332225039087871::DOUBLE) * x::DOUBLE + (-0.9432001502348601::DOUBLE) * y::DOUBLE >= (-3.242068296165808::DOUBLE)
                                THEN CASE WHEN (0.2638905061816237::DOUBLE) * x::DOUBLE + (0.964552642807642::DOUBLE) * y::DOUBLE >= (8.902605698423331::DOUBLE)
                                  THEN 788
                                  ELSE 779
                                END
                                ELSE CASE WHEN (0.9454121032649264::DOUBLE) * x::DOUBLE + (-0.325877208469982::DOUBLE) * y::DOUBLE >= (6.567988953906221::DOUBLE)
                                  THEN CASE WHEN (0.03983659390229648::DOUBLE) * x::DOUBLE + (0.9992062078401353::DOUBLE) * y::DOUBLE >= (7.399632453298382::DOUBLE)
                                    THEN 792
                                    ELSE 788
                                  END
                                  ELSE CASE WHEN (0.6024082643757893::DOUBLE) * x::DOUBLE + (0.7981881250756298::DOUBLE) * y::DOUBLE >= (11.257993011160572::DOUBLE)
                                    THEN 792
                                    ELSE 773
                                  END
                                END
                              END
                              ELSE 758
                            END
                            ELSE CASE WHEN (0.35469748262116263::DOUBLE) * x::DOUBLE + (-0.9349811205699343::DOUBLE) * y::DOUBLE >= (-3.030154768920778::DOUBLE)
                              THEN CASE WHEN (0.015617453834506653::DOUBLE) * x::DOUBLE + (-0.9998780401307586::DOUBLE) * y::DOUBLE >= (-6.29792260104703::DOUBLE)
                                THEN CASE WHEN (0.8480584362748781::DOUBLE) * x::DOUBLE + (0.5299027162253545::DOUBLE) * y::DOUBLE >= (11.129670202562497::DOUBLE)
                                  THEN 779
                                  ELSE 751
                                END
                                ELSE CASE WHEN (0.9540336726952048::DOUBLE) * x::DOUBLE + (-0.29969943504067353::DOUBLE) * y::DOUBLE >= (6.75064782575016::DOUBLE)
                                  THEN 779
                                  ELSE 750
                                END
                              END
                              ELSE CASE WHEN (0.6469210686598477::DOUBLE) * x::DOUBLE + (-0.7625569689695326::DOUBLE) * y::DOUBLE >= (0.5351133086887652::DOUBLE)
                                THEN CASE WHEN (0.17772705985102363::DOUBLE) * x::DOUBLE + (0.9840798200332688::DOUBLE) * y::DOUBLE >= (8.332241966054603::DOUBLE)
                                  THEN 758
                                  ELSE 750
                                END
                                ELSE CASE WHEN (0.9128812780450809::DOUBLE) * x::DOUBLE + (0.408225148900432::DOUBLE) * y::DOUBLE >= (10.93393243150642::DOUBLE)
                                  THEN 758
                                  ELSE 729
                                END
                              END
                            END
                          END
                          ELSE CASE WHEN (0.9983485914752338::DOUBLE) * x::DOUBLE + (0.057446408934038906::DOUBLE) * y::DOUBLE >= (8.664343431209655::DOUBLE)
                            THEN CASE WHEN (0.26829269080202406::DOUBLE) * x::DOUBLE + (-0.9633374445448539::DOUBLE) * y::DOUBLE >= (-3.982700228282275::DOUBLE)
                              THEN CASE WHEN (0.12708444877336683::DOUBLE) * x::DOUBLE + (0.9918919008036964::DOUBLE) * y::DOUBLE >= (7.377878412794415::DOUBLE)
                                THEN CASE WHEN (0.7889654740261014::DOUBLE) * x::DOUBLE + (-0.6144375320525017::DOUBLE) * y::DOUBLE >= (2.9668000021128256::DOUBLE)
                                  THEN 751
                                  ELSE 721
                                END
                                ELSE CASE WHEN (0.9699448180901254::DOUBLE) * x::DOUBLE + (0.24332498815393688::DOUBLE) * y::DOUBLE >= (9.964428615987712::DOUBLE)
                                  THEN 751
                                  ELSE 714
                                END
                              END
                              ELSE CASE WHEN (0.6822160843504574::DOUBLE) * x::DOUBLE + (-0.7311506098291444::DOUBLE) * y::DOUBLE >= (0.8658391664109271::DOUBLE)
                                THEN CASE WHEN (0.3482477656060128::DOUBLE) * x::DOUBLE + (0.9374025249328164::DOUBLE) * y::DOUBLE >= (9.31615035374391::DOUBLE)
                                  THEN 729
                                  ELSE 721
                                END
                                ELSE CASE WHEN (0.9610842830295685::DOUBLE) * x::DOUBLE + (0.2762553183443537::DOUBLE) * y::DOUBLE >= (10.06446435505326::DOUBLE)
                                  THEN 729
                                  ELSE 700
                                END
                              END
                            END
                            ELSE CASE WHEN (0.021265315108129942::DOUBLE) * x::DOUBLE + (-0.999773867618749::DOUBLE) * y::DOUBLE >= (-6.137825471878111::DOUBLE)
                              THEN CASE WHEN (0.5347976378951392::DOUBLE) * x::DOUBLE + (-0.8449801692949838::DOUBLE) * y::DOUBLE >= (-0.6113849486945755::DOUBLE)
                                THEN CASE WHEN (0.4080556170386191::DOUBLE) * x::DOUBLE + (0.9129570709530826::DOUBLE) * y::DOUBLE >= (8.837829373613001::DOUBLE)
                                  THEN 714
                                  ELSE 698
                                END
                                ELSE CASE WHEN (0.9953207293232245::DOUBLE) * x::DOUBLE + (0.09662632032466287::DOUBLE) * y::DOUBLE >= (8.832758843989808::DOUBLE)
                                  THEN 714
                                  ELSE 679
                                END
                              END
                              ELSE CASE WHEN (0.6674731268620651::DOUBLE) * x::DOUBLE + (0.744633886495221::DOUBLE) * y::DOUBLE >= (10.426570561237913::DOUBLE)
                                THEN 700
                                ELSE CASE WHEN (0.754439953335796::DOUBLE) * x::DOUBLE + (-0.656369070577432::DOUBLE) * y::DOUBLE >= (2.087674127738418::DOUBLE)
                                  THEN 714
                                  ELSE 677
                                END
                              END
                            END
                          END
                        END
                      END
                      ELSE CASE WHEN (0.9128812780450809::DOUBLE) * x::DOUBLE + (0.408225148900432::DOUBLE) * y::DOUBLE >= (10.93393243150642::DOUBLE)
                        THEN CASE WHEN (0.8166134071013706::DOUBLE) * x::DOUBLE + (-0.5771850165608002::DOUBLE) * y::DOUBLE >= (3.0549906425051017::DOUBLE)
                          THEN CASE WHEN (0.11909516219531666::DOUBLE) * x::DOUBLE + (-0.9928828442176203::DOUBLE) * y::DOUBLE >= (-6.30413282876083::DOUBLE)
                            THEN CASE WHEN (0.8418418409524423::DOUBLE) * x::DOUBLE + (-0.5397242951932056::DOUBLE) * y::DOUBLE >= (3.60965707784274::DOUBLE)
                              THEN CASE WHEN (0.32217173486542244::DOUBLE) * x::DOUBLE + (0.9466812416298339::DOUBLE) * y::DOUBLE >= (9.755348019945645::DOUBLE)
                                THEN CASE WHEN (0.9198541091619276::DOUBLE) * x::DOUBLE + (-0.3922606504072474::DOUBLE) * y::DOUBLE >= (5.673505804813706::DOUBLE)
                                  THEN 792
                                  ELSE 767
                                END
                                ELSE CASE WHEN (0.7519701500902708::DOUBLE) * x::DOUBLE + (-0.6591971581956461::DOUBLE) * y::DOUBLE >= (2.2427022561211::DOUBLE)
                                  THEN CASE WHEN (0.6024082643757893::DOUBLE) * x::DOUBLE + (0.7981881250756298::DOUBLE) * y::DOUBLE >= (11.257993011160572::DOUBLE)
                                    THEN 792
                                    ELSE 773
                                  END
                                  ELSE CASE WHEN (0.931899397545544::DOUBLE) * x::DOUBLE + (0.3627168494214907::DOUBLE) * y::DOUBLE >= (11.194649804164403::DOUBLE)
                                    THEN 792
                                    ELSE 758
                                  END
                                END
                              END
                              ELSE CASE WHEN (0.9477617879612366::DOUBLE) * x::DOUBLE + (0.31897898564093535::DOUBLE) * y::DOUBLE >= (10.792195086177884::DOUBLE)
                                THEN 767
                                ELSE 733
                              END
                            END
                            ELSE CASE WHEN (0.9859537444079124::DOUBLE) * x::DOUBLE + (0.1670186034189514::DOUBLE) * y::DOUBLE >= (10.71659915211506::DOUBLE)
                              THEN 813
                              ELSE CASE WHEN (0.024020411682733205::DOUBLE) * x::DOUBLE + (-0.999711468286021::DOUBLE) * y::DOUBLE >= (-7.391085124608909::DOUBLE)
                                THEN CASE WHEN (0.6070402259731769::DOUBLE) * x::DOUBLE + (0.7946711043258301::DOUBLE) * y::DOUBLE >= (11.615416084419564::DOUBLE)
                                  THEN 787
                                  ELSE 767
                                END
                                ELSE CASE WHEN (0.9100569108867297::DOUBLE) * x::DOUBLE + (-0.4144833156440716::DOUBLE) * y::DOUBLE >= (5.187505560419943::DOUBLE)
                                  THEN 787
                                  ELSE 765
                                END
                              END
                            END
                          END
                          ELSE CASE WHEN (0.9100569108867297::DOUBLE) * x::DOUBLE + (-0.4144833156440716::DOUBLE) * y::DOUBLE >= (5.187505560419943::DOUBLE)
                            THEN 787
                            ELSE CASE WHEN (0.581132968965409::DOUBLE) * x::DOUBLE + (-0.813808621471565::DOUBLE) * y::DOUBLE >= (-1.2592876067394165::DOUBLE)
                              THEN CASE WHEN (0.4908209013332279::DOUBLE) * x::DOUBLE + (0.8712604907916103::DOUBLE) * y::DOUBLE >= (10.763218913302069::DOUBLE)
                                THEN CASE WHEN (0.8640564748466776::DOUBLE) * x::DOUBLE + (0.5033948830446459::DOUBLE) * y::DOUBLE >= (11.361876845781694::DOUBLE)
                                  THEN CASE WHEN (0.1979609923953035::DOUBLE) * x::DOUBLE + (-0.9802098986900033::DOUBLE) * y::DOUBLE >= (-5.733259365287809::DOUBLE)
                                    THEN CASE WHEN (0.5478601872300982::DOUBLE) * x::DOUBLE + (0.8365699105563154::DOUBLE) * y::DOUBLE >= (11.36560160128857::DOUBLE)
                                      THEN 765
                                      ELSE 748
                                    END
                                    ELSE CASE WHEN (0.9327035862835015::DOUBLE) * x::DOUBLE + (0.3606438965709731::DOUBLE) * y::DOUBLE >= (11.188976485293871::DOUBLE)
                                      THEN 765
                                      ELSE 740
                                    END
                                  END
                                  ELSE CASE WHEN (0.9962770570339381::DOUBLE) * x::DOUBLE + (-0.08620919688638388::DOUBLE) * y::DOUBLE >= (8.027855384460103::DOUBLE)
                                    THEN 748
                                    ELSE 718
                                  END
                                END
                                ELSE CASE WHEN (0.5526926400412396::DOUBLE) * x::DOUBLE + (-0.8333851724408378::DOUBLE) * y::DOUBLE >= (-1.3997240905198947::DOUBLE)
                                  THEN 733
                                  ELSE 718
                                END
                              END
                              ELSE CASE WHEN (0.9889843215500085::DOUBLE) * x::DOUBLE + (-0.14802030849944::DOUBLE) * y::DOUBLE >= (7.660248446047715::DOUBLE)
                                THEN 765
                                ELSE CASE WHEN (0.12997741805811008::DOUBLE) * x::DOUBLE + (-0.9915169543658581::DOUBLE) * y::DOUBLE >= (-6.538115214734293::DOUBLE)
                                  THEN CASE WHEN (0.5343347632561287::DOUBLE) * x::DOUBLE + (0.8452729504580261::DOUBLE) * y::DOUBLE >= (11.150587147344432::DOUBLE)
                                    THEN 735
                                    ELSE 718
                                  END
                                  ELSE CASE WHEN (0.9814550126968152::DOUBLE) * x::DOUBLE + (0.19169261345261612::DOUBLE) * y::DOUBLE >= (9.965274202390276::DOUBLE)
                                    THEN 735
                                    ELSE 712
                                  END
                                END
                              END
                            END
                          END
                        END
                        ELSE CASE WHEN (0.478779451549665::DOUBLE) * x::DOUBLE + (-0.877935212173314::DOUBLE) * y::DOUBLE >= (-2.544682713359552::DOUBLE)
                          THEN CASE WHEN (0.9980486999233464::DOUBLE) * x::DOUBLE + (-0.06244031214942733::DOUBLE) * y::DOUBLE >= (7.879070329365843::DOUBLE)
                            THEN CASE WHEN (0.14895768906919368::DOUBLE) * x::DOUBLE + (0.9888435704736951::DOUBLE) * y::DOUBLE >= (8.300282316753036::DOUBLE)
                              THEN CASE WHEN (0.1807084285011775::DOUBLE) * x::DOUBLE + (0.9835367120085732::DOUBLE) * y::DOUBLE >= (8.800059537530387::DOUBLE)
                                THEN CASE WHEN (0.5526926400412396::DOUBLE) * x::DOUBLE + (-0.8333851724408378::DOUBLE) * y::DOUBLE >= (-1.3997240905198947::DOUBLE)
                                  THEN 733
                                  ELSE 718
                                END
                                ELSE CASE WHEN (0.9932009721448816::DOUBLE) * x::DOUBLE + (0.11641232293216185::DOUBLE) * y::DOUBLE >= (9.381105163623577::DOUBLE)
                                  THEN 733
                                  ELSE 710
                                END
                              END
                              ELSE CASE WHEN (0.35057213105482127::DOUBLE) * x::DOUBLE + (0.9365357339299346::DOUBLE) * y::DOUBLE >= (9.506206193063154::DOUBLE)
                                THEN CASE WHEN (0.6117924260715575::DOUBLE) * x::DOUBLE + (-0.7910183483342709::DOUBLE) * y::DOUBLE >= (-0.3436685636396728::DOUBLE)
                                  THEN 729
                                  ELSE 710
                                END
                                ELSE CASE WHEN (0.9610842830295685::DOUBLE) * x::DOUBLE + (0.2762553183443537::DOUBLE) * y::DOUBLE >= (10.06446435505326::DOUBLE)
                                  THEN 729
                                  ELSE 700
                                END
                              END
                            END
                            ELSE CASE WHEN (0.7644962810709417::DOUBLE) * x::DOUBLE + (0.6446281379436518::DOUBLE) * y::DOUBLE >= (10.79786924478578::DOUBLE)
                              THEN CASE WHEN (0.18648006488585664::DOUBLE) * x::DOUBLE + (-0.9824587448845711::DOUBLE) * y::DOUBLE >= (-5.353104657218308::DOUBLE)
                                THEN 700
                                ELSE CASE WHEN (0.6575084156690705::DOUBLE) * x::DOUBLE + (0.7534472000905896::DOUBLE) * y::DOUBLE >= (11.079881943686988::DOUBLE)
                                  THEN 718
                                  ELSE 693
                                END
                              END
                              ELSE CASE WHEN (0.8217888417233993::DOUBLE) * x::DOUBLE + (-0.5697921547537435::DOUBLE) * y::DOUBLE >= (2.7579104582636695::DOUBLE)
                                THEN CASE WHEN (0.6674731268620651::DOUBLE) * x::DOUBLE + (0.744633886495221::DOUBLE) * y::DOUBLE >= (10.426570561237913::DOUBLE)
                                  THEN 700
                                  ELSE 677
                                END
                                ELSE 671
                              END
                            END
                          END
                          ELSE CASE WHEN (0.9942883804805962::DOUBLE) * x::DOUBLE + (0.10672683093427378::DOUBLE) * y::DOUBLE >= (8.804109417409293::DOUBLE)
                            THEN CASE WHEN (0.2726199209277626::DOUBLE) * x::DOUBLE + (0.9621218107460929::DOUBLE) * y::DOUBLE >= (9.579724314723016::DOUBLE)
                              THEN CASE WHEN (0.9935685070668087::DOUBLE) * x::DOUBLE + (0.11323260027497814::DOUBLE) * y::DOUBLE >= (9.174444092426691::DOUBLE)
                                THEN CASE WHEN (0.12997741805811008::DOUBLE) * x::DOUBLE + (-0.9915169543658581::DOUBLE) * y::DOUBLE >= (-6.538115214734293::DOUBLE)
                                  THEN 718
                                  ELSE 712
                                END
                                ELSE CASE WHEN (0.7851076982138168::DOUBLE) * x::DOUBLE + (-0.6193592674735743::DOUBLE) * y::DOUBLE >= (1.7988768812963043::DOUBLE)
                                  THEN 718
                                  ELSE 690
                                END
                              END
                              ELSE CASE WHEN (0.980025437883098::DOUBLE) * x::DOUBLE + (0.1988721727694494::DOUBLE) * y::DOUBLE >= (9.639659654159756::DOUBLE)
                                THEN 718
                                ELSE 683
                              END
                            END
                            ELSE CASE WHEN (0.6378291409712199::DOUBLE) * x::DOUBLE + (-0.7701778930402481::DOUBLE) * y::DOUBLE >= (-0.7942617377553534::DOUBLE)
                              THEN CASE WHEN (0.21605865852864242::DOUBLE) * x::DOUBLE + (0.9763803849293591::DOUBLE) * y::DOUBLE >= (8.818951342973278::DOUBLE)
                                THEN 683
                                ELSE 671
                              END
                              ELSE 660
                            END
                          END
                        END
                      END
                    END
                  END
                END
              END
              ELSE CASE WHEN (0.04693171287410607::DOUBLE) * x::DOUBLE + (-0.9988981000716252::DOUBLE) * y::DOUBLE >= (-2.7469174242685455::DOUBLE)
                THEN CASE WHEN (0.9973050777793526::DOUBLE) * x::DOUBLE + (0.07336608096061494::DOUBLE) * y::DOUBLE >= (7.887940964970185::DOUBLE)
                  THEN CASE WHEN (0.31293109524099894::DOUBLE) * x::DOUBLE + (-0.9497758312524429::DOUBLE) * y::DOUBLE >= (0.3697818725957993::DOUBLE)
                    THEN CASE WHEN (0.31037373303175364::DOUBLE) * x::DOUBLE + (-0.9506146147855785::DOUBLE) * y::DOUBLE >= (0.9621297815761094::DOUBLE)
                      THEN CASE WHEN (0.9049530559378043::DOUBLE) * x::DOUBLE + (-0.4255114176480216::DOUBLE) * y::DOUBLE >= (7.433968609084896::DOUBLE)
                        THEN CASE WHEN (0.16437988988725138::DOUBLE) * x::DOUBLE + (0.9863971065451558::DOUBLE) * y::DOUBLE >= (2.3830865231109293::DOUBLE)
                          THEN CASE WHEN (0.028117653650927082::DOUBLE) * x::DOUBLE + (-0.9996046206141538::DOUBLE) * y::DOUBLE >= (-0.8355977334496512::DOUBLE)
                            THEN CASE WHEN (0.8137080631223049::DOUBLE) * x::DOUBLE + (0.5812737633935897::DOUBLE) * y::DOUBLE >= (8.131400812509614::DOUBLE)
                              THEN CASE WHEN (0.18949626141592008::DOUBLE) * x::DOUBLE + (-0.9818814423897567::DOUBLE) * y::DOUBLE >= (0.9033554548623529::DOUBLE)
                                THEN CASE WHEN (0.3993487197717943::DOUBLE) * x::DOUBLE + (0.9167991055932749::DOUBLE) * y::DOUBLE >= (4.556478243348449::DOUBLE)
                                  THEN 815
                                  ELSE 804
                                END
                                ELSE CASE WHEN (0.6239729313532758::DOUBLE) * x::DOUBLE + (-0.7814459552255677::DOUBLE) * y::DOUBLE >= (5.152592313545107::DOUBLE)
                                  THEN 815
                                  ELSE 796
                                END
                              END
                              ELSE CASE WHEN (0.9048023561458288::DOUBLE) * x::DOUBLE + (-0.4258317699666815::DOUBLE) * y::DOUBLE >= (8.09137127553043::DOUBLE)
                                THEN 804
                                ELSE 755
                              END
                            END
                            ELSE CASE WHEN (0.009538019552727036::DOUBLE) * x::DOUBLE + (0.9999545120569293::DOUBLE) * y::DOUBLE >= (1.6052306652522834::DOUBLE)
                              THEN CASE WHEN (0.7048301790251276::DOUBLE) * x::DOUBLE + (0.7093760770814072::DOUBLE) * y::DOUBLE >= (7.7110484484529795::DOUBLE)
                                THEN CASE WHEN (0.31313192746463536::DOUBLE) * x::DOUBLE + (-0.9497096377326505::DOUBLE) * y::DOUBLE >= (1.181986009487652::DOUBLE)
                                  THEN 777
                                  ELSE 771
                                END
                                ELSE CASE WHEN (0.935689332713387::DOUBLE) * x::DOUBLE + (-0.35282498869322826::DOUBLE) * y::DOUBLE >= (7.940281901295122::DOUBLE)
                                  THEN 777
                                  ELSE 754
                                END
                              END
                              ELSE CASE WHEN (0.6729083851599617::DOUBLE) * x::DOUBLE + (0.7397258310897442::DOUBLE) * y::DOUBLE >= (7.219284181941153::DOUBLE)
                                THEN CASE WHEN (0.4611592443461358::DOUBLE) * x::DOUBLE + (-0.8873173904269548::DOUBLE) * y::DOUBLE >= (3.0453892184857194::DOUBLE)
                                  THEN 796
                                  ELSE 777
                                END
                                ELSE CASE WHEN (0.9977832387734324::DOUBLE) * x::DOUBLE + (-0.06654779051779129::DOUBLE) * y::DOUBLE >= (9.11750379320632::DOUBLE)
                                  THEN 796
                                  ELSE 753
                                END
                              END
                            END
                          END
                          ELSE CASE WHEN (0.9284944360099715::DOUBLE) * x::DOUBLE + (-0.371346310468443::DOUBLE) * y::DOUBLE >= (8.338899910208918::DOUBLE)
                            THEN CASE WHEN (0.004257817476037288::DOUBLE) * x::DOUBLE + (0.9999909354540873::DOUBLE) * y::DOUBLE >= (0.42855308409865034::DOUBLE)
                              THEN CASE WHEN (0.6419626263816046::DOUBLE) * x::DOUBLE + (-0.7667359299845237::DOUBLE) * y::DOUBLE >= (5.344822524977675::DOUBLE)
                                THEN CASE WHEN (0.9360987645104422::DOUBLE) * x::DOUBLE + (0.35173726427835844::DOUBLE) * y::DOUBLE >= (9.046640280463617::DOUBLE)
                                  THEN 804
                                  ELSE 778
                                END
                                ELSE CASE WHEN (0.9048023561458288::DOUBLE) * x::DOUBLE + (-0.4258317699666815::DOUBLE) * y::DOUBLE >= (8.09137127553043::DOUBLE)
                                  THEN 804
                                  ELSE 755
                                END
                              END
                              ELSE CASE WHEN (0.9984758692913466::DOUBLE) * x::DOUBLE + (-0.055190021225667005::DOUBLE) * y::DOUBLE >= (9.166932823118714::DOUBLE)
                                THEN CASE WHEN (0.07714613421694982::DOUBLE) * x::DOUBLE + (-0.9970197961802868::DOUBLE) * y::DOUBLE >= (0.41568007582149064::DOUBLE)
                                  THEN CASE WHEN (0.978287616039111::DOUBLE) * x::DOUBLE + (0.20725187648007692::DOUBLE) * y::DOUBLE >= (9.301534700085211::DOUBLE)
                                    THEN 803
                                    ELSE 781
                                  END
                                  ELSE CASE WHEN (0.6954938192861025::DOUBLE) * x::DOUBLE + (-0.718532078152973::DOUBLE) * y::DOUBLE >= (6.341172266679622::DOUBLE)
                                    THEN 803
                                    ELSE 778
                                  END
                                END
                                ELSE CASE WHEN (0.6421165399190313::DOUBLE) * x::DOUBLE + (0.7666070369898851::DOUBLE) * y::DOUBLE >= (6.131625462383379::DOUBLE)
                                  THEN 778
                                  ELSE 759
                                END
                              END
                            END
                            ELSE CASE WHEN (0.23285161435875207::DOUBLE) * x::DOUBLE + (-0.9725122753418195::DOUBLE) * y::DOUBLE >= (1.5230183478039385::DOUBLE)
                              THEN CASE WHEN (0.8209417207918424::DOUBLE) * x::DOUBLE + (0.5710119885460627::DOUBLE) * y::DOUBLE >= (7.266956487580486::DOUBLE)
                                THEN CASE WHEN (0.6718881376801634::DOUBLE) * x::DOUBLE + (-0.7406526381811395::DOUBLE) * y::DOUBLE >= (5.783913333228625::DOUBLE)
                                  THEN CASE WHEN (0.08703285638331493::DOUBLE) * x::DOUBLE + (0.9962054416182243::DOUBLE) * y::DOUBLE >= (1.1490711354144039::DOUBLE)
                                    THEN 761
                                    ELSE 759
                                  END
                                  ELSE CASE WHEN (0.849918786735584::DOUBLE) * x::DOUBLE + (0.5269137082615265::DOUBLE) * y::DOUBLE >= (7.852409632201501::DOUBLE)
                                    THEN 761
                                    ELSE 738
                                  END
                                END
                                ELSE CASE WHEN (0.9953858228738292::DOUBLE) * x::DOUBLE + (-0.09595344507515233::DOUBLE) * y::DOUBLE >= (8.704354632440428::DOUBLE)
                                  THEN 759
                                  ELSE 713
                                END
                              END
                              ELSE CASE WHEN (0.8193523130210605::DOUBLE) * x::DOUBLE + (-0.5732903166346331::DOUBLE) * y::DOUBLE >= (6.7105705038742585::DOUBLE)
                                THEN CASE WHEN (0.3525694518411829::DOUBLE) * x::DOUBLE + (0.9357856494029002::DOUBLE) * y::DOUBLE >= (3.740059223476422::DOUBLE)
                                  THEN CASE WHEN (0.2966246529424701::DOUBLE) * x::DOUBLE + (-0.9549941441007684::DOUBLE) * y::DOUBLE >= (1.9740698003823827::DOUBLE)
                                    THEN 761
                                    ELSE 755
                                  END
                                  ELSE CASE WHEN (0.849918786735584::DOUBLE) * x::DOUBLE + (0.5269137082615265::DOUBLE) * y::DOUBLE >= (7.852409632201501::DOUBLE)
                                    THEN 761
                                    ELSE 738
                                  END
                                END
                                ELSE CASE WHEN (0.9573785934280492::DOUBLE) * x::DOUBLE + (0.2888359895264611::DOUBLE) * y::DOUBLE >= (8.53217681878822::DOUBLE)
                                  THEN 755
                                  ELSE 705
                                END
                              END
                            END
                          END
                        END
                        ELSE CASE WHEN (0.10754751034725858::DOUBLE) * x::DOUBLE + (0.9941999461969943::DOUBLE) * y::DOUBLE >= (1.8272281787688458::DOUBLE)
                          THEN CASE WHEN (0.9846846129278399::DOUBLE) * x::DOUBLE + (-0.174345097617197::DOUBLE) * y::DOUBLE >= (8.089864026225667::DOUBLE)
                            THEN CASE WHEN (0.23474184712000928::DOUBLE) * x::DOUBLE + (0.9720577478785332::DOUBLE) * y::DOUBLE >= (3.7952301506288917::DOUBLE)
                              THEN CASE WHEN (0.711172492464081::DOUBLE) * x::DOUBLE + (-0.7030175573642715::DOUBLE) * y::DOUBLE >= (4.982909448152409::DOUBLE)
                                THEN CASE WHEN (0.7048301790251276::DOUBLE) * x::DOUBLE + (0.7093760770814072::DOUBLE) * y::DOUBLE >= (7.7110484484529795::DOUBLE)
                                  THEN 771
                                  ELSE 754
                                END
                                ELSE 734
                              END
                              ELSE CASE WHEN (0.44600433904032605::DOUBLE) * x::DOUBLE + (0.8950307981054072::DOUBLE) * y::DOUBLE >= (5.050547940995511::DOUBLE)
                                THEN CASE WHEN (0.6747820742143031::DOUBLE) * x::DOUBLE + (-0.7380170406698228::DOUBLE) * y::DOUBLE >= (4.868161356517236::DOUBLE)
                                  THEN CASE WHEN (0.009538019552727036::DOUBLE) * x::DOUBLE + (0.9999545120569293::DOUBLE) * y::DOUBLE >= (1.6052306652522834::DOUBLE)
                                    THEN 754
                                    ELSE 753
                                  END
                                  ELSE CASE WHEN (0.9292910063450185::DOUBLE) * x::DOUBLE + (0.36934837961775685::DOUBLE) * y::DOUBLE >= (8.811464374784718::DOUBLE)
                                    THEN 754
                                    ELSE 726
                                  END
                                END
                                ELSE CASE WHEN (0.9719346578412883::DOUBLE) * x::DOUBLE + (0.23525097425289831::DOUBLE) * y::DOUBLE >= (8.732744529266986::DOUBLE)
                                  THEN 753
                                  ELSE 708
                                END
                              END
                            END
                            ELSE CASE WHEN (0.8024790672118689::DOUBLE) * x::DOUBLE + (0.5966802717425547::DOUBLE) * y::DOUBLE >= (7.304149307092031::DOUBLE)
                              THEN CASE WHEN (0.23092698897404598::DOUBLE) * x::DOUBLE + (-0.9729710816686079::DOUBLE) * y::DOUBLE >= (0.37418929044190397::DOUBLE)
                                THEN CASE WHEN (0.626266667115611::DOUBLE) * x::DOUBLE + (0.7796089158417217::DOUBLE) * y::DOUBLE >= (6.36653377416941::DOUBLE)
                                  THEN CASE WHEN (0.09569542940255203::DOUBLE) * x::DOUBLE + (-0.9954106613812519::DOUBLE) * y::DOUBLE >= (-0.6064700425352892::DOUBLE)
                                    THEN 708
                                    ELSE 704
                                  END
                                  ELSE CASE WHEN (0.7509884649503541::DOUBLE) * x::DOUBLE + (-0.6603153227901886::DOUBLE) * y::DOUBLE >= (5.374066158043698::DOUBLE)
                                    THEN 708
                                    ELSE 685
                                  END
                                END
                                ELSE CASE WHEN (0.999944779794298::DOUBLE) * x::DOUBLE + (-0.010508918218956281::DOUBLE) * y::DOUBLE >= (8.199971660647988::DOUBLE)
                                  THEN 704
                                  ELSE 682
                                END
                              END
                              ELSE CASE WHEN (0.06708962636132511::DOUBLE) * x::DOUBLE + (-0.9977469529067468::DOUBLE) * y::DOUBLE >= (-0.7174902141635923::DOUBLE)
                                THEN CASE WHEN (0.6433256340582587::DOUBLE) * x::DOUBLE + (0.765592664909702::DOUBLE) * y::DOUBLE >= (6.056796772604404::DOUBLE)
                                  THEN CASE WHEN (0.7509884649503541::DOUBLE) * x::DOUBLE + (-0.6603153227901886::DOUBLE) * y::DOUBLE >= (5.374066158043698::DOUBLE)
                                    THEN 708
                                    ELSE 685
                                  END
                                  ELSE CASE WHEN (0.9746008076260952::DOUBLE) * x::DOUBLE + (0.2239492482116492::DOUBLE) * y::DOUBLE >= (8.154103325704302::DOUBLE)
                                    THEN 708
                                    ELSE 658
                                  END
                                END
                                ELSE CASE WHEN (0.9780478461821872::DOUBLE) * x::DOUBLE + (-0.20838044672757766::DOUBLE) * y::DOUBLE >= (7.490029311239246::DOUBLE)
                                  THEN 685
                                  ELSE 655
                                END
                              END
                            END
                          END
                          ELSE CASE WHEN (0.870724284271684::DOUBLE) * x::DOUBLE + (-0.49177151277759457::DOUBLE) * y::DOUBLE >= (6.6231776750857785::DOUBLE)
                            THEN CASE WHEN (0.6732743663109758::DOUBLE) * x::DOUBLE + (0.7393927425046544::DOUBLE) * y::DOUBLE >= (5.865015779018313::DOUBLE)
                              THEN CASE WHEN (0.23285161435875207::DOUBLE) * x::DOUBLE + (-0.9725122753418195::DOUBLE) * y::DOUBLE >= (1.5230183478039385::DOUBLE)
                                THEN 713
                                ELSE 705
                              END
                              ELSE CASE WHEN (0.9882325654058276::DOUBLE) * x::DOUBLE + (-0.1529588071064128::DOUBLE) * y::DOUBLE >= (8.099161009376402::DOUBLE)
                                THEN 713
                                ELSE 668
                              END
                            END
                            ELSE CASE WHEN (0.397192037536399::DOUBLE) * x::DOUBLE + (0.9177355203530504::DOUBLE) * y::DOUBLE >= (3.778033795007218::DOUBLE)
                              THEN CASE WHEN (0.2063738575704717::DOUBLE) * x::DOUBLE + (-0.9784732142023526::DOUBLE) * y::DOUBLE >= (0.9972440389052023::DOUBLE)
                                THEN 668
                                ELSE 658
                              END
                              ELSE CASE WHEN (0.8110151386972302::DOUBLE) * x::DOUBLE + (-0.5850251659577668::DOUBLE) * y::DOUBLE >= (6.082502497741167::DOUBLE)
                                THEN 668
                                ELSE 644
                              END
                            END
                          END
                        END
                      END
                      ELSE CASE WHEN (0.9227128010098212::DOUBLE) * x::DOUBLE + (0.3854881150601274::DOUBLE) * y::DOUBLE >= (8.763356616564211::DOUBLE)
                        THEN CASE WHEN (0.17407730172269315::DOUBLE) * x::DOUBLE + (-0.984731990454736::DOUBLE) * y::DOUBLE >= (-0.6505355707628375::DOUBLE)
                          THEN CASE WHEN (0.711172492464081::DOUBLE) * x::DOUBLE + (-0.7030175573642715::DOUBLE) * y::DOUBLE >= (4.982909448152409::DOUBLE)
                            THEN CASE WHEN (0.025501250389480215::DOUBLE) * x::DOUBLE + (-0.9996747902335904::DOUBLE) * y::DOUBLE >= (-1.7171046490518007::DOUBLE)
                              THEN CASE WHEN (0.7048301790251276::DOUBLE) * x::DOUBLE + (0.7093760770814072::DOUBLE) * y::DOUBLE >= (7.7110484484529795::DOUBLE)
                                THEN 771
                                ELSE 754
                              END
                              ELSE CASE WHEN (0.7703234446726666::DOUBLE) * x::DOUBLE + (-0.6376533467234663::DOUBLE) * y::DOUBLE >= (5.676893582297984::DOUBLE)
                                THEN CASE WHEN (0.07987341980384623::DOUBLE) * x::DOUBLE + (0.9968050144380488::DOUBLE) * y::DOUBLE >= (2.775418749898916::DOUBLE)
                                  THEN 772
                                  ELSE 771
                                END
                                ELSE CASE WHEN (0.9999350773117774::DOUBLE) * x::DOUBLE + (-0.011394786592553371::DOUBLE) * y::DOUBLE >= (9.04847299619762::DOUBLE)
                                  THEN 772
                                  ELSE 752
                                END
                              END
                            END
                            ELSE CASE WHEN (0.8034537996162576::DOUBLE) * x::DOUBLE + (0.5953671068191444::DOUBLE) * y::DOUBLE >= (8.43884495996172::DOUBLE)
                              THEN CASE WHEN (0.788082768383245::DOUBLE) * x::DOUBLE + (0.6155692895015156::DOUBLE) * y::DOUBLE >= (8.480122255648604::DOUBLE)
                                THEN CASE WHEN (0.45955433553548874::DOUBLE) * x::DOUBLE + (-0.8881496566967391::DOUBLE) * y::DOUBLE >= (2.2518874996530824::DOUBLE)
                                  THEN 772
                                  ELSE 768
                                END
                                ELSE CASE WHEN (0.9999350773117774::DOUBLE) * x::DOUBLE + (-0.011394786592553371::DOUBLE) * y::DOUBLE >= (9.04847299619762::DOUBLE)
                                  THEN 772
                                  ELSE 752
                                END
                              END
                              ELSE CASE WHEN (0.19708751471045594::DOUBLE) * x::DOUBLE + (-0.9803858992994827::DOUBLE) * y::DOUBLE >= (-0.35050202754331883::DOUBLE)
                                THEN CASE WHEN (0.8147968854161278::DOUBLE) * x::DOUBLE + (0.5797465269548212::DOUBLE) * y::DOUBLE >= (8.403813348847263::DOUBLE)
                                  THEN 752
                                  ELSE 734
                                END
                                ELSE CASE WHEN (0.9424133929379952::DOUBLE) * x::DOUBLE + (-0.3344502904933644::DOUBLE) * y::DOUBLE >= (7.582679532590073::DOUBLE)
                                  THEN 752
                                  ELSE 728
                                END
                              END
                            END
                          END
                          ELSE CASE WHEN (0.9868253883519079::DOUBLE) * x::DOUBLE + (0.16178891465148643::DOUBLE) * y::DOUBLE >= (9.084393484369006::DOUBLE)
                            THEN CASE WHEN (0.28562845997010317::DOUBLE) * x::DOUBLE + (-0.9583404316082605::DOUBLE) * y::DOUBLE >= (0.2269683430938243::DOUBLE)
                              THEN CASE WHEN (0.7957931988121519::DOUBLE) * x::DOUBLE + (0.6055684806232263::DOUBLE) * y::DOUBLE >= (8.636853111002086::DOUBLE)
                                THEN CASE WHEN (0.052873955802614274::DOUBLE) * x::DOUBLE + (-0.9986011940698766::DOUBLE) * y::DOUBLE >= (-1.8905528661903628::DOUBLE)
                                  THEN 768
                                  ELSE 766
                                END
                                ELSE CASE WHEN (0.9330555941951899::DOUBLE) * x::DOUBLE + (-0.35973220336948036::DOUBLE) * y::DOUBLE >= (7.588838709838546::DOUBLE)
                                  THEN 768
                                  ELSE 749
                                END
                              END
                              ELSE CASE WHEN (0.8496278595704226::DOUBLE) * x::DOUBLE + (0.5273826886064635::DOUBLE) * y::DOUBLE >= (8.934916460412058::DOUBLE)
                                THEN CASE WHEN (0.7479963401735892::DOUBLE) * x::DOUBLE + (-0.6637028514982559::DOUBLE) * y::DOUBLE >= (5.099343207569387::DOUBLE)
                                  THEN 766
                                  ELSE 756
                                END
                                ELSE CASE WHEN (0.9998750207549921::DOUBLE) * x::DOUBLE + (-0.015809581594843438::DOUBLE) * y::DOUBLE >= (8.953845691288144::DOUBLE)
                                  THEN 766
                                  ELSE 744
                                END
                              END
                            END
                            ELSE CASE WHEN (0.5469594046835151::DOUBLE) * x::DOUBLE + (-0.837159130409658::DOUBLE) * y::DOUBLE >= (2.7370966723836814::DOUBLE)
                              THEN CASE WHEN (0.14932235091514603::DOUBLE) * x::DOUBLE + (0.9887885696736052::DOUBLE) * y::DOUBLE >= (3.6227106527605786::DOUBLE)
                                THEN CASE WHEN (0.8595616237186134::DOUBLE) * x::DOUBLE + (-0.5110321076314294::DOUBLE) * y::DOUBLE >= (6.354616857148893::DOUBLE)
                                  THEN 749
                                  ELSE 731
                                END
                                ELSE CASE WHEN (0.9108121308408567::DOUBLE) * x::DOUBLE + (0.41282110206860567::DOUBLE) * y::DOUBLE >= (8.964220713682936::DOUBLE)
                                  THEN 749
                                  ELSE 728
                                END
                              END
                              ELSE CASE WHEN (0.9983820110283107::DOUBLE) * x::DOUBLE + (-0.05686264199864419::DOUBLE) * y::DOUBLE >= (8.47129992146707::DOUBLE)
                                THEN 731
                                ELSE 720
                              END
                            END
                          END
                        END
                        ELSE CASE WHEN (0.999944779794298::DOUBLE) * x::DOUBLE + (-0.010508918218956281::DOUBLE) * y::DOUBLE >= (8.199971660647988::DOUBLE)
                          THEN CASE WHEN (0.22406273007464853::DOUBLE) * x::DOUBLE + (-0.9745747241702378::DOUBLE) * y::DOUBLE >= (-0.23078150736517267::DOUBLE)
                            THEN CASE WHEN (0.18969386327173884::DOUBLE) * x::DOUBLE + (-0.98184328598664::DOUBLE) * y::DOUBLE >= (-0.2272081118420919::DOUBLE)
                              THEN CASE WHEN (0.9846846129278399::DOUBLE) * x::DOUBLE + (-0.174345097617197::DOUBLE) * y::DOUBLE >= (8.089864026225667::DOUBLE)
                                THEN CASE WHEN (0.23474184712000928::DOUBLE) * x::DOUBLE + (0.9720577478785332::DOUBLE) * y::DOUBLE >= (3.7952301506288917::DOUBLE)
                                  THEN 734
                                  ELSE 726
                                END
                                ELSE CASE WHEN (0.7750950815934349::DOUBLE) * x::DOUBLE + (0.6318446126142617::DOUBLE) * y::DOUBLE >= (7.784265070760454::DOUBLE)
                                  THEN 734
                                  ELSE 704
                                END
                              END
                              ELSE CASE WHEN (0.7724143453526756::DOUBLE) * x::DOUBLE + (0.635118948775265::DOUBLE) * y::DOUBLE >= (7.798938135717601::DOUBLE)
                                THEN CASE WHEN (0.8423269558171739::DOUBLE) * x::DOUBLE + (-0.5389668816390973::DOUBLE) * y::DOUBLE >= (6.136954218027074::DOUBLE)
                                  THEN 734
                                  ELSE 711
                                END
                                ELSE CASE WHEN (0.9986377873583115::DOUBLE) * x::DOUBLE + (-0.05217824891749206::DOUBLE) * y::DOUBLE >= (8.404010146178523::DOUBLE)
                                  THEN 734
                                  ELSE 697
                                END
                              END
                            END
                            ELSE CASE WHEN (0.6810828296831181::DOUBLE) * x::DOUBLE + (0.7322063774038278::DOUBLE) * y::DOUBLE >= (7.363815690334242::DOUBLE)
                              THEN CASE WHEN (0.42116078201136553::DOUBLE) * x::DOUBLE + (-0.9069859953139161::DOUBLE) * y::DOUBLE >= (1.482525328821585::DOUBLE)
                                THEN CASE WHEN (0.16315388280817805::DOUBLE) * x::DOUBLE + (0.9866006337544161::DOUBLE) * y::DOUBLE >= (3.667592414195791::DOUBLE)
                                  THEN 720
                                  ELSE 711
                                END
                                ELSE CASE WHEN (0.9191983653690503::DOUBLE) * x::DOUBLE + (0.3937948261504537::DOUBLE) * y::DOUBLE >= (8.722637925559258::DOUBLE)
                                  THEN 720
                                  ELSE 703
                                END
                              END
                              ELSE CASE WHEN (0.8858836125572417::DOUBLE) * x::DOUBLE + (-0.463907560837858::DOUBLE) * y::DOUBLE >= (6.379405213706655::DOUBLE)
                                THEN 711
                                ELSE 694
                              END
                            END
                          END
                          ELSE CASE WHEN (0.06043473088462736::DOUBLE) * x::DOUBLE + (-0.9981721511357159::DOUBLE) * y::DOUBLE >= (-1.4499280287084062::DOUBLE)
                            THEN CASE WHEN (0.9900445294741189::DOUBLE) * x::DOUBLE + (0.14075450137871479::DOUBLE) * y::DOUBLE >= (8.004286754151478::DOUBLE)
                              THEN CASE WHEN (0.47757197953534475::DOUBLE) * x::DOUBLE + (0.87859262708191::DOUBLE) * y::DOUBLE >= (5.225393770124517::DOUBLE)
                                THEN CASE WHEN (0.4334319210193883::DOUBLE) * x::DOUBLE + (-0.901186312502272::DOUBLE) * y::DOUBLE >= (1.8918455411753006::DOUBLE)
                                  THEN CASE WHEN (0.5811864173804059::DOUBLE) * x::DOUBLE + (0.8137704518182808::DOUBLE) * y::DOUBLE >= (6.2576954239789435::DOUBLE)
                                    THEN 697
                                    ELSE 682
                                  END
                                  ELSE CASE WHEN (0.8899193770225925::DOUBLE) * x::DOUBLE + (0.4561178602068996::DOUBLE) * y::DOUBLE >= (8.128315312946144::DOUBLE)
                                    THEN 697
                                    ELSE 670
                                  END
                                END
                                ELSE CASE WHEN (0.8024790672118689::DOUBLE) * x::DOUBLE + (0.5966802717425547::DOUBLE) * y::DOUBLE >= (7.304149307092031::DOUBLE)
                                  THEN 682
                                  ELSE 655
                                END
                              END
                              ELSE CASE WHEN (0.3674888420933177::DOUBLE) * x::DOUBLE + (-0.930027930191837::DOUBLE) * y::DOUBLE >= (1.3179822649206039::DOUBLE)
                                THEN 655
                                ELSE 647
                              END
                            END
                            ELSE CASE WHEN (0.9564376484622258::DOUBLE) * x::DOUBLE + (-0.2919366791001905::DOUBLE) * y::DOUBLE >= (6.95806966664408::DOUBLE)
                              THEN CASE WHEN (0.4316921047824971::DOUBLE) * x::DOUBLE + (0.9020210234071362::DOUBLE) * y::DOUBLE >= (5.368161559495007::DOUBLE)
                                THEN CASE WHEN (0.9215258877590268::DOUBLE) * x::DOUBLE + (0.38831693008409734::DOUBLE) * y::DOUBLE >= (8.379867550684637::DOUBLE)
                                  THEN CASE WHEN (0.22406273007464853::DOUBLE) * x::DOUBLE + (-0.9745747241702378::DOUBLE) * y::DOUBLE >= (-0.23078150736517267::DOUBLE)
                                    THEN 697
                                    ELSE 694
                                  END
                                  ELSE CASE WHEN (0.7779867976057028::DOUBLE) * x::DOUBLE + (-0.6282806242048399::DOUBLE) * y::DOUBLE >= (5.045827590170978::DOUBLE)
                                    THEN 697
                                    ELSE 680
                                  END
                                END
                                ELSE CASE WHEN (0.9976684651726487::DOUBLE) * x::DOUBLE + (-0.06824685780350359::DOUBLE) * y::DOUBLE >= (7.985035829519951::DOUBLE)
                                  THEN 697
                                  ELSE 669
                                END
                              END
                              ELSE CASE WHEN (0.8159432757409647::DOUBLE) * x::DOUBLE + (0.5781319665726021::DOUBLE) * y::DOUBLE >= (7.486549790623109::DOUBLE)
                                THEN CASE WHEN (0.8557706769876314::DOUBLE) * x::DOUBLE + (0.5173553405621045::DOUBLE) * y::DOUBLE >= (7.716831424348859::DOUBLE)
                                  THEN CASE WHEN (0.48943895438022605::DOUBLE) * x::DOUBLE + (-0.8720375622272191::DOUBLE) * y::DOUBLE >= (2.0035055303996105::DOUBLE)
                                    THEN 669
                                    ELSE 663
                                  END
                                  ELSE CASE WHEN (0.9900997260546135::DOUBLE) * x::DOUBLE + (-0.14036570972491583::DOUBLE) * y::DOUBLE >= (7.403384071916468::DOUBLE)
                                    THEN 669
                                    ELSE 640
                                  END
                                END
                                ELSE 647
                              END
                            END
                          END
                        END
                      END
                    END
                    ELSE CASE WHEN (0.7358329872404296::DOUBLE) * x::DOUBLE + (0.677163063736369::DOUBLE) * y::DOUBLE >= (8.001100093273616::DOUBLE)
                      THEN CASE WHEN (0.5278361236153432::DOUBLE) * x::DOUBLE + (-0.8493462348222474::DOUBLE) * y::DOUBLE >= (2.1949380431358643::DOUBLE)
                        THEN CASE WHEN (0.6115141409063741::DOUBLE) * x::DOUBLE + (-0.7912335024956535::DOUBLE) * y::DOUBLE >= (3.3050487627332354::DOUBLE)
                          THEN CASE WHEN (0.6950957476467257::DOUBLE) * x::DOUBLE + (0.7189171729785285::DOUBLE) * y::DOUBLE >= (7.939441942840906::DOUBLE)
                            THEN CASE WHEN (0.07400099760622575::DOUBLE) * x::DOUBLE + (-0.9972581673535109::DOUBLE) * y::DOUBLE >= (-1.889340110255909::DOUBLE)
                              THEN CASE WHEN (0.8496278595704226::DOUBLE) * x::DOUBLE + (0.5273826886064635::DOUBLE) * y::DOUBLE >= (8.934916460412058::DOUBLE)
                                THEN 756
                                ELSE 744
                              END
                              ELSE CASE WHEN (0.9531543446246817::DOUBLE) * x::DOUBLE + (-0.30248437203117395::DOUBLE) * y::DOUBLE >= (7.737247004632305::DOUBLE)
                                THEN CASE WHEN (0.13281876482015506::DOUBLE) * x::DOUBLE + (0.9911403410777145::DOUBLE) * y::DOUBLE >= (3.8541917930937775::DOUBLE)
                                  THEN 760
                                  ELSE 756
                                END
                                ELSE CASE WHEN (0.711953032438476::DOUBLE) * x::DOUBLE + (0.7022270854941856::DOUBLE) * y::DOUBLE >= (8.272897380096696::DOUBLE)
                                  THEN 760
                                  ELSE 743
                                END
                              END
                            END
                            ELSE CASE WHEN (0.9983820110283107::DOUBLE) * x::DOUBLE + (-0.05686264199864419::DOUBLE) * y::DOUBLE >= (8.47129992146707::DOUBLE)
                              THEN CASE WHEN (0.9868253883519079::DOUBLE) * x::DOUBLE + (0.16178891465148643::DOUBLE) * y::DOUBLE >= (9.084393484369006::DOUBLE)
                                THEN 744
                                ELSE 731
                              END
                              ELSE 720
                            END
                          END
                          ELSE CASE WHEN (0.6748610432684531::DOUBLE) * x::DOUBLE + (0.7379448301049444::DOUBLE) * y::DOUBLE >= (7.861665040545188::DOUBLE)
                            THEN CASE WHEN (0.6807590665113533::DOUBLE) * x::DOUBLE + (-0.7325074015752951::DOUBLE) * y::DOUBLE >= (3.961584484586554::DOUBLE)
                              THEN CASE WHEN (0.34529137395263565::DOUBLE) * x::DOUBLE + (0.9384955338593259::DOUBLE) * y::DOUBLE >= (5.679578439357799::DOUBLE)
                                THEN CASE WHEN (0.8069583952003552::DOUBLE) * x::DOUBLE + (-0.5906082867820832::DOUBLE) * y::DOUBLE >= (5.554431317993727::DOUBLE)
                                  THEN 760
                                  ELSE 746
                                END
                                ELSE CASE WHEN (0.926959440425336::DOUBLE) * x::DOUBLE + (0.37516155960645525::DOUBLE) * y::DOUBLE >= (9.301734228378075::DOUBLE)
                                  THEN 760
                                  ELSE 739
                                END
                              END
                              ELSE CASE WHEN (0.8213097795336524::DOUBLE) * x::DOUBLE + (0.5704824677782685::DOUBLE) * y::DOUBLE >= (8.85366689237705::DOUBLE)
                                THEN 746
                                ELSE 732
                              END
                            END
                            ELSE CASE WHEN (0.9983820110283107::DOUBLE) * x::DOUBLE + (-0.05686264199864419::DOUBLE) * y::DOUBLE >= (8.47129992146707::DOUBLE)
                              THEN CASE WHEN (0.4682739461139376::DOUBLE) * x::DOUBLE + (-0.8835833358494721::DOUBLE) * y::DOUBLE >= (1.7928197498986869::DOUBLE)
                                THEN CASE WHEN (0.3650196716499284::DOUBLE) * x::DOUBLE + (0.9309998062881529::DOUBLE) * y::DOUBLE >= (5.599789433290631::DOUBLE)
                                  THEN 739
                                  ELSE 731
                                END
                                ELSE CASE WHEN (0.9902639605432433::DOUBLE) * x::DOUBLE + (0.13920232918026093::DOUBLE) * y::DOUBLE >= (9.0001359776246::DOUBLE)
                                  THEN 739
                                  ELSE 723
                                END
                              END
                              ELSE CASE WHEN (0.42001223797085585::DOUBLE) * x::DOUBLE + (-0.9075184405590406::DOUBLE) * y::DOUBLE >= (1.196080578614788::DOUBLE)
                                THEN CASE WHEN (0.3959867433576281::DOUBLE) * x::DOUBLE + (0.9182562273597821::DOUBLE) * y::DOUBLE >= (5.7539401758208735::DOUBLE)
                                  THEN 723
                                  ELSE 720
                                END
                                ELSE CASE WHEN (0.9504191510086952::DOUBLE) * x::DOUBLE + (-0.3109717630202311::DOUBLE) * y::DOUBLE >= (7.251263737063079::DOUBLE)
                                  THEN 723
                                  ELSE 706
                                END
                              END
                            END
                          END
                        END
                        ELSE CASE WHEN (0.9951401368840963::DOUBLE) * x::DOUBLE + (0.09846881720779291::DOUBLE) * y::DOUBLE >= (8.728258132963443::DOUBLE)
                          THEN CASE WHEN (0.6659555951139443::DOUBLE) * x::DOUBLE + (0.7459913842239951::DOUBLE) * y::DOUBLE >= (7.9797448588612845::DOUBLE)
                            THEN CASE WHEN (0.5706409805881718::DOUBLE) * x::DOUBLE + (-0.8211996537221443::DOUBLE) * y::DOUBLE >= (2.43317495352377::DOUBLE)
                              THEN CASE WHEN (0.8213097795336524::DOUBLE) * x::DOUBLE + (0.5704824677782685::DOUBLE) * y::DOUBLE >= (8.85366689237705::DOUBLE)
                                THEN CASE WHEN (0.6790002782703902::DOUBLE) * x::DOUBLE + (0.7341380129844337::DOUBLE) * y::DOUBLE >= (8.259299216217954::DOUBLE)
                                  THEN CASE WHEN (0.01695704854573234::DOUBLE) * x::DOUBLE + (-0.9998562189158087::DOUBLE) * y::DOUBLE >= (-2.886161507052691::DOUBLE)
                                    THEN 746
                                    ELSE 745
                                  END
                                  ELSE CASE WHEN (0.7542035100535788::DOUBLE) * x::DOUBLE + (-0.656640743042085::DOUBLE) * y::DOUBLE >= (4.703068172759452::DOUBLE)
                                    THEN 746
                                    ELSE 736
                                  END
                                END
                                ELSE CASE WHEN (0.5865015763434863::DOUBLE) * x::DOUBLE + (-0.809948085340416::DOUBLE) * y::DOUBLE >= (2.7849730795868837::DOUBLE)
                                  THEN CASE WHEN (0.07804688411501046::DOUBLE) * x::DOUBLE + (0.9969496897436391::DOUBLE) * y::DOUBLE >= (3.578248207768684::DOUBLE)
                                    THEN 736
                                    ELSE 732
                                  END
                                  ELSE CASE WHEN (0.6729394907842975::DOUBLE) * x::DOUBLE + (0.7396975339576106::DOUBLE) * y::DOUBLE >= (8.041494298237849::DOUBLE)
                                    THEN 736
                                    ELSE 724
                                  END
                                END
                              END
                              ELSE CASE WHEN (0.7421603102675796::DOUBLE) * x::DOUBLE + (0.670222406267897::DOUBLE) * y::DOUBLE >= (8.47564515968635::DOUBLE)
                                THEN CASE WHEN (0.46632364422830036::DOUBLE) * x::DOUBLE + (-0.8846141864302413::DOUBLE) * y::DOUBLE >= (1.2994824061082166::DOUBLE)
                                  THEN CASE WHEN (0.6790002782703902::DOUBLE) * x::DOUBLE + (0.7341380129844337::DOUBLE) * y::DOUBLE >= (8.259299216217954::DOUBLE)
                                    THEN 745
                                    ELSE 736
                                  END
                                  ELSE CASE WHEN (0.9921386469346031::DOUBLE) * x::DOUBLE + (-0.12514353862175623::DOUBLE) * y::DOUBLE >= (8.2967035248095::DOUBLE)
                                    THEN 745
                                    ELSE 725
                                  END
                                END
                                ELSE CASE WHEN (0.9681723476971004::DOUBLE) * x::DOUBLE + (-0.2502844484874859::DOUBLE) * y::DOUBLE >= (7.589185564445591::DOUBLE)
                                  THEN 736
                                  ELSE 715
                                END
                              END
                            END
                            ELSE CASE WHEN (0.5874679562136071::DOUBLE) * x::DOUBLE + (-0.809247428431013::DOUBLE) * y::DOUBLE >= (2.6436301124610972::DOUBLE)
                              THEN CASE WHEN (0.796320922706587::DOUBLE) * x::DOUBLE + (0.6048743572509332::DOUBLE) * y::DOUBLE >= (8.41896684971925::DOUBLE)
                                THEN CASE WHEN (0.7777013939763395::DOUBLE) * x::DOUBLE + (0.6286338694401202::DOUBLE) * y::DOUBLE >= (8.469978806506848::DOUBLE)
                                  THEN CASE WHEN (0.5865015763434863::DOUBLE) * x::DOUBLE + (-0.809948085340416::DOUBLE) * y::DOUBLE >= (2.7849730795868837::DOUBLE)
                                    THEN 732
                                    ELSE 724
                                  END
                                  ELSE CASE WHEN (0.9907109087798968::DOUBLE) * x::DOUBLE + (-0.13598490807626779::DOUBLE) * y::DOUBLE >= (8.161471017814495::DOUBLE)
                                    THEN 732
                                    ELSE 716
                                  END
                                END
                                ELSE 706
                              END
                              ELSE CASE WHEN (0.5718034136952378::DOUBLE) * x::DOUBLE + (0.8203906728421969::DOUBLE) * y::DOUBLE >= (7.3173002109267::DOUBLE)
                                THEN CASE WHEN (0.5706409805881718::DOUBLE) * x::DOUBLE + (-0.8211996537221443::DOUBLE) * y::DOUBLE >= (2.43317495352377::DOUBLE)
                                  THEN 724
                                  ELSE 715
                                END
                                ELSE CASE WHEN (0.9800681083783406::DOUBLE) * x::DOUBLE + (-0.1986617802691325::DOUBLE) * y::DOUBLE >= (7.776829523593207::DOUBLE)
                                  THEN 724
                                  ELSE 709
                                END
                              END
                            END
                          END
                          ELSE CASE WHEN (0.21672667467356116::DOUBLE) * x::DOUBLE + (-0.9762323230076642::DOUBLE) * y::DOUBLE >= (-1.0425104488568382::DOUBLE)
                            THEN CASE WHEN (0.8975274193962889::DOUBLE) * x::DOUBLE + (-0.4409586504785206::DOUBLE) * y::DOUBLE >= (6.24987140272108::DOUBLE)
                              THEN CASE WHEN (0.04459055507041703::DOUBLE) * x::DOUBLE + (0.9990053465314949::DOUBLE) * y::DOUBLE >= (3.2137249424976124::DOUBLE)
                                THEN CASE WHEN (0.5874679562136071::DOUBLE) * x::DOUBLE + (-0.809247428431013::DOUBLE) * y::DOUBLE >= (2.6436301124610972::DOUBLE)
                                  THEN 716
                                  ELSE 709
                                END
                                ELSE CASE WHEN (0.796320922706587::DOUBLE) * x::DOUBLE + (0.6048743572509332::DOUBLE) * y::DOUBLE >= (8.41896684971925::DOUBLE)
                                  THEN 716
                                  ELSE 706
                                END
                              END
                              ELSE CASE WHEN (0.7998050549744777::DOUBLE) * x::DOUBLE + (0.6002598387675729::DOUBLE) * y::DOUBLE >= (8.393821755597353::DOUBLE)
                                THEN 709
                                ELSE 695
                              END
                            END
                            ELSE CASE WHEN (0.9955809693984786::DOUBLE) * x::DOUBLE + (-0.09390704644266905::DOUBLE) * y::DOUBLE >= (7.998750465102851::DOUBLE)
                              THEN CASE WHEN (0.676027080960581::DOUBLE) * x::DOUBLE + (-0.736876777899749::DOUBLE) * y::DOUBLE >= (3.4073017911395773::DOUBLE)
                                THEN CASE WHEN (0.5718034136952378::DOUBLE) * x::DOUBLE + (0.8203906728421969::DOUBLE) * y::DOUBLE >= (7.3173002109267::DOUBLE)
                                  THEN 715
                                  ELSE 709
                                END
                                ELSE CASE WHEN (0.9918671015017141::DOUBLE) * x::DOUBLE + (-0.12727785729885785::DOUBLE) * y::DOUBLE >= (7.92972325614615::DOUBLE)
                                  THEN 715
                                  ELSE 696
                                END
                              END
                              ELSE CASE WHEN (0.9720247963633526::DOUBLE) * x::DOUBLE + (0.2348782562409365::DOUBLE) * y::DOUBLE >= (8.601698797403115::DOUBLE)
                                THEN CASE WHEN (0.6686961963909662::DOUBLE) * x::DOUBLE + (-0.7435357401848646::DOUBLE) * y::DOUBLE >= (3.1428239488900567::DOUBLE)
                                  THEN CASE WHEN (0.4144989942937646::DOUBLE) * x::DOUBLE + (0.9100497699189082::DOUBLE) * y::DOUBLE >= (6.184311530031807::DOUBLE)
                                    THEN 696
                                    ELSE 691
                                  END
                                  ELSE CASE WHEN (0.9739340106270606::DOUBLE) * x::DOUBLE + (-0.22683152987159516::DOUBLE) * y::DOUBLE >= (7.222777273629651::DOUBLE)
                                    THEN 696
                                    ELSE 672
                                  END
                                END
                                ELSE CASE WHEN (0.1662072055357944::DOUBLE) * x::DOUBLE + (-0.9860908501897693::DOUBLE) * y::DOUBLE >= (-1.675169444678933::DOUBLE)
                                  THEN 681
                                  ELSE 672
                                END
                              END
                            END
                          END
                        END
                      END
                      ELSE CASE WHEN (0.2758856754043549::DOUBLE) * x::DOUBLE + (-0.9611904567288851::DOUBLE) * y::DOUBLE >= (-0.3729753272077283::DOUBLE)
                        THEN CASE WHEN (0.7190258515391835::DOUBLE) * x::DOUBLE + (0.6949833270074559::DOUBLE) * y::DOUBLE >= (7.5394341633726::DOUBLE)
                          THEN CASE WHEN (0.791673165135737::DOUBLE) * x::DOUBLE + (0.6109448417033767::DOUBLE) * y::DOUBLE >= (8.098875921042293::DOUBLE)
                            THEN CASE WHEN (0.8975274193962889::DOUBLE) * x::DOUBLE + (-0.4409586504785206::DOUBLE) * y::DOUBLE >= (6.24987140272108::DOUBLE)
                              THEN CASE WHEN (0.1638869017272593::DOUBLE) * x::DOUBLE + (-0.9864791348235601::DOUBLE) * y::DOUBLE >= (-1.10363952805431::DOUBLE)
                                THEN CASE WHEN (0.9191983653690503::DOUBLE) * x::DOUBLE + (0.3937948261504537::DOUBLE) * y::DOUBLE >= (8.722637925559258::DOUBLE)
                                  THEN 720
                                  ELSE 703
                                END
                                ELSE CASE WHEN (0.5761302034987823::DOUBLE) * x::DOUBLE + (0.8173579317633443::DOUBLE) * y::DOUBLE >= (7.003698715628051::DOUBLE)
                                  THEN CASE WHEN (0.42001223797085585::DOUBLE) * x::DOUBLE + (-0.9075184405590406::DOUBLE) * y::DOUBLE >= (1.196080578614788::DOUBLE)
                                    THEN 720
                                    ELSE 706
                                  END
                                  ELSE CASE WHEN (0.8357865216853686::DOUBLE) * x::DOUBLE + (-0.5490545420712526::DOUBLE) * y::DOUBLE >= (5.648641577914829::DOUBLE)
                                    THEN 720
                                    ELSE 702
                                  END
                                END
                              END
                              ELSE CASE WHEN (0.6358858511092571::DOUBLE) * x::DOUBLE + (0.7717831200272882::DOUBLE) * y::DOUBLE >= (7.330577505870018::DOUBLE)
                                THEN CASE WHEN (0.37960386276417424::DOUBLE) * x::DOUBLE + (-0.9251491271003384::DOUBLE) * y::DOUBLE >= (0.6350735808115244::DOUBLE)
                                  THEN 702
                                  ELSE 695
                                END
                                ELSE CASE WHEN (0.9220153725686075::DOUBLE) * x::DOUBLE + (-0.3871532677728186::DOUBLE) * y::DOUBLE >= (6.563230074857193::DOUBLE)
                                  THEN 702
                                  ELSE 684
                                END
                              END
                            END
                            ELSE CASE WHEN (0.9522308284218954::DOUBLE) * x::DOUBLE + (-0.3053791895381061::DOUBLE) * y::DOUBLE >= (6.95251488710987::DOUBLE)
                              THEN CASE WHEN (0.2786660694691984::DOUBLE) * x::DOUBLE + (-0.9603880578842012::DOUBLE) * y::DOUBLE >= (-0.21871215757330775::DOUBLE)
                                THEN CASE WHEN (0.21537384141733343::DOUBLE) * x::DOUBLE + (-0.9765316730312137::DOUBLE) * y::DOUBLE >= (-0.5628093330280104::DOUBLE)
                                  THEN CASE WHEN (0.6810828296831181::DOUBLE) * x::DOUBLE + (0.7322063774038278::DOUBLE) * y::DOUBLE >= (7.363815690334242::DOUBLE)
                                    THEN 703
                                    ELSE 694
                                  END
                                  ELSE CASE WHEN (0.8551257098133028::DOUBLE) * x::DOUBLE + (-0.5184206982907752::DOUBLE) * y::DOUBLE >= (5.804463048970852::DOUBLE)
                                    THEN 703
                                    ELSE 689
                                  END
                                END
                                ELSE 684
                              END
                              ELSE CASE WHEN (0.5596534668248715::DOUBLE) * x::DOUBLE + (-0.828726732446168::DOUBLE) * y::DOUBLE >= (2.2842145564173624::DOUBLE)
                                THEN CASE WHEN (0.5977108182379601::DOUBLE) * x::DOUBLE + (0.8017117797321605::DOUBLE) * y::DOUBLE >= (6.933984420344909::DOUBLE)
                                  THEN 684
                                  ELSE 675
                                END
                                ELSE CASE WHEN (0.99281114971284::DOUBLE) * x::DOUBLE + (-0.11969135727306564::DOUBLE) * y::DOUBLE >= (7.650393445117162::DOUBLE)
                                  THEN 684
                                  ELSE 667
                                END
                              END
                            END
                          END
                          ELSE CASE WHEN (0.7460477403735941::DOUBLE) * x::DOUBLE + (-0.6658924605996485::DOUBLE) * y::DOUBLE >= (4.312316070786053::DOUBLE)
                            THEN CASE WHEN (0.1483127276529575::DOUBLE) * x::DOUBLE + (-0.9889405112625025::DOUBLE) * y::DOUBLE >= (-1.2458342116822136::DOUBLE)
                              THEN CASE WHEN (0.8760348019767281::DOUBLE) * x::DOUBLE + (0.4822478882541577::DOUBLE) * y::DOUBLE >= (8.08825426394548::DOUBLE)
                                THEN CASE WHEN (0.010231951073491244::DOUBLE) * x::DOUBLE + (-0.9999476522184698::DOUBLE) * y::DOUBLE >= (-2.206205552118626::DOUBLE)
                                  THEN CASE WHEN (0.9215258877590268::DOUBLE) * x::DOUBLE + (0.38831693008409734::DOUBLE) * y::DOUBLE >= (8.379867550684637::DOUBLE)
                                    THEN 694
                                    ELSE 680
                                  END
                                  ELSE CASE WHEN (0.8568612022683867::DOUBLE) * x::DOUBLE + (-0.5155471656862977::DOUBLE) * y::DOUBLE >= (5.784832064525193::DOUBLE)
                                    THEN 694
                                    ELSE 678
                                  END
                                END
                                ELSE CASE WHEN (0.9564376484622258::DOUBLE) * x::DOUBLE + (-0.2919366791001905::DOUBLE) * y::DOUBLE >= (6.95806966664408::DOUBLE)
                                  THEN 680
                                  ELSE 663
                                END
                              END
                              ELSE 675
                            END
                            ELSE CASE WHEN (0.39042393617021387::DOUBLE) * x::DOUBLE + (0.9206351883701582::DOUBLE) * y::DOUBLE >= (5.299666033430212::DOUBLE)
                              THEN CASE WHEN (0.8309592733359231::DOUBLE) * x::DOUBLE + (-0.5563332509000648::DOUBLE) * y::DOUBLE >= (5.056118096392936::DOUBLE)
                                THEN CASE WHEN (0.22006716165554105::DOUBLE) * x::DOUBLE + (0.9754847227716454::DOUBLE) * y::DOUBLE >= (4.300324130902384::DOUBLE)
                                  THEN CASE WHEN (0.5596534668248715::DOUBLE) * x::DOUBLE + (-0.828726732446168::DOUBLE) * y::DOUBLE >= (2.2842145564173624::DOUBLE)
                                    THEN 675
                                    ELSE 667
                                  END
                                  ELSE CASE WHEN (0.9929130110579373::DOUBLE) * x::DOUBLE + (0.11884339473382807::DOUBLE) * y::DOUBLE >= (8.207013218117508::DOUBLE)
                                    THEN 675
                                    ELSE 665
                                  END
                                END
                                ELSE CASE WHEN (0.9153072960175517::DOUBLE) * x::DOUBLE + (0.40275619654704015::DOUBLE) * y::DOUBLE >= (8.24775113144364::DOUBLE)
                                  THEN 667
                                  ELSE 653
                                END
                              END
                              ELSE CASE WHEN (0.9116538637204705::DOUBLE) * x::DOUBLE + (-0.4109589185837651::DOUBLE) * y::DOUBLE >= (6.104151768831269::DOUBLE)
                                THEN CASE WHEN (0.1396344819388461::DOUBLE) * x::DOUBLE + (0.9902031162613406::DOUBLE) * y::DOUBLE >= (3.4744298470143855::DOUBLE)
                                  THEN 665
                                  ELSE 663
                                END
                                ELSE CASE WHEN (0.8310571782098435::DOUBLE) * x::DOUBLE + (0.5561869888318968::DOUBLE) * y::DOUBLE >= (7.80899541510261::DOUBLE)
                                  THEN 665
                                  ELSE 645
                                END
                              END
                            END
                          END
                        END
                        ELSE CASE WHEN (0.5998299382905203::DOUBLE) * x::DOUBLE + (-0.8001275180434619::DOUBLE) * y::DOUBLE >= (2.4757946490213576::DOUBLE)
                          THEN CASE WHEN (0.9027416075821783::DOUBLE) * x::DOUBLE + (0.4301832050881863::DOUBLE) * y::DOUBLE >= (8.420730538380822::DOUBLE)
                            THEN CASE WHEN (0.2832349251625895::DOUBLE) * x::DOUBLE + (0.9590505602772683::DOUBLE) * y::DOUBLE >= (5.033178131031891::DOUBLE)
                              THEN CASE WHEN (0.9720247963633526::DOUBLE) * x::DOUBLE + (0.2348782562409365::DOUBLE) * y::DOUBLE >= (8.601698797403115::DOUBLE)
                                THEN CASE WHEN (0.21672667467356116::DOUBLE) * x::DOUBLE + (-0.9762323230076642::DOUBLE) * y::DOUBLE >= (-1.0425104488568382::DOUBLE)
                                  THEN 695
                                  ELSE 691
                                END
                                ELSE CASE WHEN (0.8210799189824657::DOUBLE) * x::DOUBLE + (-0.5708132502349149::DOUBLE) * y::DOUBLE >= (5.052092060343512::DOUBLE)
                                  THEN 695
                                  ELSE 681
                                END
                              END
                              ELSE CASE WHEN (0.6799306311634007::DOUBLE) * x::DOUBLE + (-0.7332764395545105::DOUBLE) * y::DOUBLE >= (3.4798778266272::DOUBLE)
                                THEN CASE WHEN (0.6358858511092571::DOUBLE) * x::DOUBLE + (0.7717831200272882::DOUBLE) * y::DOUBLE >= (7.330577505870018::DOUBLE)
                                  THEN 695
                                  ELSE 684
                                END
                                ELSE CASE WHEN (0.9991475350864356::DOUBLE) * x::DOUBLE + (0.04128199523642175::DOUBLE) * y::DOUBLE >= (8.242450969895293::DOUBLE)
                                  THEN 695
                                  ELSE 673
                                END
                              END
                            END
                            ELSE CASE WHEN (0.9911164292152533::DOUBLE) * x::DOUBLE + (-0.1329970816958252::DOUBLE) * y::DOUBLE >= (7.488749549280637::DOUBLE)
                              THEN CASE WHEN (0.7295588349812112::DOUBLE) * x::DOUBLE + (0.6839180552528628::DOUBLE) * y::DOUBLE >= (7.707066589375315::DOUBLE)
                                THEN CASE WHEN (0.6799306311634007::DOUBLE) * x::DOUBLE + (-0.7332764395545105::DOUBLE) * y::DOUBLE >= (3.4798778266272::DOUBLE)
                                  THEN 684
                                  ELSE 673
                                END
                                ELSE CASE WHEN (0.99281114971284::DOUBLE) * x::DOUBLE + (-0.11969135727306564::DOUBLE) * y::DOUBLE >= (7.650393445117162::DOUBLE)
                                  THEN 684
                                  ELSE 667
                                END
                              END
                              ELSE CASE WHEN (0.44762106723788847::DOUBLE) * x::DOUBLE + (0.8942233390852722::DOUBLE) * y::DOUBLE >= (5.930825490931003::DOUBLE)
                                THEN CASE WHEN (0.5853039944276235::DOUBLE) * x::DOUBLE + (-0.8108139330987527::DOUBLE) * y::DOUBLE >= (2.3669441871659487::DOUBLE)
                                  THEN 667
                                  ELSE 661
                                END
                                ELSE CASE WHEN (0.9153072960175517::DOUBLE) * x::DOUBLE + (0.40275619654704015::DOUBLE) * y::DOUBLE >= (8.24775113144364::DOUBLE)
                                  THEN 667
                                  ELSE 653
                                END
                              END
                            END
                          END
                          ELSE CASE WHEN (0.8416468431615295::DOUBLE) * x::DOUBLE + (-0.5400283246240256::DOUBLE) * y::DOUBLE >= (4.983709720278435::DOUBLE)
                            THEN CASE WHEN (0.5051997040919939::DOUBLE) * x::DOUBLE + (0.8630024675430319::DOUBLE) * y::DOUBLE >= (6.477076454313871::DOUBLE)
                              THEN CASE WHEN (0.3826195291577785::DOUBLE) * x::DOUBLE + (-0.9239059994972865::DOUBLE) * y::DOUBLE >= (0.22710512128275084::DOUBLE)
                                THEN CASE WHEN (0.45451195067070393::DOUBLE) * x::DOUBLE + (0.8907406394105478::DOUBLE) * y::DOUBLE >= (6.351476463008886::DOUBLE)
                                  THEN CASE WHEN (0.1662072055357944::DOUBLE) * x::DOUBLE + (-0.9860908501897693::DOUBLE) * y::DOUBLE >= (-1.675169444678933::DOUBLE)
                                    THEN 681
                                    ELSE 672
                                  END
                                  ELSE CASE WHEN (0.992983318255844::DOUBLE) * x::DOUBLE + (-0.11825451224208501::DOUBLE) * y::DOUBLE >= (7.585299941019892::DOUBLE)
                                    THEN 681
                                    ELSE 666
                                  END
                                END
                                ELSE CASE WHEN (0.8863043323325641::DOUBLE) * x::DOUBLE + (0.4631032611508235::DOUBLE) * y::DOUBLE >= (8.488965361955405::DOUBLE)
                                  THEN 672
                                  ELSE 664
                                END
                              END
                              ELSE CASE WHEN (0.44762106723788847::DOUBLE) * x::DOUBLE + (0.8942233390852722::DOUBLE) * y::DOUBLE >= (5.930825490931003::DOUBLE)
                                THEN 661
                                ELSE 653
                              END
                            END
                            ELSE CASE WHEN (0.8758656087697546::DOUBLE) * x::DOUBLE + (-0.4825551112301964::DOUBLE) * y::DOUBLE >= (5.244398444511216::DOUBLE)
                              THEN CASE WHEN (0.7192576265254065::DOUBLE) * x::DOUBLE + (0.6947434538626751::DOUBLE) * y::DOUBLE >= (7.682465854136793::DOUBLE)
                                THEN CASE WHEN (0.3826195291577785::DOUBLE) * x::DOUBLE + (-0.9239059994972865::DOUBLE) * y::DOUBLE >= (0.22710512128275084::DOUBLE)
                                  THEN 666
                                  ELSE 664
                                END
                                ELSE CASE WHEN (0.9911297127691375::DOUBLE) * x::DOUBLE + (0.1328980529058532::DOUBLE) * y::DOUBLE >= (8.126238384174757::DOUBLE)
                                  THEN 666
                                  ELSE 649
                                END
                              END
                              ELSE CASE WHEN (0.43231783098621424::DOUBLE) * x::DOUBLE + (0.9017212945313952::DOUBLE) * y::DOUBLE >= (6.1082679450762605::DOUBLE)
                                THEN CASE WHEN (0.3075183998231714::DOUBLE) * x::DOUBLE + (-0.9515421345217436::DOUBLE) * y::DOUBLE >= (-0.5786768416677353::DOUBLE)
                                  THEN 649
                                  ELSE 642
                                END
                                ELSE CASE WHEN (0.7747876846470615::DOUBLE) * x::DOUBLE + (-0.6322215147551098::DOUBLE) * y::DOUBLE >= (3.9979670377836642::DOUBLE)
                                  THEN 649
                                  ELSE 637
                                END
                              END
                            END
                          END
                        END
                      END
                    END
                  END
                  ELSE CASE WHEN (0.2210754327155421::DOUBLE) * x::DOUBLE + (0.9752567113584176::DOUBLE) * y::DOUBLE >= (3.3860815742067913::DOUBLE)
                    THEN CASE WHEN (0.9626783827532622::DOUBLE) * x::DOUBLE + (-0.2706479842518017::DOUBLE) * y::DOUBLE >= (5.962033557338515::DOUBLE)
                      THEN CASE WHEN (0.09351317328287631::DOUBLE) * x::DOUBLE + (-0.9956180424352337::DOUBLE) * y::DOUBLE >= (-1.779870975336827::DOUBLE)
                        THEN CASE WHEN (0.8029349527104477::DOUBLE) * x::DOUBLE + (-0.5960666587856355::DOUBLE) * y::DOUBLE >= (4.660081828734513::DOUBLE)
                          THEN CASE WHEN (0.2501470459223148::DOUBLE) * x::DOUBLE + (0.9682078575473034::DOUBLE) * y::DOUBLE >= (4.053024055597363::DOUBLE)
                            THEN CASE WHEN (0.9116538637204705::DOUBLE) * x::DOUBLE + (-0.4109589185837651::DOUBLE) * y::DOUBLE >= (6.104151768831269::DOUBLE)
                              THEN 663
                              ELSE CASE WHEN (0.3068945462647796::DOUBLE) * x::DOUBLE + (-0.9517435250491253::DOUBLE) * y::DOUBLE >= (-0.028474705916405885::DOUBLE)
                                THEN CASE WHEN (0.39042393617021387::DOUBLE) * x::DOUBLE + (0.9206351883701582::DOUBLE) * y::DOUBLE >= (5.299666033430212::DOUBLE)
                                  THEN 653
                                  ELSE 645
                                END
                                ELSE CASE WHEN (0.9788146039482051::DOUBLE) * x::DOUBLE + (0.20474855578909082::DOUBLE) * y::DOUBLE >= (8.020977907970947::DOUBLE)
                                  THEN 653
                                  ELSE 639
                                END
                              END
                            END
                            ELSE CASE WHEN (0.8159432757409647::DOUBLE) * x::DOUBLE + (0.5781319665726021::DOUBLE) * y::DOUBLE >= (7.486549790623109::DOUBLE)
                              THEN CASE WHEN (0.8557706769876314::DOUBLE) * x::DOUBLE + (0.5173553405621045::DOUBLE) * y::DOUBLE >= (7.716831424348859::DOUBLE)
                                THEN 663
                                ELSE CASE WHEN (0.9900997260546135::DOUBLE) * x::DOUBLE + (-0.14036570972491583::DOUBLE) * y::DOUBLE >= (7.403384071916468::DOUBLE)
                                  THEN 669
                                  ELSE 640
                                END
                              END
                              ELSE CASE WHEN (0.7772333505738122::DOUBLE) * x::DOUBLE + (0.6292124591549387::DOUBLE) * y::DOUBLE >= (7.002583965088048::DOUBLE)
                                THEN CASE WHEN (0.33523616899114533::DOUBLE) * x::DOUBLE + (-0.9421341258017036::DOUBLE) * y::DOUBLE >= (0.7203327904930683::DOUBLE)
                                  THEN 647
                                  ELSE 640
                                END
                                ELSE CASE WHEN (0.9893930855420081::DOUBLE) * x::DOUBLE + (-0.14526294187322783::DOUBLE) * y::DOUBLE >= (7.12065491359687::DOUBLE)
                                  THEN 647
                                  ELSE 615
                                END
                              END
                            END
                          END
                          ELSE CASE WHEN (0.617923639661389::DOUBLE) * x::DOUBLE + (0.7862381163156758::DOUBLE) * y::DOUBLE >= (6.279381369667771::DOUBLE)
                            THEN CASE WHEN (0.21325648672114425::DOUBLE) * x::DOUBLE + (-0.9769962491593069::DOUBLE) * y::DOUBLE >= (-0.8148845756550991::DOUBLE)
                              THEN CASE WHEN (0.6411035893896616::DOUBLE) * x::DOUBLE + (0.7674543554320948::DOUBLE) * y::DOUBLE >= (6.6299617298430755::DOUBLE)
                                THEN CASE WHEN (0.3068945462647796::DOUBLE) * x::DOUBLE + (-0.9517435250491253::DOUBLE) * y::DOUBLE >= (-0.028474705916405885::DOUBLE)
                                  THEN 645
                                  ELSE 639
                                END
                                ELSE CASE WHEN (0.9721470710313321::DOUBLE) * x::DOUBLE + (0.23437165418454955::DOUBLE) * y::DOUBLE >= (7.797362209684056::DOUBLE)
                                  THEN 645
                                  ELSE 620
                                END
                              END
                              ELSE CASE WHEN (0.9939012177567845::DOUBLE) * x::DOUBLE + (0.11027406468241202::DOUBLE) * y::DOUBLE >= (7.632581313410952::DOUBLE)
                                THEN 639
                                ELSE 612
                              END
                            END
                            ELSE CASE WHEN (0.8819024629942541::DOUBLE) * x::DOUBLE + (-0.47143190999832446::DOUBLE) * y::DOUBLE >= (5.085272278412971::DOUBLE)
                              THEN CASE WHEN (0.08543440586112054::DOUBLE) * x::DOUBLE + (0.9963437972382613::DOUBLE) * y::DOUBLE >= (2.627544271731639::DOUBLE)
                                THEN CASE WHEN (0.5958775033485285::DOUBLE) * x::DOUBLE + (-0.803075339556087::DOUBLE) * y::DOUBLE >= (2.6026116905126937::DOUBLE)
                                  THEN CASE WHEN (0.05325438247384866::DOUBLE) * x::DOUBLE + (0.9985809785627447::DOUBLE) * y::DOUBLE >= (2.453532467929975::DOUBLE)
                                    THEN 620
                                    ELSE 615
                                  END
                                  ELSE CASE WHEN (0.9913545234981289::DOUBLE) * x::DOUBLE + (0.1312105511755734::DOUBLE) * y::DOUBLE >= (7.374469441751693::DOUBLE)
                                    THEN 620
                                    ELSE 591
                                  END
                                END
                                ELSE CASE WHEN (0.9985977831999763::DOUBLE) * x::DOUBLE + (0.05293833571329189::DOUBLE) * y::DOUBLE >= (7.198649769967338::DOUBLE)
                                  THEN 615
                                  ELSE 584
                                END
                              END
                              ELSE CASE WHEN (0.8288229446345364::DOUBLE) * x::DOUBLE + (0.5595109708015886::DOUBLE) * y::DOUBLE >= (6.833293716316169::DOUBLE)
                                THEN CASE WHEN (0.5347989140074211::DOUBLE) * x::DOUBLE + (-0.8449793616275388::DOUBLE) * y::DOUBLE >= (1.6825889173489932::DOUBLE)
                                  THEN 591
                                  ELSE 573
                                END
                                ELSE 557
                              END
                            END
                          END
                        END
                        ELSE CASE WHEN (0.993396951349997::DOUBLE) * x::DOUBLE + (0.11472792619293563::DOUBLE) * y::DOUBLE >= (7.871616566489129::DOUBLE)
                          THEN CASE WHEN (0.7747876846470615::DOUBLE) * x::DOUBLE + (-0.6322215147551098::DOUBLE) * y::DOUBLE >= (3.9979670377836642::DOUBLE)
                            THEN CASE WHEN (0.38986243046056845::DOUBLE) * x::DOUBLE + (0.9208731103226865::DOUBLE) * y::DOUBLE >= (5.51338423027279::DOUBLE)
                              THEN CASE WHEN (0.16082418966672618::DOUBLE) * x::DOUBLE + (-0.98698306977275::DOUBLE) * y::DOUBLE >= (-1.5015849373316152::DOUBLE)
                                THEN CASE WHEN (0.44762106723788847::DOUBLE) * x::DOUBLE + (0.8942233390852722::DOUBLE) * y::DOUBLE >= (5.930825490931003::DOUBLE)
                                  THEN 661
                                  ELSE 653
                                END
                                ELSE CASE WHEN (0.8416468431615295::DOUBLE) * x::DOUBLE + (-0.5400283246240256::DOUBLE) * y::DOUBLE >= (4.983709720278435::DOUBLE)
                                  THEN 661
                                  ELSE 649
                                END
                              END
                              ELSE CASE WHEN (0.9788146039482051::DOUBLE) * x::DOUBLE + (0.20474855578909082::DOUBLE) * y::DOUBLE >= (8.020977907970947::DOUBLE)
                                THEN 653
                                ELSE 639
                              END
                            END
                            ELSE CASE WHEN (0.43231783098621424::DOUBLE) * x::DOUBLE + (0.9017212945313952::DOUBLE) * y::DOUBLE >= (6.1082679450762605::DOUBLE)
                              THEN 642
                              ELSE 637
                            END
                          END
                          ELSE CASE WHEN (0.9995120187198154::DOUBLE) * x::DOUBLE + (0.03123658807615464::DOUBLE) * y::DOUBLE >= (7.276309761487723::DOUBLE)
                            THEN CASE WHEN (0.3114440190899003::DOUBLE) * x::DOUBLE + (-0.9502645015852847::DOUBLE) * y::DOUBLE >= (-0.4367477919086955::DOUBLE)
                              THEN CASE WHEN (0.08909441493079588::DOUBLE) * x::DOUBLE + (-0.996023185085638::DOUBLE) * y::DOUBLE >= (-2.060345079621506::DOUBLE)
                                THEN CASE WHEN (0.699105004031051::DOUBLE) * x::DOUBLE + (0.7150190160679255::DOUBLE) * y::DOUBLE >= (7.01193738651624::DOUBLE)
                                  THEN CASE WHEN (0.7031876857106338::DOUBLE) * x::DOUBLE + (-0.71100427471635::DOUBLE) * y::DOUBLE >= (3.366134899798408::DOUBLE)
                                    THEN 639
                                    ELSE 629
                                  END
                                  ELSE CASE WHEN (0.9939012177567845::DOUBLE) * x::DOUBLE + (0.11027406468241202::DOUBLE) * y::DOUBLE >= (7.632581313410952::DOUBLE)
                                    THEN 639
                                    ELSE 612
                                  END
                                END
                                ELSE CASE WHEN (0.8374803404663709::DOUBLE) * x::DOUBLE + (-0.5464674549617128::DOUBLE) * y::DOUBLE >= (4.587614736826488::DOUBLE)
                                  THEN CASE WHEN (0.39432443211032975::DOUBLE) * x::DOUBLE + (0.9189712956566521::DOUBLE) * y::DOUBLE >= (5.526869880499474::DOUBLE)
                                    THEN CASE WHEN (0.2316951958353997::DOUBLE) * x::DOUBLE + (-0.9727884334359633::DOUBLE) * y::DOUBLE >= (-0.930570039824907::DOUBLE)
                                      THEN 639
                                      ELSE 636
                                    END
                                    ELSE CASE WHEN (0.7031876857106338::DOUBLE) * x::DOUBLE + (-0.71100427471635::DOUBLE) * y::DOUBLE >= (3.366134899798408::DOUBLE)
                                      THEN 639
                                      ELSE 629
                                    END
                                  END
                                  ELSE CASE WHEN (0.9942078844842829::DOUBLE) * x::DOUBLE + (0.10747410120250728::DOUBLE) * y::DOUBLE >= (7.610619706314666::DOUBLE)
                                    THEN 636
                                    ELSE 608
                                  END
                                END
                              END
                              ELSE CASE WHEN (0.9942078844842829::DOUBLE) * x::DOUBLE + (0.10747410120250728::DOUBLE) * y::DOUBLE >= (7.610619706314666::DOUBLE)
                                THEN CASE WHEN (0.5635075991861309::DOUBLE) * x::DOUBLE + (-0.8261108797609935::DOUBLE) * y::DOUBLE >= (1.685445245100035::DOUBLE)
                                  THEN CASE WHEN (0.21824190423219067::DOUBLE) * x::DOUBLE + (0.9758947029455112::DOUBLE) * y::DOUBLE >= (4.550180845011627::DOUBLE)
                                    THEN 637
                                    ELSE 636
                                  END
                                  ELSE CASE WHEN (0.9649429072377204::DOUBLE) * x::DOUBLE + (-0.2624598745934629::DOUBLE) * y::DOUBLE >= (6.351420009085343::DOUBLE)
                                    THEN 637
                                    ELSE 622
                                  END
                                END
                                ELSE CASE WHEN (0.5976959986707873::DOUBLE) * x::DOUBLE + (-0.801722828147565::DOUBLE) * y::DOUBLE >= (1.8930101514284603::DOUBLE)
                                  THEN CASE WHEN (0.44653583583404344::DOUBLE) * x::DOUBLE + (0.8947657499681088::DOUBLE) * y::DOUBLE >= (5.9263049204905265::DOUBLE)
                                    THEN 622
                                    ELSE 608
                                  END
                                  ELSE CASE WHEN (0.9646454333823641::DOUBLE) * x::DOUBLE + (0.26355111051663344::DOUBLE) * y::DOUBLE >= (7.759831393841224::DOUBLE)
                                    THEN 622
                                    ELSE 599
                                  END
                                END
                              END
                            END
                            ELSE CASE WHEN (0.608903562880225::DOUBLE) * x::DOUBLE + (0.7932442569043712::DOUBLE) * y::DOUBLE >= (6.275646381997165::DOUBLE)
                              THEN CASE WHEN (0.2751336441653112::DOUBLE) * x::DOUBLE + (0.9614059901250438::DOUBLE) * y::DOUBLE >= (4.7089545465076545::DOUBLE)
                                THEN CASE WHEN (0.5976959986707873::DOUBLE) * x::DOUBLE + (-0.801722828147565::DOUBLE) * y::DOUBLE >= (1.8930101514284603::DOUBLE)
                                  THEN 608
                                  ELSE 599
                                END
                                ELSE CASE WHEN (0.8392432285890982::DOUBLE) * x::DOUBLE + (0.5437561983714272::DOUBLE) * y::DOUBLE >= (7.473460659413437::DOUBLE)
                                  THEN CASE WHEN (0.08909441493079588::DOUBLE) * x::DOUBLE + (-0.996023185085638::DOUBLE) * y::DOUBLE >= (-2.060345079621506::DOUBLE)
                                    THEN 612
                                    ELSE 608
                                  END
                                  ELSE CASE WHEN (0.8364545586090354::DOUBLE) * x::DOUBLE + (-0.5480362865560668::DOUBLE) * y::DOUBLE >= (4.496760499116237::DOUBLE)
                                    THEN 612
                                    ELSE 590
                                  END
                                END
                              END
                              ELSE CASE WHEN (0.5347989140074211::DOUBLE) * x::DOUBLE + (-0.8449793616275388::DOUBLE) * y::DOUBLE >= (1.6825889173489932::DOUBLE)
                                THEN CASE WHEN (0.617923639661389::DOUBLE) * x::DOUBLE + (0.7862381163156758::DOUBLE) * y::DOUBLE >= (6.279381369667771::DOUBLE)
                                  THEN 612
                                  ELSE 591
                                END
                                ELSE CASE WHEN (0.9937937417493655::DOUBLE) * x::DOUBLE + (0.11123847742483363::DOUBLE) * y::DOUBLE >= (7.262403308547954::DOUBLE)
                                  THEN 612
                                  ELSE 573
                                END
                              END
                            END
                          END
                        END
                      END
                      ELSE CASE WHEN (0.9981167153806493::DOUBLE) * x::DOUBLE + (-0.06134347950470281::DOUBLE) * y::DOUBLE >= (6.223075430265212::DOUBLE)
                        THEN CASE WHEN (0.4374657320017908::DOUBLE) * x::DOUBLE + (0.8992350823472899::DOUBLE) * y::DOUBLE >= (5.323584595659212::DOUBLE)
                          THEN CASE WHEN (0.9529379449712433::DOUBLE) * x::DOUBLE + (-0.30316542189699625::DOUBLE) * y::DOUBLE >= (5.517126268801879::DOUBLE)
                            THEN CASE WHEN (0.635949914225394::DOUBLE) * x::DOUBLE + (0.7717303328214553::DOUBLE) * y::DOUBLE >= (6.500762578519139::DOUBLE)
                              THEN CASE WHEN (0.517280899381713::DOUBLE) * x::DOUBLE + (-0.855815675910909::DOUBLE) * y::DOUBLE >= (1.1300508745953608::DOUBLE)
                                THEN CASE WHEN (0.2751336441653112::DOUBLE) * x::DOUBLE + (0.9614059901250438::DOUBLE) * y::DOUBLE >= (4.7089545465076545::DOUBLE)
                                  THEN 599
                                  ELSE 590
                                END
                                ELSE CASE WHEN (0.9597801632265429::DOUBLE) * x::DOUBLE + (0.28075262826344244::DOUBLE) * y::DOUBLE >= (7.515529245548351::DOUBLE)
                                  THEN 599
                                  ELSE 575
                                END
                              END
                              ELSE CASE WHEN (0.5441384337695483::DOUBLE) * x::DOUBLE + (-0.8389954498653868::DOUBLE) * y::DOUBLE >= (1.4501282841153045::DOUBLE)
                                THEN CASE WHEN (0.608903562880225::DOUBLE) * x::DOUBLE + (0.7932442569043712::DOUBLE) * y::DOUBLE >= (6.275646381997165::DOUBLE)
                                  THEN 590
                                  ELSE 573
                                END
                                ELSE CASE WHEN (0.9925059832220787::DOUBLE) * x::DOUBLE + (-0.1221960444055974::DOUBLE) * y::DOUBLE >= (6.427664433222029::DOUBLE)
                                  THEN 590
                                  ELSE 560
                                END
                              END
                            END
                            ELSE CASE WHEN (0.635949914225394::DOUBLE) * x::DOUBLE + (0.7717303328214553::DOUBLE) * y::DOUBLE >= (6.500762578519139::DOUBLE)
                              THEN CASE WHEN (0.7850478312427357::DOUBLE) * x::DOUBLE + (0.619435148067235::DOUBLE) * y::DOUBLE >= (7.0401138483888515::DOUBLE)
                                THEN CASE WHEN (0.6909751973546303::DOUBLE) * x::DOUBLE + (-0.7228784660236669::DOUBLE) * y::DOUBLE >= (2.4318344629551616::DOUBLE)
                                  THEN 575
                                  ELSE 558
                                END
                                ELSE CASE WHEN (0.9988906890926305::DOUBLE) * x::DOUBLE + (-0.047089183939096245::DOUBLE) * y::DOUBLE >= (6.47812132944875::DOUBLE)
                                  THEN 575
                                  ELSE 539
                                END
                              END
                              ELSE CASE WHEN (0.06571954465945563::DOUBLE) * x::DOUBLE + (0.9978381338923431::DOUBLE) * y::DOUBLE >= (3.234649749687506::DOUBLE)
                                THEN CASE WHEN (0.691837821470474::DOUBLE) * x::DOUBLE + (-0.7220529265801701::DOUBLE) * y::DOUBLE >= (2.4431541518000337::DOUBLE)
                                  THEN 560
                                  ELSE 539
                                END
                                ELSE CASE WHEN (0.8932085858240253::DOUBLE) * x::DOUBLE + (0.4496425493769968::DOUBLE) * y::DOUBLE >= (7.044955601463473::DOUBLE)
                                  THEN 560
                                  ELSE 537
                                END
                              END
                            END
                          END
                          ELSE CASE WHEN (0.3450333658597191::DOUBLE) * x::DOUBLE + (-0.9385904199615044::DOUBLE) * y::DOUBLE >= (0.0688173104228662::DOUBLE)
                            THEN CASE WHEN (0.810118933023242::DOUBLE) * x::DOUBLE + (0.5862655664093568::DOUBLE) * y::DOUBLE >= (6.640473203907215::DOUBLE)
                              THEN CASE WHEN (0.03432436542545589::DOUBLE) * x::DOUBLE + (0.9994107453585537::DOUBLE) * y::DOUBLE >= (2.3951172337430844::DOUBLE)
                                THEN CASE WHEN (0.6792678132024136::DOUBLE) * x::DOUBLE + (0.7338904808942619::DOUBLE) * y::DOUBLE >= (6.348851172476277::DOUBLE)
                                  THEN CASE WHEN (0.5347989140074211::DOUBLE) * x::DOUBLE + (-0.8449793616275388::DOUBLE) * y::DOUBLE >= (1.6825889173489932::DOUBLE)
                                    THEN 591
                                    ELSE 573
                                  END
                                  ELSE CASE WHEN (0.9662732067602742::DOUBLE) * x::DOUBLE + (-0.2575191058877312::DOUBLE) * y::DOUBLE >= (5.998090181168455::DOUBLE)
                                    THEN 591
                                    ELSE 559
                                  END
                                END
                                ELSE CASE WHEN (0.8288229446345364::DOUBLE) * x::DOUBLE + (0.5595109708015886::DOUBLE) * y::DOUBLE >= (6.833293716316169::DOUBLE)
                                  THEN 591
                                  ELSE 557
                                END
                              END
                              ELSE CASE WHEN (0.9337814865657255::DOUBLE) * x::DOUBLE + (0.3578437303448305::DOUBLE) * y::DOUBLE >= (6.709792987316927::DOUBLE)
                                THEN CASE WHEN (0.6598055889267163::DOUBLE) * x::DOUBLE + (-0.7514363478173447::DOUBLE) * y::DOUBLE >= (2.7429352309337824::DOUBLE)
                                  THEN 557
                                  ELSE 544
                                END
                                ELSE 522
                              END
                            END
                            ELSE CASE WHEN (0.48266716075828714::DOUBLE) * x::DOUBLE + (0.8758038661284465::DOUBLE) * y::DOUBLE >= (5.2614683773163105::DOUBLE)
                              THEN CASE WHEN (0.6792678132024136::DOUBLE) * x::DOUBLE + (0.7338904808942619::DOUBLE) * y::DOUBLE >= (6.348851172476277::DOUBLE)
                                THEN CASE WHEN (0.8932085858240253::DOUBLE) * x::DOUBLE + (0.4496425493769968::DOUBLE) * y::DOUBLE >= (7.044955601463473::DOUBLE)
                                  THEN CASE WHEN (0.5441384337695483::DOUBLE) * x::DOUBLE + (-0.8389954498653868::DOUBLE) * y::DOUBLE >= (1.4501282841153045::DOUBLE)
                                    THEN 573
                                    ELSE 560
                                  END
                                  ELSE CASE WHEN (0.9529379449712433::DOUBLE) * x::DOUBLE + (-0.30316542189699625::DOUBLE) * y::DOUBLE >= (5.517126268801879::DOUBLE)
                                    THEN 573
                                    ELSE 537
                                  END
                                END
                                ELSE CASE WHEN (0.6189576027156303::DOUBLE) * x::DOUBLE + (-0.7854243986791599::DOUBLE) * y::DOUBLE >= (2.08672329596325::DOUBLE)
                                  THEN 559
                                  ELSE 537
                                END
                              END
                              ELSE CASE WHEN (0.7232153263135064::DOUBLE) * x::DOUBLE + (-0.6906226116955977::DOUBLE) * y::DOUBLE >= (3.018977120550872::DOUBLE)
                                THEN CASE WHEN (0.810118933023242::DOUBLE) * x::DOUBLE + (0.5862655664093568::DOUBLE) * y::DOUBLE >= (6.640473203907215::DOUBLE)
                                  THEN 559
                                  ELSE 544
                                END
                                ELSE CASE WHEN (0.9875560308315617::DOUBLE) * x::DOUBLE + (-0.15726756171636727::DOUBLE) * y::DOUBLE >= (6.005441184787255::DOUBLE)
                                  THEN 559
                                  ELSE 523
                                END
                              END
                            END
                          END
                        END
                        ELSE CASE WHEN (0.8477436221177127::DOUBLE) * x::DOUBLE + (-0.5304062133485437::DOUBLE) * y::DOUBLE >= (3.7705437297535322::DOUBLE)
                          THEN CASE WHEN (0.5383108610526269::DOUBLE) * x::DOUBLE + (0.8427463538175525::DOUBLE) * y::DOUBLE >= (5.328471498865489::DOUBLE)
                            THEN CASE WHEN (0.4673919588371107::DOUBLE) * x::DOUBLE + (-0.8840502003927201::DOUBLE) * y::DOUBLE >= (0.649315013935845::DOUBLE)
                              THEN CASE WHEN (0.48266716075828714::DOUBLE) * x::DOUBLE + (0.8758038661284465::DOUBLE) * y::DOUBLE >= (5.2614683773163105::DOUBLE)
                                THEN 537
                                ELSE CASE WHEN (0.7232153263135064::DOUBLE) * x::DOUBLE + (-0.6906226116955977::DOUBLE) * y::DOUBLE >= (3.018977120550872::DOUBLE)
                                  THEN 544
                                  ELSE 523
                                END
                              END
                              ELSE CASE WHEN (0.9896491836780248::DOUBLE) * x::DOUBLE + (-0.14350781597327417::DOUBLE) * y::DOUBLE >= (5.810817256694362::DOUBLE)
                                THEN CASE WHEN (0.06571954465945563::DOUBLE) * x::DOUBLE + (0.9978381338923431::DOUBLE) * y::DOUBLE >= (3.234649749687506::DOUBLE)
                                  THEN 539
                                  ELSE 537
                                END
                                ELSE CASE WHEN (0.709008490061908::DOUBLE) * x::DOUBLE + (0.7051999440017939::DOUBLE) * y::DOUBLE >= (6.448015833216564::DOUBLE)
                                  THEN 539
                                  ELSE 514
                                END
                              END
                            END
                            ELSE CASE WHEN (0.7098140938114755::DOUBLE) * x::DOUBLE + (0.7043890631083036::DOUBLE) * y::DOUBLE >= (5.828950049677311::DOUBLE)
                              THEN CASE WHEN (0.8927409979985992::DOUBLE) * x::DOUBLE + (-0.4505702059529293::DOUBLE) * y::DOUBLE >= (4.4141017222332035::DOUBLE)
                                THEN CASE WHEN (0.05776649907941635::DOUBLE) * x::DOUBLE + (0.9983301215450266::DOUBLE) * y::DOUBLE >= (2.6118032093555934::DOUBLE)
                                  THEN CASE WHEN (0.7232153263135064::DOUBLE) * x::DOUBLE + (-0.6906226116955977::DOUBLE) * y::DOUBLE >= (3.018977120550872::DOUBLE)
                                    THEN 544
                                    ELSE 523
                                  END
                                  ELSE CASE WHEN (0.9337814865657255::DOUBLE) * x::DOUBLE + (0.3578437303448305::DOUBLE) * y::DOUBLE >= (6.709792987316927::DOUBLE)
                                    THEN 544
                                    ELSE 522
                                  END
                                END
                                ELSE CASE WHEN (0.9780453010110028::DOUBLE) * x::DOUBLE + (0.20839239230427054::DOUBLE) * y::DOUBLE >= (6.425216431878005::DOUBLE)
                                  THEN 523
                                  ELSE 492
                                END
                              END
                              ELSE CASE WHEN (0.5869768680899916::DOUBLE) * x::DOUBLE + (-0.8096037032568864::DOUBLE) * y::DOUBLE >= (1.7818184654235474::DOUBLE)
                                THEN 513
                                ELSE 492
                              END
                            END
                          END
                          ELSE CASE WHEN (0.17986408255832123::DOUBLE) * x::DOUBLE + (-0.9836914718576416::DOUBLE) * y::DOUBLE >= (-1.4037225347191198::DOUBLE)
                            THEN CASE WHEN (0.9439961078109255::DOUBLE) * x::DOUBLE + (-0.3299565856863957::DOUBLE) * y::DOUBLE >= (4.567637524112536::DOUBLE)
                              THEN CASE WHEN (0.663268655825646::DOUBLE) * x::DOUBLE + (0.7483813801794114::DOUBLE) * y::DOUBLE >= (5.381449981467341::DOUBLE)
                                THEN CASE WHEN (0.5383108610526269::DOUBLE) * x::DOUBLE + (0.8427463538175525::DOUBLE) * y::DOUBLE >= (5.328471498865489::DOUBLE)
                                  THEN 514
                                  ELSE 492
                                END
                                ELSE 466
                              END
                              ELSE CASE WHEN (0.505586299414567::DOUBLE) * x::DOUBLE + (0.8627760392154409::DOUBLE) * y::DOUBLE >= (4.73550742810967::DOUBLE)
                                THEN CASE WHEN (0.16801595073848385::DOUBLE) * x::DOUBLE + (-0.9857842767550329::DOUBLE) * y::DOUBLE >= (-1.2413841387892712::DOUBLE)
                                  THEN 466
                                  ELSE 459
                                END
                                ELSE CASE WHEN (0.6663362602912835::DOUBLE) * x::DOUBLE + (-0.7456513851801168::DOUBLE) * y::DOUBLE >= (2.0760589437130337::DOUBLE)
                                  THEN 466
                                  ELSE 443
                                END
                              END
                            END
                            ELSE CASE WHEN (0.9999708390196794::DOUBLE) * x::DOUBLE + (0.007636825929570562::DOUBLE) * y::DOUBLE >= (5.9778182845076335::DOUBLE)
                              THEN CASE WHEN (0.2740450480292917::DOUBLE) * x::DOUBLE + (-0.9617168562787196::DOUBLE) * y::DOUBLE >= (-1.0850937024050924::DOUBLE)
                                THEN CASE WHEN (0.709008490061908::DOUBLE) * x::DOUBLE + (0.7051999440017939::DOUBLE) * y::DOUBLE >= (6.448015833216564::DOUBLE)
                                  THEN 539
                                  ELSE 514
                                END
                                ELSE CASE WHEN (0.7434331018670084::DOUBLE) * x::DOUBLE + (0.6688103042331199::DOUBLE) * y::DOUBLE >= (6.638845434051422::DOUBLE)
                                  THEN CASE WHEN (0.6707789518918593::DOUBLE) * x::DOUBLE + (-0.7416573317232552::DOUBLE) * y::DOUBLE >= (1.9384402045177818::DOUBLE)
                                    THEN 539
                                    ELSE 520
                                  END
                                  ELSE CASE WHEN (0.9971807847026685::DOUBLE) * x::DOUBLE + (-0.07503654189640259::DOUBLE) * y::DOUBLE >= (5.976664747685899::DOUBLE)
                                    THEN 539
                                    ELSE 504
                                  END
                                END
                              END
                              ELSE CASE WHEN (0.3413809130028527::DOUBLE) * x::DOUBLE + (0.9399250354349216::DOUBLE) * y::DOUBLE >= (4.428011487625811::DOUBLE)
                                THEN CASE WHEN (0.5249819716870008::DOUBLE) * x::DOUBLE + (-0.8511133469777272::DOUBLE) * y::DOUBLE >= (0.6143538745749173::DOUBLE)
                                  THEN CASE WHEN (0.5180411049381581::DOUBLE) * x::DOUBLE + (0.8553557234241508::DOUBLE) * y::DOUBLE >= (5.502553149150311::DOUBLE)
                                    THEN 504
                                    ELSE 485
                                  END
                                  ELSE CASE WHEN (0.9706399232611684::DOUBLE) * x::DOUBLE + (0.24053718916532077::DOUBLE) * y::DOUBLE >= (6.375753808203073::DOUBLE)
                                    THEN 504
                                    ELSE 470
                                  END
                                END
                                ELSE CASE WHEN (0.8216665474821532::DOUBLE) * x::DOUBLE + (0.5699684945229505::DOUBLE) * y::DOUBLE >= (6.0925455913690065::DOUBLE)
                                  THEN 485
                                  ELSE 459
                                END
                              END
                            END
                          END
                        END
                      END
                    END
                    ELSE CASE WHEN (0.8572945070464336::DOUBLE) * x::DOUBLE + (-0.5148263087566645::DOUBLE) * y::DOUBLE >= (4.929702757643927::DOUBLE)
                      THEN CASE WHEN (0.5368708046634865::DOUBLE) * x::DOUBLE + (0.8436644706872397::DOUBLE) * y::DOUBLE >= (4.729146711269201::DOUBLE)
                        THEN CASE WHEN (0.9568431664012851::DOUBLE) * x::DOUBLE + (0.2906048088231898::DOUBLE) * y::DOUBLE >= (6.980919927320956::DOUBLE)
                          THEN CASE WHEN (0.554381785454126::DOUBLE) * x::DOUBLE + (-0.8322624802048304::DOUBLE) * y::DOUBLE >= (3.0043394870984006::DOUBLE)
                            THEN CASE WHEN (0.1905595264573963::DOUBLE) * x::DOUBLE + (0.9816756423973921::DOUBLE) * y::DOUBLE >= (2.5595286172281666::DOUBLE)
                              THEN CASE WHEN (0.9961695289235::DOUBLE) * x::DOUBLE + (0.0874429507984045::DOUBLE) * y::DOUBLE >= (7.684192314517738::DOUBLE)
                                THEN CASE WHEN (0.06708962636132511::DOUBLE) * x::DOUBLE + (-0.9977469529067468::DOUBLE) * y::DOUBLE >= (-0.7174902141635923::DOUBLE)
                                  THEN 658
                                  ELSE 655
                                END
                                ELSE CASE WHEN (0.7202900276924256::DOUBLE) * x::DOUBLE + (-0.6936730324921422::DOUBLE) * y::DOUBLE >= (4.624743739053021::DOUBLE)
                                  THEN 658
                                  ELSE 626
                                END
                              END
                              ELSE CASE WHEN (0.6390885720080194::DOUBLE) * x::DOUBLE + (-0.769133146554451::DOUBLE) * y::DOUBLE >= (4.195435443579284::DOUBLE)
                                THEN CASE WHEN (0.397192037536399::DOUBLE) * x::DOUBLE + (0.9177355203530504::DOUBLE) * y::DOUBLE >= (3.778033795007218::DOUBLE)
                                  THEN 658
                                  ELSE 644
                                END
                                ELSE CASE WHEN (0.9874984221055366::DOUBLE) * x::DOUBLE + (0.15762888802207262::DOUBLE) * y::DOUBLE >= (7.611560870930866::DOUBLE)
                                  THEN 658
                                  ELSE 619
                                END
                              END
                            END
                            ELSE CASE WHEN (0.9893930855420081::DOUBLE) * x::DOUBLE + (-0.14526294187322783::DOUBLE) * y::DOUBLE >= (7.12065491359687::DOUBLE)
                              THEN CASE WHEN (0.6050417110747384::DOUBLE) * x::DOUBLE + (0.7961937753209032::DOUBLE) * y::DOUBLE >= (5.838364253198444::DOUBLE)
                                THEN CASE WHEN (0.3674888420933177::DOUBLE) * x::DOUBLE + (-0.930027930191837::DOUBLE) * y::DOUBLE >= (1.3179822649206039::DOUBLE)
                                  THEN 655
                                  ELSE 647
                                END
                                ELSE CASE WHEN (0.9961695289235::DOUBLE) * x::DOUBLE + (0.0874429507984045::DOUBLE) * y::DOUBLE >= (7.684192314517738::DOUBLE)
                                  THEN 655
                                  ELSE 626
                                END
                              END
                              ELSE CASE WHEN (0.9985977831999763::DOUBLE) * x::DOUBLE + (0.05293833571329189::DOUBLE) * y::DOUBLE >= (7.198649769967338::DOUBLE)
                                THEN CASE WHEN (0.48570589496549366::DOUBLE) * x::DOUBLE + (0.8741222932723823::DOUBLE) * y::DOUBLE >= (4.8721557433162825::DOUBLE)
                                  THEN CASE WHEN (0.25909233861710695::DOUBLE) * x::DOUBLE + (-0.9658525560715353::DOUBLE) * y::DOUBLE >= (0.30906425145340655::DOUBLE)
                                    THEN 626
                                    ELSE 615
                                  END
                                  ELSE CASE WHEN (0.9829378698872642::DOUBLE) * x::DOUBLE + (0.18393788065944347::DOUBLE) * y::DOUBLE >= (7.32552282936807::DOUBLE)
                                    THEN 626
                                    ELSE 592
                                  END
                                END
                                ELSE CASE WHEN (0.09900887322368557::DOUBLE) * x::DOUBLE + (-0.9950865505185847::DOUBLE) * y::DOUBLE >= (-0.902631027786694::DOUBLE)
                                  THEN 592
                                  ELSE 584
                                END
                              END
                            END
                          END
                          ELSE CASE WHEN (0.008678937309625075::DOUBLE) * x::DOUBLE + (-0.9999623373143488::DOUBLE) * y::DOUBLE >= (-1.5034828371008873::DOUBLE)
                            THEN CASE WHEN (0.9962999328721998::DOUBLE) * x::DOUBLE + (-0.08594442249995225::DOUBLE) * y::DOUBLE >= (6.636542136520574::DOUBLE)
                              THEN 592
                              ELSE 553
                            END
                            ELSE CASE WHEN (0.7753563816405503::DOUBLE) * x::DOUBLE + (-0.6315239357690833::DOUBLE) * y::DOUBLE >= (4.282533807254978::DOUBLE)
                              THEN 592
                              ELSE 551
                            END
                          END
                        END
                        ELSE CASE WHEN (0.9431009083198599::DOUBLE) * x::DOUBLE + (-0.33250665666457746::DOUBLE) * y::DOUBLE >= (6.18256848212255::DOUBLE)
                          THEN CASE WHEN (0.7150724238920312::DOUBLE) * x::DOUBLE + (-0.6990503762885586::DOUBLE) * y::DOUBLE >= (4.72647763922064::DOUBLE)
                            THEN CASE WHEN (0.9836852437036623::DOUBLE) * x::DOUBLE + (0.1798981415125424::DOUBLE) * y::DOUBLE >= (6.9820740181721375::DOUBLE)
                              THEN CASE WHEN (0.015564811753575374::DOUBLE) * x::DOUBLE + (0.9998788609802067::DOUBLE) * y::DOUBLE >= (0.7124333678318565::DOUBLE)
                                THEN CASE WHEN (0.6390885720080194::DOUBLE) * x::DOUBLE + (-0.769133146554451::DOUBLE) * y::DOUBLE >= (4.195435443579284::DOUBLE)
                                  THEN 644
                                  ELSE 619
                                END
                                ELSE CASE WHEN (0.7789010969381495::DOUBLE) * x::DOUBLE + (0.6271467780261231::DOUBLE) * y::DOUBLE >= (6.050589954604569::DOUBLE)
                                  THEN CASE WHEN (0.8110151386972302::DOUBLE) * x::DOUBLE + (-0.5850251659577668::DOUBLE) * y::DOUBLE >= (6.082502497741167::DOUBLE)
                                    THEN 668
                                    ELSE 644
                                  END
                                  ELSE CASE WHEN (0.9999101148556009::DOUBLE) * x::DOUBLE + (0.013407543006047566::DOUBLE) * y::DOUBLE >= (7.628292827143675::DOUBLE)
                                    THEN 668
                                    ELSE 616
                                  END
                                END
                              END
                              ELSE 576
                            END
                            ELSE CASE WHEN (0.05048164229811487::DOUBLE) * x::DOUBLE + (0.9987249890690054::DOUBLE) * y::DOUBLE >= (0.774483929763905::DOUBLE)
                              THEN CASE WHEN (0.13974168440125445::DOUBLE) * x::DOUBLE + (-0.9901879930804555::DOUBLE) * y::DOUBLE >= (0.09628569371974571::DOUBLE)
                                THEN CASE WHEN (0.8527456911005441::DOUBLE) * x::DOUBLE + (0.5223263216701369::DOUBLE) * y::DOUBLE >= (6.450710939447011::DOUBLE)
                                  THEN 619
                                  ELSE 579
                                END
                                ELSE CASE WHEN (0.9642585244220481::DOUBLE) * x::DOUBLE + (-0.26496320136844376::DOUBLE) * y::DOUBLE >= (6.530112333292962::DOUBLE)
                                  THEN 619
                                  ELSE 572
                                END
                              END
                              ELSE 576
                            END
                          END
                          ELSE CASE WHEN (0.6635401728916721::DOUBLE) * x::DOUBLE + (0.7481406545288726::DOUBLE) * y::DOUBLE >= (4.883272421515533::DOUBLE)
                            THEN CASE WHEN (0.15752742531976532::DOUBLE) * x::DOUBLE + (0.9875146126878963::DOUBLE) * y::DOUBLE >= (2.207472766837987::DOUBLE)
                              THEN CASE WHEN (0.5843410351000996::DOUBLE) * x::DOUBLE + (-0.8115081975544942::DOUBLE) * y::DOUBLE >= (2.90641381212426::DOUBLE)
                                THEN 572
                                ELSE 553
                              END
                              ELSE CASE WHEN (0.970767448439243::DOUBLE) * x::DOUBLE + (0.24002200118064526::DOUBLE) * y::DOUBLE >= (6.703207134180152::DOUBLE)
                                THEN CASE WHEN (0.13974168440125445::DOUBLE) * x::DOUBLE + (-0.9901879930804555::DOUBLE) * y::DOUBLE >= (0.09628569371974571::DOUBLE)
                                  THEN 579
                                  ELSE 572
                                END
                                ELSE CASE WHEN (0.7570653409039875::DOUBLE) * x::DOUBLE + (-0.6533391688869795::DOUBLE) * y::DOUBLE >= (4.515096203724175::DOUBLE)
                                  THEN 579
                                  ELSE 548
                                END
                              END
                            END
                            ELSE CASE WHEN (0.6459946466773964::DOUBLE) * x::DOUBLE + (0.7633419394112614::DOUBLE) * y::DOUBLE >= (4.328582209009643::DOUBLE)
                              THEN CASE WHEN (0.3901373645820853::DOUBLE) * x::DOUBLE + (-0.9207566653339768::DOUBLE) * y::DOUBLE >= (1.9949355326940386::DOUBLE)
                                THEN CASE WHEN (0.7599525165872267::DOUBLE) * x::DOUBLE + (0.6499785939034769::DOUBLE) * y::DOUBLE >= (5.382445934545702::DOUBLE)
                                  THEN 579
                                  ELSE 543
                                END
                                ELSE CASE WHEN (0.9934959855190016::DOUBLE) * x::DOUBLE + (-0.11386714520715754::DOUBLE) * y::DOUBLE >= (6.446409755030339::DOUBLE)
                                  THEN 579
                                  ELSE 525
                                END
                              END
                              ELSE CASE WHEN (0.9988278678683477::DOUBLE) * x::DOUBLE + (0.04840341278846458::DOUBLE) * y::DOUBLE >= (6.1855479125802395::DOUBLE)
                                THEN 543
                                ELSE 494
                              END
                            END
                          END
                        END
                      END
                      ELSE CASE WHEN (0.9048916609940243::DOUBLE) * x::DOUBLE + (0.42564196440609076::DOUBLE) * y::DOUBLE >= (6.020268555894843::DOUBLE)
                        THEN CASE WHEN (0.1969881360128547::DOUBLE) * x::DOUBLE + (0.9804058722132284::DOUBLE) * y::DOUBLE >= (2.930354533622433::DOUBLE)
                          THEN CASE WHEN (0.7098140938114755::DOUBLE) * x::DOUBLE + (0.7043890631083036::DOUBLE) * y::DOUBLE >= (5.828950049677311::DOUBLE)
                            THEN CASE WHEN (0.9337814865657255::DOUBLE) * x::DOUBLE + (0.3578437303448305::DOUBLE) * y::DOUBLE >= (6.709792987316927::DOUBLE)
                              THEN CASE WHEN (0.6598055889267163::DOUBLE) * x::DOUBLE + (-0.7514363478173447::DOUBLE) * y::DOUBLE >= (2.7429352309337824::DOUBLE)
                                THEN CASE WHEN (0.2591797998864251::DOUBLE) * x::DOUBLE + (0.9658290901245585::DOUBLE) * y::DOUBLE >= (3.5095615848821935::DOUBLE)
                                  THEN CASE WHEN (0.8819024629942541::DOUBLE) * x::DOUBLE + (-0.47143190999832446::DOUBLE) * y::DOUBLE >= (5.085272278412971::DOUBLE)
                                    THEN 584
                                    ELSE 557
                                  END
                                  ELSE CASE WHEN (0.9568431664012851::DOUBLE) * x::DOUBLE + (0.2906048088231898::DOUBLE) * y::DOUBLE >= (6.980919927320956::DOUBLE)
                                    THEN 584
                                    ELSE 551
                                  END
                                END
                                ELSE 544
                              END
                              ELSE CASE WHEN (0.24239919819961592::DOUBLE) * x::DOUBLE + (0.9701765966627844::DOUBLE) * y::DOUBLE >= (3.3608737538097584::DOUBLE)
                                THEN CASE WHEN (0.6160364009930605::DOUBLE) * x::DOUBLE + (-0.7877176858821423::DOUBLE) * y::DOUBLE >= (2.4348260897564318::DOUBLE)
                                  THEN CASE WHEN (0.2591797998864251::DOUBLE) * x::DOUBLE + (0.9658290901245585::DOUBLE) * y::DOUBLE >= (3.5095615848821935::DOUBLE)
                                    THEN 557
                                    ELSE 551
                                  END
                                  ELSE CASE WHEN (0.9615736448510076::DOUBLE) * x::DOUBLE + (-0.27454712806355924::DOUBLE) * y::DOUBLE >= (5.630073854581018::DOUBLE)
                                    THEN 557
                                    ELSE 522
                                  END
                                END
                                ELSE CASE WHEN (0.9998891940900875::DOUBLE) * x::DOUBLE + (0.014886219865205594::DOUBLE) * y::DOUBLE >= (6.37975019650163::DOUBLE)
                                  THEN 551
                                  ELSE 517
                                END
                              END
                            END
                            ELSE CASE WHEN (0.9484812636694915::DOUBLE) * x::DOUBLE + (-0.3168332250063504::DOUBLE) * y::DOUBLE >= (5.121120653123252::DOUBLE)
                              THEN CASE WHEN (0.14593381919920476::DOUBLE) * x::DOUBLE + (-0.9892943547872562::DOUBLE) * y::DOUBLE >= (-0.9315592627300937::DOUBLE)
                                THEN CASE WHEN (0.9998891940900875::DOUBLE) * x::DOUBLE + (0.014886219865205594::DOUBLE) * y::DOUBLE >= (6.37975019650163::DOUBLE)
                                  THEN 551
                                  ELSE 517
                                END
                                ELSE 513
                              END
                              ELSE CASE WHEN (0.9076545471521532::DOUBLE) * x::DOUBLE + (-0.4197180280069223::DOUBLE) * y::DOUBLE >= (4.374956785710873::DOUBLE)
                                THEN CASE WHEN (0.08569988047618243::DOUBLE) * x::DOUBLE + (0.9963209977142748::DOUBLE) * y::DOUBLE >= (2.557901831722854::DOUBLE)
                                  THEN CASE WHEN (0.5869768680899916::DOUBLE) * x::DOUBLE + (-0.8096037032568864::DOUBLE) * y::DOUBLE >= (1.7818184654235474::DOUBLE)
                                    THEN 513
                                    ELSE 492
                                  END
                                  ELSE CASE WHEN (0.872374368725442::DOUBLE) * x::DOUBLE + (0.48883837900771077::DOUBLE) * y::DOUBLE >= (6.13664089528109::DOUBLE)
                                    THEN 513
                                    ELSE 488
                                  END
                                END
                                ELSE CASE WHEN (0.663268655825646::DOUBLE) * x::DOUBLE + (0.7483813801794114::DOUBLE) * y::DOUBLE >= (5.381449981467341::DOUBLE)
                                  THEN 492
                                  ELSE 466
                                END
                              END
                            END
                          END
                          ELSE CASE WHEN (0.15752742531976532::DOUBLE) * x::DOUBLE + (0.9875146126878963::DOUBLE) * y::DOUBLE >= (2.207472766837987::DOUBLE)
                            THEN CASE WHEN (0.9989048873608056::DOUBLE) * x::DOUBLE + (0.046787028188337146::DOUBLE) * y::DOUBLE >= (6.390654819341117::DOUBLE)
                              THEN CASE WHEN (0.9998891940900875::DOUBLE) * x::DOUBLE + (0.014886219865205594::DOUBLE) * y::DOUBLE >= (6.37975019650163::DOUBLE)
                                THEN CASE WHEN (0.008678937309625075::DOUBLE) * x::DOUBLE + (-0.9999623373143488::DOUBLE) * y::DOUBLE >= (-1.5034828371008873::DOUBLE)
                                  THEN 553
                                  ELSE 551
                                END
                                ELSE CASE WHEN (0.7975968428665811::DOUBLE) * x::DOUBLE + (-0.6031909119418679::DOUBLE) * y::DOUBLE >= (4.130320351251819::DOUBLE)
                                  THEN 553
                                  ELSE 517
                                END
                              END
                              ELSE CASE WHEN (0.5252682216126655::DOUBLE) * x::DOUBLE + (-0.850936716427178::DOUBLE) * y::DOUBLE >= (1.7721440374618014::DOUBLE)
                                THEN CASE WHEN (0.14058431922552875::DOUBLE) * x::DOUBLE + (0.9900687093267289::DOUBLE) * y::DOUBLE >= (2.392463011329303::DOUBLE)
                                  THEN 517
                                  ELSE 512
                                END
                                ELSE CASE WHEN (0.9484812636694915::DOUBLE) * x::DOUBLE + (-0.3168332250063504::DOUBLE) * y::DOUBLE >= (5.121120653123252::DOUBLE)
                                  THEN 517
                                  ELSE 488
                                END
                              END
                            END
                            ELSE CASE WHEN (0.08776403288688772::DOUBLE) * x::DOUBLE + (0.9961412924537508::DOUBLE) * y::DOUBLE >= (1.7101488763894828::DOUBLE)
                              THEN CASE WHEN (0.7087161417452156::DOUBLE) * x::DOUBLE + (-0.705493749391003::DOUBLE) * y::DOUBLE >= (3.6299863998736766::DOUBLE)
                                THEN 548
                                ELSE 512
                              END
                              ELSE CASE WHEN (0.6533721242931326::DOUBLE) * x::DOUBLE + (-0.7570368994947864::DOUBLE) * y::DOUBLE >= (3.3814091623938345::DOUBLE)
                                THEN CASE WHEN (0.6635401728916721::DOUBLE) * x::DOUBLE + (0.7481406545288726::DOUBLE) * y::DOUBLE >= (4.883272421515533::DOUBLE)
                                  THEN 548
                                  ELSE 525
                                END
                                ELSE CASE WHEN (0.9999463229048534::DOUBLE) * x::DOUBLE + (0.01036104768170371::DOUBLE) * y::DOUBLE >= (6.2918176955600895::DOUBLE)
                                  THEN 548
                                  ELSE 507
                                END
                              END
                            END
                          END
                        END
                        ELSE CASE WHEN (0.10091092207006078::DOUBLE) * x::DOUBLE + (-0.9948954647634947::DOUBLE) * y::DOUBLE >= (-0.6181784406550636::DOUBLE)
                          THEN CASE WHEN (0.9638369877116238::DOUBLE) * x::DOUBLE + (0.26649251606561675::DOUBLE) * y::DOUBLE >= (5.512610082467088::DOUBLE)
                            THEN CASE WHEN (0.7262735787780418::DOUBLE) * x::DOUBLE + (-0.6874057671920825::DOUBLE) * y::DOUBLE >= (3.2498131189152977::DOUBLE)
                              THEN CASE WHEN (0.29463270622229476::DOUBLE) * x::DOUBLE + (-0.955610573625118::DOUBLE) * y::DOUBLE >= (1.1325465608349479::DOUBLE)
                                THEN CASE WHEN (0.6459946466773964::DOUBLE) * x::DOUBLE + (0.7633419394112614::DOUBLE) * y::DOUBLE >= (4.328582209009643::DOUBLE)
                                  THEN 525
                                  ELSE 494
                                END
                                ELSE CASE WHEN (0.9547530578034388::DOUBLE) * x::DOUBLE + (-0.2973997286733525::DOUBLE) * y::DOUBLE >= (5.477133870781656::DOUBLE)
                                  THEN CASE WHEN (0.6533721242931326::DOUBLE) * x::DOUBLE + (-0.7570368994947864::DOUBLE) * y::DOUBLE >= (3.3814091623938345::DOUBLE)
                                    THEN 525
                                    ELSE 507
                                  END
                                  ELSE CASE WHEN (0.9826335049831144::DOUBLE) * x::DOUBLE + (0.18555698554514072::DOUBLE) * y::DOUBLE >= (5.962866274842594::DOUBLE)
                                    THEN CASE WHEN (0.08776403288688772::DOUBLE) * x::DOUBLE + (0.9961412924537508::DOUBLE) * y::DOUBLE >= (1.7101488763894828::DOUBLE)
                                      THEN 512
                                      ELSE 507
                                    END
                                    ELSE CASE WHEN (0.6435496777708534::DOUBLE) * x::DOUBLE + (0.7654043455854107::DOUBLE) * y::DOUBLE >= (4.679250788043096::DOUBLE)
                                      THEN 512
                                      ELSE 481
                                    END
                                  END
                                END
                              END
                              ELSE 442
                            END
                            ELSE CASE WHEN (0.007750050516871061::DOUBLE) * x::DOUBLE + (0.9999699679075297::DOUBLE) * y::DOUBLE >= (0.5745776924158381::DOUBLE)
                              THEN CASE WHEN (0.12716150564434472::DOUBLE) * x::DOUBLE + (0.9918820249819348::DOUBLE) * y::DOUBLE >= (1.7010912806637248::DOUBLE)
                                THEN 442
                                ELSE CASE WHEN (0.7945865108165894::DOUBLE) * x::DOUBLE + (-0.607150950611393::DOUBLE) * y::DOUBLE >= (4.1040194781831705::DOUBLE)
                                  THEN 494
                                  ELSE 436
                                END
                              END
                              ELSE CASE WHEN (0.9916266188633367::DOUBLE) * x::DOUBLE + (0.12913809957431918::DOUBLE) * y::DOUBLE >= (4.992473729073942::DOUBLE)
                                THEN CASE WHEN (0.9996633031782342::DOUBLE) * x::DOUBLE + (0.025947644956373292::DOUBLE) * y::DOUBLE >= (5.58294962771987::DOUBLE)
                                  THEN 494
                                  ELSE 435
                                END
                                ELSE 385
                              END
                            END
                          END
                          ELSE CASE WHEN (0.8991559394408963::DOUBLE) * x::DOUBLE + (-0.4376283772427914::DOUBLE) * y::DOUBLE >= (4.175454381320937::DOUBLE)
                            THEN CASE WHEN (0.8627958750485613::DOUBLE) * x::DOUBLE + (0.5055524483168757::DOUBLE) * y::DOUBLE >= (5.433280767978873::DOUBLE)
                              THEN CASE WHEN (0.21026735750388614::DOUBLE) * x::DOUBLE + (-0.9776439220740509::DOUBLE) * y::DOUBLE >= (-0.49797600362681504::DOUBLE)
                                THEN CASE WHEN (0.45934114328189235::DOUBLE) * x::DOUBLE + (0.888259936104564::DOUBLE) * y::DOUBLE >= (4.103668209472393::DOUBLE)
                                  THEN CASE WHEN (0.5252682216126655::DOUBLE) * x::DOUBLE + (-0.850936716427178::DOUBLE) * y::DOUBLE >= (1.7721440374618014::DOUBLE)
                                    THEN 512
                                    ELSE 488
                                  END
                                  ELSE CASE WHEN (0.975423805478689::DOUBLE) * x::DOUBLE + (-0.2203370139251976::DOUBLE) * y::DOUBLE >= (5.418420719451984::DOUBLE)
                                    THEN 512
                                    ELSE 474
                                  END
                                END
                                ELSE CASE WHEN (0.9076545471521532::DOUBLE) * x::DOUBLE + (-0.4197180280069223::DOUBLE) * y::DOUBLE >= (4.374956785710873::DOUBLE)
                                  THEN 488
                                  ELSE 466
                                END
                              END
                              ELSE 442
                            END
                            ELSE CASE WHEN (0.04339158901437196::DOUBLE) * x::DOUBLE + (-0.9990581414526424::DOUBLE) * y::DOUBLE >= (-1.6256204033086845::DOUBLE)
                              THEN CASE WHEN (0.3022664983835791::DOUBLE) * x::DOUBLE + (-0.9532234596121362::DOUBLE) * y::DOUBLE >= (0.16100069820360585::DOUBLE)
                                THEN 442
                                ELSE CASE WHEN (0.837374061389525::DOUBLE) * x::DOUBLE + (0.5466302967381262::DOUBLE) * y::DOUBLE >= (5.495835880657506::DOUBLE)
                                  THEN 466
                                  ELSE 426
                                END
                              END
                              ELSE CASE WHEN (0.5879017150706682::DOUBLE) * x::DOUBLE + (0.8089323664046127::DOUBLE) * y::DOUBLE >= (4.784633302879329::DOUBLE)
                                THEN CASE WHEN (0.6663362602912835::DOUBLE) * x::DOUBLE + (-0.7456513851801168::DOUBLE) * y::DOUBLE >= (2.0760589437130337::DOUBLE)
                                  THEN 466
                                  ELSE 443
                                END
                                ELSE CASE WHEN (0.9923544663970403::DOUBLE) * x::DOUBLE + (-0.12342047245836231::DOUBLE) * y::DOUBLE >= (5.07892507418698::DOUBLE)
                                  THEN 466
                                  ELSE 425
                                END
                              END
                            END
                          END
                        END
                      END
                    END
                  END
                END
                ELSE CASE WHEN (0.12472442807742222::DOUBLE) * x::DOUBLE + (0.9921914215718457::DOUBLE) * y::DOUBLE >= (4.905149547087231::DOUBLE)
                  THEN CASE WHEN (0.3267164144010009::DOUBLE) * x::DOUBLE + (-0.9451224177644679::DOUBLE) * y::DOUBLE >= (-2.4392233190984642::DOUBLE)
                    THEN CASE WHEN (0.9998460308469205::DOUBLE) * x::DOUBLE + (0.017547495538081156::DOUBLE) * y::DOUBLE >= (7.110348354469221::DOUBLE)
                      THEN CASE WHEN (0.9880617026027309::DOUBLE) * x::DOUBLE + (0.1540586636635299::DOUBLE) * y::DOUBLE >= (8.482660991073406::DOUBLE)
                        THEN CASE WHEN (0.7051875615432063::DOUBLE) * x::DOUBLE + (-0.7090208057911607::DOUBLE) * y::DOUBLE >= (2.533080376518587::DOUBLE)
                          THEN CASE WHEN (0.29534529738857973::DOUBLE) * x::DOUBLE + (0.9553905773611395::DOUBLE) * y::DOUBLE >= (6.450648317548575::DOUBLE)
                            THEN CASE WHEN (0.15216502784641223::DOUBLE) * x::DOUBLE + (0.9883551003058064::DOUBLE) * y::DOUBLE >= (5.5616235097188795::DOUBLE)
                              THEN CASE WHEN (0.9415726223764468::DOUBLE) * x::DOUBLE + (-0.336810030716339::DOUBLE) * y::DOUBLE >= (6.375432400107638::DOUBLE)
                                THEN CASE WHEN (0.1023672783402433::DOUBLE) * x::DOUBLE + (0.9947466714320843::DOUBLE) * y::DOUBLE >= (5.497959211701245::DOUBLE)
                                  THEN 722
                                  ELSE 717
                                END
                                ELSE CASE WHEN (0.7151063379026018::DOUBLE) * x::DOUBLE + (0.699015683294395::DOUBLE) * y::DOUBLE >= (9.290229184282907::DOUBLE)
                                  THEN 722
                                  ELSE 692
                                END
                              END
                              ELSE CASE WHEN (0.839845681199146::DOUBLE) * x::DOUBLE + (0.5428252313324633::DOUBLE) * y::DOUBLE >= (9.350865266283396::DOUBLE)
                                THEN CASE WHEN (0.39269632351223105::DOUBLE) * x::DOUBLE + (-0.9196681996785456::DOUBLE) * y::DOUBLE >= (-0.5572516542803427::DOUBLE)
                                  THEN 727
                                  ELSE 717
                                END
                                ELSE CASE WHEN (0.9874298243946278::DOUBLE) * x::DOUBLE + (-0.1580580333168633::DOUBLE) * y::DOUBLE >= (7.64910584921801::DOUBLE)
                                  THEN 727
                                  ELSE 688
                                END
                              END
                            END
                            ELSE CASE WHEN (0.9874298243946278::DOUBLE) * x::DOUBLE + (-0.1580580333168633::DOUBLE) * y::DOUBLE >= (7.64910584921801::DOUBLE)
                              THEN CASE WHEN (0.3706293854635804::DOUBLE) * x::DOUBLE + (0.9287808453186837::DOUBLE) * y::DOUBLE >= (6.864209323191373::DOUBLE)
                                THEN CASE WHEN (0.5531130918990248::DOUBLE) * x::DOUBLE + (-0.8331061802494931::DOUBLE) * y::DOUBLE >= (1.5703321499677667::DOUBLE)
                                  THEN 747
                                  ELSE 727
                                END
                                ELSE CASE WHEN (0.9921645335478686::DOUBLE) * x::DOUBLE + (-0.12493813817141727::DOUBLE) * y::DOUBLE >= (8.169341661853013::DOUBLE)
                                  THEN 747
                                  ELSE 719
                                END
                              END
                              ELSE CASE WHEN (0.45649173439019386::DOUBLE) * x::DOUBLE + (0.8897276529553484::DOUBLE) * y::DOUBLE >= (7.322375475476182::DOUBLE)
                                THEN CASE WHEN (0.670088261411494::DOUBLE) * x::DOUBLE + (-0.7422814304012468::DOUBLE) * y::DOUBLE >= (2.624584253140022::DOUBLE)
                                  THEN 719
                                  ELSE 688
                                END
                                ELSE CASE WHEN (0.9614652595528793::DOUBLE) * x::DOUBLE + (-0.2749264532068796::DOUBLE) * y::DOUBLE >= (6.899611341474761::DOUBLE)
                                  THEN 719
                                  ELSE 676
                                END
                              END
                            END
                          END
                          ELSE CASE WHEN (0.9804449032302176::DOUBLE) * x::DOUBLE + (-0.1967937797032448::DOUBLE) * y::DOUBLE >= (6.857363412608883::DOUBLE)
                            THEN CASE WHEN (0.7151063379026018::DOUBLE) * x::DOUBLE + (0.699015683294395::DOUBLE) * y::DOUBLE >= (9.290229184282907::DOUBLE)
                              THEN CASE WHEN (0.34526239421888366::DOUBLE) * x::DOUBLE + (0.9385061955779749::DOUBLE) * y::DOUBLE >= (7.636926306714868::DOUBLE)
                                THEN CASE WHEN (0.5214933412154924::DOUBLE) * x::DOUBLE + (-0.8532553516198429::DOUBLE) * y::DOUBLE >= (0.062185754153525785::DOUBLE)
                                  THEN 722
                                  ELSE 699
                                END
                                ELSE CASE WHEN (0.9935774726402693::DOUBLE) * x::DOUBLE + (-0.11315390343145344::DOUBLE) * y::DOUBLE >= (7.760201319701642::DOUBLE)
                                  THEN 722
                                  ELSE 687
                                END
                              END
                              ELSE CASE WHEN (0.6996172199489418::DOUBLE) * x::DOUBLE + (0.714517841310428::DOUBLE) * y::DOUBLE >= (8.974574656254834::DOUBLE)
                                THEN CASE WHEN (0.14639153036539373::DOUBLE) * x::DOUBLE + (-0.9892267282262839::DOUBLE) * y::DOUBLE >= (-3.4735524921284933::DOUBLE)
                                  THEN 692
                                  ELSE 687
                                END
                                ELSE CASE WHEN (0.9981954184939758::DOUBLE) * x::DOUBLE + (-0.060049200641112535::DOUBLE) * y::DOUBLE >= (7.731604453317601::DOUBLE)
                                  THEN 692
                                  ELSE 657
                                END
                              END
                            END
                            ELSE CASE WHEN (0.8546086714091099::DOUBLE) * x::DOUBLE + (-0.5192725861745024::DOUBLE) * y::DOUBLE >= (4.076439889852235::DOUBLE)
                              THEN CASE WHEN (0.011786749069529751::DOUBLE) * x::DOUBLE + (-0.9999305338604136::DOUBLE) * y::DOUBLE >= (-4.67976563573678::DOUBLE)
                                THEN 657
                                ELSE CASE WHEN (0.8480405857523923::DOUBLE) * x::DOUBLE + (0.5299312832025861::DOUBLE) * y::DOUBLE >= (9.559245509842386::DOUBLE)
                                  THEN 699
                                  ELSE 656
                                END
                              END
                              ELSE CASE WHEN (0.5895792632724454::DOUBLE) * x::DOUBLE + (-0.8077105250763547::DOUBLE) * y::DOUBLE >= (0.40088142874229327::DOUBLE)
                                THEN CASE WHEN (0.05594104890484148::DOUBLE) * x::DOUBLE + (0.99843407346075::DOUBLE) * y::DOUBLE >= (5.713504721557883::DOUBLE)
                                  THEN 662
                                  ELSE 656
                                END
                                ELSE CASE WHEN (0.6115233119456082::DOUBLE) * x::DOUBLE + (0.7912264144649586::DOUBLE) * y::DOUBLE >= (9.015538235129352::DOUBLE)
                                  THEN 662
                                  ELSE 643
                                END
                              END
                            END
                          END
                        END
                        ELSE CASE WHEN (0.25458954934053823::DOUBLE) * x::DOUBLE + (0.9670492031776778::DOUBLE) * y::DOUBLE >= (6.172717140125574::DOUBLE)
                          THEN CASE WHEN (0.9526884151322746::DOUBLE) * x::DOUBLE + (0.30394865302013524::DOUBLE) * y::DOUBLE >= (8.640484382899373::DOUBLE)
                            THEN CASE WHEN (0.6128702030710028::DOUBLE) * x::DOUBLE + (0.7901835952408198::DOUBLE) * y::DOUBLE >= (8.650062162939403::DOUBLE)
                              THEN CASE WHEN (0.5895792632724454::DOUBLE) * x::DOUBLE + (-0.8077105250763547::DOUBLE) * y::DOUBLE >= (0.40088142874229327::DOUBLE)
                                THEN 656
                                ELSE 643
                              END
                              ELSE CASE WHEN (0.9998463123228859::DOUBLE) * x::DOUBLE + (-0.017531449863779025::DOUBLE) * y::DOUBLE >= (7.510990330789293::DOUBLE)
                                THEN CASE WHEN (0.011786749069529751::DOUBLE) * x::DOUBLE + (-0.9999305338604136::DOUBLE) * y::DOUBLE >= (-4.67976563573678::DOUBLE)
                                  THEN 657
                                  ELSE 656
                                END
                                ELSE CASE WHEN (0.6964123130498334::DOUBLE) * x::DOUBLE + (-0.717641895538841::DOUBLE) * y::DOUBLE >= (1.8669082739807168::DOUBLE)
                                  THEN 657
                                  ELSE 627
                                END
                              END
                            END
                            ELSE CASE WHEN (0.7255280995067264::DOUBLE) * x::DOUBLE + (-0.6881925434252814::DOUBLE) * y::DOUBLE >= (1.7835267333350275::DOUBLE)
                              THEN CASE WHEN (0.5445875159689246::DOUBLE) * x::DOUBLE + (0.8387040225555118::DOUBLE) * y::DOUBLE >= (7.763995408708196::DOUBLE)
                                THEN CASE WHEN (0.502290509831467::DOUBLE) * x::DOUBLE + (0.8646989324228664::DOUBLE) * y::DOUBLE >= (7.8849430776469775::DOUBLE)
                                  THEN CASE WHEN (0.11469853930860438::DOUBLE) * x::DOUBLE + (-0.9934003448159623::DOUBLE) * y::DOUBLE >= (-3.8358519646377993::DOUBLE)
                                    THEN 635
                                    ELSE 627
                                  END
                                  ELSE CASE WHEN (0.5729518871733407::DOUBLE) * x::DOUBLE + (-0.8195890036991147::DOUBLE) * y::DOUBLE >= (0.44660139061988335::DOUBLE)
                                    THEN 635
                                    ELSE 613
                                  END
                                END
                                ELSE CASE WHEN (0.9956578294302284::DOUBLE) * x::DOUBLE + (-0.09308859594110327::DOUBLE) * y::DOUBLE >= (6.815525591802075::DOUBLE)
                                  THEN 635
                                  ELSE 598
                                END
                              END
                              ELSE CASE WHEN (0.99720140631417::DOUBLE) * x::DOUBLE + (-0.07476199064392151::DOUBLE) * y::DOUBLE >= (6.770922878679356::DOUBLE)
                                THEN 627
                                ELSE 583
                              END
                            END
                          END
                          ELSE CASE WHEN (0.910802221328023::DOUBLE) * x::DOUBLE + (-0.4128429648473363::DOUBLE) * y::DOUBLE >= (4.957615849730047::DOUBLE)
                            THEN CASE WHEN (0.9949672122636488::DOUBLE) * x::DOUBLE + (0.10020103053513565::DOUBLE) * y::DOUBLE >= (7.933665748903958::DOUBLE)
                              THEN CASE WHEN (0.6152600423443516::DOUBLE) * x::DOUBLE + (-0.7883242228261331::DOUBLE) * y::DOUBLE >= (1.2855420900774734::DOUBLE)
                                THEN CASE WHEN (0.8828555673079497::DOUBLE) * x::DOUBLE + (-0.4696445967679798::DOUBLE) * y::DOUBLE >= (5.054456705777069::DOUBLE)
                                  THEN 676
                                  ELSE 651
                                END
                                ELSE 635
                              END
                              ELSE CASE WHEN (0.3583755539944281::DOUBLE) * x::DOUBLE + (0.9335775073871407::DOUBLE) * y::DOUBLE >= (6.382866957448853::DOUBLE)
                                THEN CASE WHEN (0.10016052103345251::DOUBLE) * x::DOUBLE + (0.9949712910563336::DOUBLE) * y::DOUBLE >= (4.992180505076278::DOUBLE)
                                  THEN 635
                                  ELSE 632
                                END
                                ELSE 625
                              END
                            END
                            ELSE CASE WHEN (0.4763718244307558::DOUBLE) * x::DOUBLE + (0.8792439279793254::DOUBLE) * y::DOUBLE >= (7.164275626806114::DOUBLE)
                              THEN CASE WHEN (0.45852534917036425::DOUBLE) * x::DOUBLE + (-0.8886813288058861::DOUBLE) * y::DOUBLE >= (-0.5726127277347981::DOUBLE)
                                THEN CASE WHEN (0.6717511598172743::DOUBLE) * x::DOUBLE + (0.7407768755058077::DOUBLE) * y::DOUBLE >= (8.124337007288636::DOUBLE)
                                  THEN 635
                                  ELSE 611
                                END
                                ELSE CASE WHEN (0.9956578294302284::DOUBLE) * x::DOUBLE + (-0.09308859594110327::DOUBLE) * y::DOUBLE >= (6.815525591802075::DOUBLE)
                                  THEN 635
                                  ELSE 598
                                END
                              END
                              ELSE CASE WHEN (0.7341859720233519::DOUBLE) * x::DOUBLE + (-0.678948421077865::DOUBLE) * y::DOUBLE >= (2.3357003212320437::DOUBLE)
                                THEN CASE WHEN (0.7218057727024908::DOUBLE) * x::DOUBLE + (0.6920956772682231::DOUBLE) * y::DOUBLE >= (8.028727217324482::DOUBLE)
                                  THEN CASE WHEN (0.4147797229916829::DOUBLE) * x::DOUBLE + (-0.9099218545539737::DOUBLE) * y::DOUBLE >= (-0.6616351715621445::DOUBLE)
                                    THEN 625
                                    ELSE 611
                                  END
                                  ELSE CASE WHEN (0.8271069892910344::DOUBLE) * x::DOUBLE + (-0.5620445073710094::DOUBLE) * y::DOUBLE >= (3.7331895964249986::DOUBLE)
                                    THEN 625
                                    ELSE 603
                                  END
                                END
                                ELSE CASE WHEN (0.988126192849973::DOUBLE) * x::DOUBLE + (-0.1536444825036607::DOUBLE) * y::DOUBLE >= (6.348517116033124::DOUBLE)
                                  THEN 611
                                  ELSE 582
                                END
                              END
                            END
                          END
                        END
                      END
                      ELSE CASE WHEN (0.2831033041614744::DOUBLE) * x::DOUBLE + (-0.9590894218856008::DOUBLE) * y::DOUBLE >= (-2.376457225351336::DOUBLE)
                        THEN CASE WHEN (0.9101159633505452::DOUBLE) * x::DOUBLE + (0.4143536330895493::DOUBLE) * y::DOUBLE >= (7.726303409520803::DOUBLE)
                          THEN CASE WHEN (0.9997360625419587::DOUBLE) * x::DOUBLE + (-0.022974012559862204::DOUBLE) * y::DOUBLE >= (6.72152896641691::DOUBLE)
                            THEN CASE WHEN (0.00767019045102518::DOUBLE) * x::DOUBLE + (0.9999705836565618::DOUBLE) * y::DOUBLE >= (4.315159582139904::DOUBLE)
                              THEN CASE WHEN (0.5680637539367669::DOUBLE) * x::DOUBLE + (-0.8229845511692602::DOUBLE) * y::DOUBLE >= (0.3048819499190545::DOUBLE)
                                THEN CASE WHEN (0.4763718244307558::DOUBLE) * x::DOUBLE + (0.8792439279793254::DOUBLE) * y::DOUBLE >= (7.164275626806114::DOUBLE)
                                  THEN 598
                                  ELSE 582
                                END
                                ELSE CASE WHEN (0.9997548581970082::DOUBLE) * x::DOUBLE + (-0.022140991655300146::DOUBLE) * y::DOUBLE >= (6.815097442661197::DOUBLE)
                                  THEN 598
                                  ELSE 570
                                END
                              END
                              ELSE CASE WHEN (0.6911094109237497::DOUBLE) * x::DOUBLE + (0.722750151942307::DOUBLE) * y::DOUBLE >= (7.721681596644692::DOUBLE)
                                THEN CASE WHEN (0.16613883316107944::DOUBLE) * x::DOUBLE + (-0.9861023720262896::DOUBLE) * y::DOUBLE >= (-2.905312656060187::DOUBLE)
                                  THEN CASE WHEN (0.8881042250820983::DOUBLE) * x::DOUBLE + (0.45964212752023254::DOUBLE) * y::DOUBLE >= (8.109116482089718::DOUBLE)
                                    THEN 603
                                    ELSE 589
                                  END
                                  ELSE CASE WHEN (0.7341859720233519::DOUBLE) * x::DOUBLE + (-0.678948421077865::DOUBLE) * y::DOUBLE >= (2.3357003212320437::DOUBLE)
                                    THEN 603
                                    ELSE 582
                                  END
                                END
                                ELSE CASE WHEN (0.9862914792211934::DOUBLE) * x::DOUBLE + (-0.16501247836351737::DOUBLE) * y::DOUBLE >= (6.107851228701677::DOUBLE)
                                  THEN 589
                                  ELSE 569
                                END
                              END
                            END
                            ELSE CASE WHEN (0.4896899261660755::DOUBLE) * x::DOUBLE + (0.8718966545476956::DOUBLE) * y::DOUBLE >= (6.979041268195715::DOUBLE)
                              THEN CASE WHEN (0.6150118905631101::DOUBLE) * x::DOUBLE + (-0.7885178339555733::DOUBLE) * y::DOUBLE >= (0.668588721144626::DOUBLE)
                                THEN CASE WHEN (0.22225405004907522::DOUBLE) * x::DOUBLE + (0.9749887882620925::DOUBLE) * y::DOUBLE >= (5.747033892155093::DOUBLE)
                                  THEN 570
                                  ELSE 563
                                END
                                ELSE CASE WHEN (0.9469029462899402::DOUBLE) * x::DOUBLE + (0.32151953332174193::DOUBLE) * y::DOUBLE >= (7.7391351027422255::DOUBLE)
                                  THEN 570
                                  ELSE 552
                                END
                              END
                              ELSE CASE WHEN (0.9899243422092334::DOUBLE) * x::DOUBLE + (-0.14159730471169446::DOUBLE) * y::DOUBLE >= (5.923215921589239::DOUBLE)
                                THEN CASE WHEN (0.4629584017574461::DOUBLE) * x::DOUBLE + (0.8863800078082713::DOUBLE) * y::DOUBLE >= (6.739704037831279::DOUBLE)
                                  THEN CASE WHEN (0.26722339223521874::DOUBLE) * x::DOUBLE + (-0.9636346084706083::DOUBLE) * y::DOUBLE >= (-2.189706169491897::DOUBLE)
                                    THEN 569
                                    ELSE 563
                                  END
                                  ELSE CASE WHEN (0.9946489512485399::DOUBLE) * x::DOUBLE + (0.10331245704260288::DOUBLE) * y::DOUBLE >= (7.057457292981658::DOUBLE)
                                    THEN 569
                                    ELSE 555
                                  END
                                END
                                ELSE 547
                              END
                            END
                          END
                          ELSE CASE WHEN (0.9064732667624916::DOUBLE) * x::DOUBLE + (-0.4222632077803331::DOUBLE) * y::DOUBLE >= (3.9687781989103588::DOUBLE)
                            THEN CASE WHEN (0.08279650425392202::DOUBLE) * x::DOUBLE + (0.9965664748943396::DOUBLE) * y::DOUBLE >= (4.718831552570464::DOUBLE)
                              THEN CASE WHEN (0.9405267098174152::DOUBLE) * x::DOUBLE + (0.3397197493817921::DOUBLE) * y::DOUBLE >= (7.43579575540436::DOUBLE)
                                THEN CASE WHEN (0.4896899261660755::DOUBLE) * x::DOUBLE + (0.8718966545476956::DOUBLE) * y::DOUBLE >= (6.979041268195715::DOUBLE)
                                  THEN 552
                                  ELSE 547
                                END
                                ELSE 524
                              END
                              ELSE CASE WHEN (0.9428932149125747::DOUBLE) * x::DOUBLE + (-0.3330951594842368::DOUBLE) * y::DOUBLE >= (4.622116756398132::DOUBLE)
                                THEN CASE WHEN (0.7835232420846296::DOUBLE) * x::DOUBLE + (-0.6213624780377319::DOUBLE) * y::DOUBLE >= (2.5842977591089933::DOUBLE)
                                  THEN 555
                                  ELSE 545
                                END
                                ELSE 524
                              END
                            END
                            ELSE CASE WHEN (0.9719059724446169::DOUBLE) * x::DOUBLE + (-0.23536945580615148::DOUBLE) * y::DOUBLE >= (4.941880056503656::DOUBLE)
                              THEN CASE WHEN (0.852810739201468::DOUBLE) * x::DOUBLE + (-0.5222201098221378::DOUBLE) * y::DOUBLE >= (3.0716755765518173::DOUBLE)
                                THEN CASE WHEN (0.10596676983797743::DOUBLE) * x::DOUBLE + (0.9943696715458016::DOUBLE) * y::DOUBLE >= (4.9160172838876335::DOUBLE)
                                  THEN 528
                                  ELSE 524
                                END
                                ELSE CASE WHEN (0.9362795996299029::DOUBLE) * x::DOUBLE + (0.3512556210466512::DOUBLE) * y::DOUBLE >= (7.330178147374846::DOUBLE)
                                  THEN 528
                                  ELSE 515
                                END
                              END
                              ELSE CASE WHEN (0.33673859809058354::DOUBLE) * x::DOUBLE + (-0.9415981714914214::DOUBLE) * y::DOUBLE >= (-1.925859124946398::DOUBLE)
                                THEN CASE WHEN (0.49121659799986367::DOUBLE) * x::DOUBLE + (0.8710374583503515::DOUBLE) * y::DOUBLE >= (6.629182466964953::DOUBLE)
                                  THEN 515
                                  ELSE 502
                                END
                                ELSE CASE WHEN (0.9968485116438183::DOUBLE) * x::DOUBLE + (0.07932871380215459::DOUBLE) * y::DOUBLE >= (6.353558384037847::DOUBLE)
                                  THEN 515
                                  ELSE 497
                                END
                              END
                            END
                          END
                        END
                        ELSE CASE WHEN (0.9985762013226287::DOUBLE) * x::DOUBLE + (-0.05334388579836496::DOUBLE) * y::DOUBLE >= (6.176781127196935::DOUBLE)
                          THEN CASE WHEN (0.9626119250070083::DOUBLE) * x::DOUBLE + (0.2708842591113442::DOUBLE) * y::DOUBLE >= (7.6707367006496945::DOUBLE)
                            THEN CASE WHEN (0.5445875159689246::DOUBLE) * x::DOUBLE + (0.8387040225555118::DOUBLE) * y::DOUBLE >= (7.763995408708196::DOUBLE)
                              THEN CASE WHEN (0.5953063173958955::DOUBLE) * x::DOUBLE + (0.8034988416099534::DOUBLE) * y::DOUBLE >= (8.02269635884246::DOUBLE)
                                THEN CASE WHEN (0.7255280995067264::DOUBLE) * x::DOUBLE + (-0.6881925434252814::DOUBLE) * y::DOUBLE >= (1.7835267333350275::DOUBLE)
                                  THEN 613
                                  ELSE 583
                                END
                                ELSE CASE WHEN (0.9957041453199321::DOUBLE) * x::DOUBLE + (-0.09259187325410113::DOUBLE) * y::DOUBLE >= (6.531739427673156::DOUBLE)
                                  THEN 613
                                  ELSE 571
                                END
                              END
                              ELSE CASE WHEN (0.005917544974619578::DOUBLE) * x::DOUBLE + (0.9999824911774572::DOUBLE) * y::DOUBLE >= (4.675660800901576::DOUBLE)
                                THEN CASE WHEN (0.7047938320054639::DOUBLE) * x::DOUBLE + (-0.709412189327935::DOUBLE) * y::DOUBLE >= (1.5887785755958879::DOUBLE)
                                  THEN 598
                                  ELSE 571
                                END
                                ELSE CASE WHEN (0.9997548581970082::DOUBLE) * x::DOUBLE + (-0.022140991655300146::DOUBLE) * y::DOUBLE >= (6.815097442661197::DOUBLE)
                                  THEN 598
                                  ELSE 570
                                END
                              END
                            END
                            ELSE CASE WHEN (0.8914707627146283::DOUBLE) * x::DOUBLE + (-0.4530782263859066::DOUBLE) * y::DOUBLE >= (3.764843584680897::DOUBLE)
                              THEN CASE WHEN (0.20421616890402966::DOUBLE) * x::DOUBLE + (-0.9789258175971052::DOUBLE) * y::DOUBLE >= (-3.1350538298138684::DOUBLE)
                                THEN CASE WHEN (0.9469029462899402::DOUBLE) * x::DOUBLE + (0.32151953332174193::DOUBLE) * y::DOUBLE >= (7.7391351027422255::DOUBLE)
                                  THEN 570
                                  ELSE 552
                                END
                                ELSE CASE WHEN (0.750445510320692::DOUBLE) * x::DOUBLE + (-0.6609323233429548::DOUBLE) * y::DOUBLE >= (1.9366740972037704::DOUBLE)
                                  THEN 570
                                  ELSE 549
                                END
                              END
                              ELSE CASE WHEN (0.373727867276376::DOUBLE) * x::DOUBLE + (0.9275383987852208::DOUBLE) * y::DOUBLE >= (6.682814559521461::DOUBLE)
                                THEN 549
                                ELSE 538
                              END
                            END
                          END
                          ELSE CASE WHEN (0.6246883417620532::DOUBLE) * x::DOUBLE + (0.7808741740297063::DOUBLE) * y::DOUBLE >= (7.311172773452304::DOUBLE)
                            THEN CASE WHEN (0.916704962631847::DOUBLE) * x::DOUBLE + (0.39956477758449166::DOUBLE) * y::DOUBLE >= (7.532467863798059::DOUBLE)
                              THEN CASE WHEN (0.12313873577500582::DOUBLE) * x::DOUBLE + (0.9923894657601586::DOUBLE) * y::DOUBLE >= (5.3966704330775865::DOUBLE)
                                THEN CASE WHEN (0.9415684508143058::DOUBLE) * x::DOUBLE + (-0.3368216923405438::DOUBLE) * y::DOUBLE >= (4.416770227825008::DOUBLE)
                                  THEN 549
                                  ELSE 526
                                END
                                ELSE CASE WHEN (0.24833230794243344::DOUBLE) * x::DOUBLE + (-0.9686749015185561::DOUBLE) * y::DOUBLE >= (-2.7450374106465674::DOUBLE)
                                  THEN CASE WHEN (0.6467319368621796::DOUBLE) * x::DOUBLE + (0.7627173800579699::DOUBLE) * y::DOUBLE >= (7.482521339928253::DOUBLE)
                                    THEN 538
                                    ELSE 528
                                  END
                                  ELSE CASE WHEN (0.9766264740366244::DOUBLE) * x::DOUBLE + (-0.2149435512193624::DOUBLE) * y::DOUBLE >= (5.212746643519478::DOUBLE)
                                    THEN CASE WHEN (0.373727867276376::DOUBLE) * x::DOUBLE + (0.9275383987852208::DOUBLE) * y::DOUBLE >= (6.682814559521461::DOUBLE)
                                      THEN 549
                                      ELSE 538
                                    END
                                    ELSE CASE WHEN (0.8075762707585775::DOUBLE) * x::DOUBLE + (0.5897631447519154::DOUBLE) * y::DOUBLE >= (7.873627597297894::DOUBLE)
                                      THEN 549
                                      ELSE 521
                                    END
                                  END
                                END
                              END
                              ELSE CASE WHEN (0.24833230794243344::DOUBLE) * x::DOUBLE + (-0.9686749015185561::DOUBLE) * y::DOUBLE >= (-2.7450374106465674::DOUBLE)
                                THEN 528
                                ELSE CASE WHEN (0.3865778201732702::DOUBLE) * x::DOUBLE + (-0.92225679121928::DOUBLE) * y::DOUBLE >= (-1.9006381515404955::DOUBLE)
                                  THEN CASE WHEN (0.9982534835191744::DOUBLE) * x::DOUBLE + (0.05907607503747723::DOUBLE) * y::DOUBLE >= (6.426363146778735::DOUBLE)
                                    THEN 521
                                    ELSE 510
                                  END
                                  ELSE CASE WHEN (0.8306953612712276::DOUBLE) * x::DOUBLE + (-0.5567272373096764::DOUBLE) * y::DOUBLE >= (2.533903917579873::DOUBLE)
                                    THEN 521
                                    ELSE 506
                                  END
                                END
                              END
                            END
                            ELSE CASE WHEN (0.9968485116438183::DOUBLE) * x::DOUBLE + (0.07932871380215459::DOUBLE) * y::DOUBLE >= (6.353558384037847::DOUBLE)
                              THEN CASE WHEN (0.1327299080447391::DOUBLE) * x::DOUBLE + (-0.9911522443653321::DOUBLE) * y::DOUBLE >= (-3.555136087691504::DOUBLE)
                                THEN CASE WHEN (0.9362795996299029::DOUBLE) * x::DOUBLE + (0.3512556210466512::DOUBLE) * y::DOUBLE >= (7.330178147374846::DOUBLE)
                                  THEN 528
                                  ELSE 515
                                END
                                ELSE CASE WHEN (0.9982534835191744::DOUBLE) * x::DOUBLE + (0.05907607503747723::DOUBLE) * y::DOUBLE >= (6.426363146778735::DOUBLE)
                                  THEN CASE WHEN (0.24833230794243344::DOUBLE) * x::DOUBLE + (-0.9686749015185561::DOUBLE) * y::DOUBLE >= (-2.7450374106465674::DOUBLE)
                                    THEN 528
                                    ELSE 521
                                  END
                                  ELSE CASE WHEN (0.7730115948539867::DOUBLE) * x::DOUBLE + (-0.6343918932499814::DOUBLE) * y::DOUBLE >= (1.9720678174983304::DOUBLE)
                                    THEN 528
                                    ELSE 510
                                  END
                                END
                              END
                              ELSE CASE WHEN (0.2156097842510989::DOUBLE) * x::DOUBLE + (-0.9764796060006551::DOUBLE) * y::DOUBLE >= (-3.015203756877147::DOUBLE)
                                THEN CASE WHEN (0.5150866485826784::DOUBLE) * x::DOUBLE + (0.8571381128218862::DOUBLE) * y::DOUBLE >= (6.868785946964692::DOUBLE)
                                  THEN 510
                                  ELSE 497
                                END
                                ELSE CASE WHEN (0.9995177101939681::DOUBLE) * x::DOUBLE + (0.0310539370870566::DOUBLE) * y::DOUBLE >= (6.12844375040559::DOUBLE)
                                  THEN 510
                                  ELSE 493
                                END
                              END
                            END
                          END
                        END
                      END
                    END
                    ELSE CASE WHEN (0.6064427864847785::DOUBLE) * x::DOUBLE + (0.7951271261380646::DOUBLE) * y::DOUBLE >= (9.121254918989411::DOUBLE)
                      THEN CASE WHEN (0.7516475743621145::DOUBLE) * x::DOUBLE + (-0.6595649505208335::DOUBLE) * y::DOUBLE >= (1.1136155441428697::DOUBLE)
                        THEN CASE WHEN (0.5804186155095877::DOUBLE) * x::DOUBLE + (-0.8143182613511337::DOUBLE) * y::DOUBLE >= (-0.7576269166357168::DOUBLE)
                          THEN CASE WHEN (0.2628438895361766::DOUBLE) * x::DOUBLE + (-0.9648383749278914::DOUBLE) * y::DOUBLE >= (-3.603424604785565::DOUBLE)
                            THEN CASE WHEN (0.5347976378951392::DOUBLE) * x::DOUBLE + (-0.8449801692949838::DOUBLE) * y::DOUBLE >= (-0.6113849486945755::DOUBLE)
                              THEN CASE WHEN (0.9624171098945087::DOUBLE) * x::DOUBLE + (0.27157560012324566::DOUBLE) * y::DOUBLE >= (9.304632809835791::DOUBLE)
                                THEN CASE WHEN (0.0007646775554785575::DOUBLE) * x::DOUBLE + (-0.9999997076340753::DOUBLE) * y::DOUBLE >= (-5.498469287312635::DOUBLE)
                                  THEN 699
                                  ELSE 698
                                END
                                ELSE CASE WHEN (0.8546086714091099::DOUBLE) * x::DOUBLE + (-0.5192725861745024::DOUBLE) * y::DOUBLE >= (4.076439889852235::DOUBLE)
                                  THEN 699
                                  ELSE 662
                                END
                              END
                              ELSE CASE WHEN (0.8705839589063556::DOUBLE) * x::DOUBLE + (-0.49201988831239013::DOUBLE) * y::DOUBLE >= (3.857448246085854::DOUBLE)
                                THEN CASE WHEN (0.39233706272804836::DOUBLE) * x::DOUBLE + (0.9198215203015895::DOUBLE) * y::DOUBLE >= (8.490536668981493::DOUBLE)
                                  THEN 679
                                  ELSE 662
                                END
                                ELSE 634
                              END
                            END
                            ELSE CASE WHEN (0.9007724863890972::DOUBLE) * x::DOUBLE + (0.4342912936778764::DOUBLE) * y::DOUBLE >= (9.571128217437632::DOUBLE)
                              THEN CASE WHEN (0.06181747594857897::DOUBLE) * x::DOUBLE + (0.9980874709499898::DOUBLE) * y::DOUBLE >= (6.872232548884964::DOUBLE)
                                THEN CASE WHEN (0.8867082137344282::DOUBLE) * x::DOUBLE + (-0.4623294752618523::DOUBLE) * y::DOUBLE >= (3.9426125388779867::DOUBLE)
                                  THEN 677
                                  ELSE 652
                                END
                                ELSE CASE WHEN (0.6649421537534449::DOUBLE) * x::DOUBLE + (0.746894860178948::DOUBLE) * y::DOUBLE >= (9.95910805405212::DOUBLE)
                                  THEN CASE WHEN (0.021265315108129942::DOUBLE) * x::DOUBLE + (-0.999773867618749::DOUBLE) * y::DOUBLE >= (-6.137825471878111::DOUBLE)
                                    THEN 679
                                    ELSE 677
                                  END
                                  ELSE CASE WHEN (0.997578107066904::DOUBLE) * x::DOUBLE + (-0.06955516013073713::DOUBLE) * y::DOUBLE >= (7.435163359109314::DOUBLE)
                                    THEN 679
                                    ELSE 650
                                  END
                                END
                              END
                              ELSE CASE WHEN (0.518219393672272::DOUBLE) * x::DOUBLE + (-0.8552477185131467::DOUBLE) * y::DOUBLE >= (-1.2699489027272874::DOUBLE)
                                THEN CASE WHEN (0.6055350861781535::DOUBLE) * x::DOUBLE + (0.7958186096135325::DOUBLE) * y::DOUBLE >= (9.330509842018232::DOUBLE)
                                  THEN 650
                                  ELSE 634
                                END
                                ELSE CASE WHEN (0.9974099528865074::DOUBLE) * x::DOUBLE + (0.0719262530856093::DOUBLE) * y::DOUBLE >= (7.905364233063885::DOUBLE)
                                  THEN 650
                                  ELSE 617
                                END
                              END
                            END
                          END
                          ELSE CASE WHEN (0.6223613202943471::DOUBLE) * x::DOUBLE + (0.7827300856626612::DOUBLE) * y::DOUBLE >= (10.264380255109092::DOUBLE)
                            THEN CASE WHEN (0.23942255788666048::DOUBLE) * x::DOUBLE + (0.9709154642784349::DOUBLE) * y::DOUBLE >= (8.809615660326278::DOUBLE)
                              THEN CASE WHEN (0.6637380139531942::DOUBLE) * x::DOUBLE + (-0.7479651387821956::DOUBLE) * y::DOUBLE >= (-0.1890715528660989::DOUBLE)
                                THEN CASE WHEN (0.21605865852864242::DOUBLE) * x::DOUBLE + (0.9763803849293591::DOUBLE) * y::DOUBLE >= (8.818951342973278::DOUBLE)
                                  THEN 683
                                  ELSE 671
                                END
                                ELSE CASE WHEN (0.9787261530649518::DOUBLE) * x::DOUBLE + (0.205170946546241::DOUBLE) * y::DOUBLE >= (9.244075696601923::DOUBLE)
                                  THEN 683
                                  ELSE 648
                                END
                              END
                              ELSE CASE WHEN (0.9970491423537446::DOUBLE) * x::DOUBLE + (0.0767659281951464::DOUBLE) * y::DOUBLE >= (8.304854118736518::DOUBLE)
                                THEN CASE WHEN (0.1120471436413151::DOUBLE) * x::DOUBLE + (-0.9937028920164329::DOUBLE) * y::DOUBLE >= (-5.834672898881811::DOUBLE)
                                  THEN CASE WHEN (0.6674731268620651::DOUBLE) * x::DOUBLE + (0.744633886495221::DOUBLE) * y::DOUBLE >= (10.426570561237913::DOUBLE)
                                    THEN 700
                                    ELSE 677
                                  END
                                  ELSE CASE WHEN (0.8217888417233993::DOUBLE) * x::DOUBLE + (-0.5697921547537435::DOUBLE) * y::DOUBLE >= (2.7579104582636695::DOUBLE)
                                    THEN 700
                                    ELSE 671
                                  END
                                END
                                ELSE 641
                              END
                            END
                            ELSE CASE WHEN (0.5923433269411956::DOUBLE) * x::DOUBLE + (0.8056856601853082::DOUBLE) * y::DOUBLE >= (9.674047730388718::DOUBLE)
                              THEN CASE WHEN (0.8867082137344282::DOUBLE) * x::DOUBLE + (-0.4623294752618523::DOUBLE) * y::DOUBLE >= (3.9426125388779867::DOUBLE)
                                THEN 677
                                ELSE CASE WHEN (0.31986189399536225::DOUBLE) * x::DOUBLE + (0.947464178093135::DOUBLE) * y::DOUBLE >= (8.797872387177193::DOUBLE)
                                  THEN CASE WHEN (0.44067766958877236::DOUBLE) * x::DOUBLE + (-0.8976654117909462::DOUBLE) * y::DOUBLE >= (-2.770410788232801::DOUBLE)
                                    THEN 652
                                    ELSE 641
                                  END
                                  ELSE CASE WHEN (0.8639025364316482::DOUBLE) * x::DOUBLE + (0.5036590191260003::DOUBLE) * y::DOUBLE >= (9.868794781698481::DOUBLE)
                                    THEN 652
                                    ELSE 631
                                  END
                                END
                              END
                              ELSE CASE WHEN (0.8008852069203837::DOUBLE) * x::DOUBLE + (-0.5988179066595237::DOUBLE) * y::DOUBLE >= (2.03455652855207::DOUBLE)
                                THEN CASE WHEN (0.321658062502319::DOUBLE) * x::DOUBLE + (0.9468558976038827::DOUBLE) * y::DOUBLE >= (8.329720220340775::DOUBLE)
                                  THEN 631
                                  ELSE 617
                                END
                                ELSE CASE WHEN (0.8352843341310261::DOUBLE) * x::DOUBLE + (0.5498182255575823::DOUBLE) * y::DOUBLE >= (9.552263969719792::DOUBLE)
                                  THEN 631
                                  ELSE 595
                                END
                              END
                            END
                          END
                        END
                        ELSE CASE WHEN (0.6734559598594192::DOUBLE) * x::DOUBLE + (0.7392273467140054::DOUBLE) * y::DOUBLE >= (9.947203107994628::DOUBLE)
                          THEN CASE WHEN (0.8100270383082167::DOUBLE) * x::DOUBLE + (-0.5863925282689223::DOUBLE) * y::DOUBLE >= (1.5342916667294162::DOUBLE)
                            THEN CASE WHEN (0.23942255788666048::DOUBLE) * x::DOUBLE + (0.9709154642784349::DOUBLE) * y::DOUBLE >= (8.809615660326278::DOUBLE)
                              THEN CASE WHEN (0.998607994475848::DOUBLE) * x::DOUBLE + (0.052745363482723955::DOUBLE) * y::DOUBLE >= (8.016011004185547::DOUBLE)
                                THEN CASE WHEN (0.37611747810589274::DOUBLE) * x::DOUBLE + (0.9265719846095409::DOUBLE) * y::DOUBLE >= (9.947345019717638::DOUBLE)
                                  THEN CASE WHEN (0.6378291409712199::DOUBLE) * x::DOUBLE + (-0.7701778930402481::DOUBLE) * y::DOUBLE >= (-0.7942617377553534::DOUBLE)
                                    THEN 683
                                    ELSE 660
                                  END
                                  ELSE CASE WHEN (0.9787261530649518::DOUBLE) * x::DOUBLE + (0.205170946546241::DOUBLE) * y::DOUBLE >= (9.244075696601923::DOUBLE)
                                    THEN 683
                                    ELSE 648
                                  END
                                END
                                ELSE CASE WHEN (0.18368065291939353::DOUBLE) * x::DOUBLE + (0.9829859702676866::DOUBLE) * y::DOUBLE >= (8.676904859215748::DOUBLE)
                                  THEN CASE WHEN (0.6061792409647934::DOUBLE) * x::DOUBLE + (-0.7953280630176123::DOUBLE) * y::DOUBLE >= (-1.4558735259694027::DOUBLE)
                                    THEN 648
                                    ELSE 628
                                  END
                                  ELSE CASE WHEN (0.8602448470571551::DOUBLE) * x::DOUBLE + (0.5098811656764856::DOUBLE) * y::DOUBLE >= (10.140332996972699::DOUBLE)
                                    THEN 648
                                    ELSE 618
                                  END
                                END
                              END
                              ELSE CASE WHEN (0.21127319137930495::DOUBLE) * x::DOUBLE + (-0.9774270502725018::DOUBLE) * y::DOUBLE >= (-5.124309375510584::DOUBLE)
                                THEN CASE WHEN (0.31986189399536225::DOUBLE) * x::DOUBLE + (0.947464178093135::DOUBLE) * y::DOUBLE >= (8.797872387177193::DOUBLE)
                                  THEN 641
                                  ELSE 631
                                END
                                ELSE CASE WHEN (0.889999355525409::DOUBLE) * x::DOUBLE + (-0.4559617825699396::DOUBLE) * y::DOUBLE >= (3.3880451111005456::DOUBLE)
                                  THEN 641
                                  ELSE 618
                                END
                              END
                            END
                            ELSE CASE WHEN (0.998306012501815::DOUBLE) * x::DOUBLE + (-0.05818165864536606::DOUBLE) * y::DOUBLE >= (6.683343882648758::DOUBLE)
                              THEN CASE WHEN (0.6857685027419581::DOUBLE) * x::DOUBLE + (0.7278197308723177::DOUBLE) * y::DOUBLE >= (10.436252456723143::DOUBLE)
                                THEN CASE WHEN (0.998607994475848::DOUBLE) * x::DOUBLE + (0.052745363482723955::DOUBLE) * y::DOUBLE >= (8.016011004185547::DOUBLE)
                                  THEN 660
                                  ELSE 628
                                END
                                ELSE 593
                              END
                              ELSE CASE WHEN (0.439597386507974::DOUBLE) * x::DOUBLE + (0.8981949330603903::DOUBLE) * y::DOUBLE >= (9.768125794707567::DOUBLE)
                                THEN CASE WHEN (0.22955720361889378::DOUBLE) * x::DOUBLE + (-0.9732951711925184::DOUBLE) * y::DOUBLE >= (-5.7711428879466276::DOUBLE)
                                  THEN 593
                                  ELSE 581
                                END
                                ELSE CASE WHEN (0.9955685789651337::DOUBLE) * x::DOUBLE + (0.09403831441143722::DOUBLE) * y::DOUBLE >= (7.497791029801352::DOUBLE)
                                  THEN 593
                                  ELSE 561
                                END
                              END
                            END
                          END
                          ELSE CASE WHEN (0.05554246668512555::DOUBLE) * x::DOUBLE + (-0.9984563257321433::DOUBLE) * y::DOUBLE >= (-6.384644832928653::DOUBLE)
                            THEN CASE WHEN (0.8849412965154287::DOUBLE) * x::DOUBLE + (-0.46570258934387704::DOUBLE) * y::DOUBLE >= (3.152337089236309::DOUBLE)
                              THEN CASE WHEN (0.1678222414348092::DOUBLE) * x::DOUBLE + (-0.9858172727639727::DOUBLE) * y::DOUBLE >= (-5.2621469133464736::DOUBLE)
                                THEN CASE WHEN (0.8352843341310261::DOUBLE) * x::DOUBLE + (0.5498182255575823::DOUBLE) * y::DOUBLE >= (9.552263969719792::DOUBLE)
                                  THEN 631
                                  ELSE 595
                                END
                                ELSE CASE WHEN (0.8539120438750667::DOUBLE) * x::DOUBLE + (-0.520417353020733::DOUBLE) * y::DOUBLE >= (2.6742544763846587::DOUBLE)
                                  THEN 631
                                  ELSE 585
                                END
                              END
                              ELSE CASE WHEN (0.954465543032676::DOUBLE) * x::DOUBLE + (-0.2983211812180608::DOUBLE) * y::DOUBLE >= (4.344909763651108::DOUBLE)
                                THEN CASE WHEN (0.46877323019732::DOUBLE) * x::DOUBLE + (0.8833185487978674::DOUBLE) * y::DOUBLE >= (9.047940098938307::DOUBLE)
                                  THEN 585
                                  ELSE 568
                                END
                                ELSE CASE WHEN (0.9034421980902348::DOUBLE) * x::DOUBLE + (0.428709919071025::DOUBLE) * y::DOUBLE >= (8.886637360324102::DOUBLE)
                                  THEN 585
                                  ELSE 536
                                END
                              END
                            END
                            ELSE CASE WHEN (0.9955685789651337::DOUBLE) * x::DOUBLE + (0.09403831441143722::DOUBLE) * y::DOUBLE >= (7.497791029801352::DOUBLE)
                              THEN CASE WHEN (0.09270847535873336::DOUBLE) * x::DOUBLE + (0.995693295446273::DOUBLE) * y::DOUBLE >= (7.688296712609706::DOUBLE)
                                THEN 593
                                ELSE CASE WHEN (0.8539120438750667::DOUBLE) * x::DOUBLE + (-0.520417353020733::DOUBLE) * y::DOUBLE >= (2.6742544763846587::DOUBLE)
                                  THEN 631
                                  ELSE 585
                                END
                              END
                              ELSE CASE WHEN (0.6519690522062608::DOUBLE) * x::DOUBLE + (0.7582455769506803::DOUBLE) * y::DOUBLE >= (9.668726915030462::DOUBLE)
                                THEN CASE WHEN (0.47524309997087794::DOUBLE) * x::DOUBLE + (-0.879854531118679::DOUBLE) * y::DOUBLE >= (-2.970478826314394::DOUBLE)
                                  THEN 585
                                  ELSE 561
                                END
                                ELSE CASE WHEN (0.9570796445371778::DOUBLE) * x::DOUBLE + (-0.289825040347775::DOUBLE) * y::DOUBLE >= (4.38252364007745::DOUBLE)
                                  THEN 585
                                  ELSE 532
                                END
                              END
                            END
                          END
                        END
                      END
                      ELSE CASE WHEN (0.8934471758873865::DOUBLE) * x::DOUBLE + (0.44916828015661725::DOUBLE) * y::DOUBLE >= (8.458120318288426::DOUBLE)
                        THEN CASE WHEN (0.518219393672272::DOUBLE) * x::DOUBLE + (-0.8552477185131467::DOUBLE) * y::DOUBLE >= (-1.2699489027272874::DOUBLE)
                          THEN CASE WHEN (0.9526982342101029::DOUBLE) * x::DOUBLE + (0.3039178746519395::DOUBLE) * y::DOUBLE >= (8.48334066342274::DOUBLE)
                            THEN CASE WHEN (0.2746678303957355::DOUBLE) * x::DOUBLE + (-0.9615391739007306::DOUBLE) * y::DOUBLE >= (-3.2555199471943017::DOUBLE)
                              THEN CASE WHEN (0.127912128101096::DOUBLE) * x::DOUBLE + (-0.9917855047764355::DOUBLE) * y::DOUBLE >= (-4.237681314146317::DOUBLE)
                                THEN CASE WHEN (0.6128702030710028::DOUBLE) * x::DOUBLE + (0.7901835952408198::DOUBLE) * y::DOUBLE >= (8.650062162939403::DOUBLE)
                                  THEN 643
                                  ELSE 627
                                END
                                ELSE CASE WHEN (0.8357266500742535::DOUBLE) * x::DOUBLE + (-0.5491456695228201::DOUBLE) * y::DOUBLE >= (3.2972046675710645::DOUBLE)
                                  THEN CASE WHEN (0.6115233119456082::DOUBLE) * x::DOUBLE + (0.7912264144649586::DOUBLE) * y::DOUBLE >= (9.015538235129352::DOUBLE)
                                    THEN 662
                                    ELSE 643
                                  END
                                  ELSE CASE WHEN (0.9686885983024146::DOUBLE) * x::DOUBLE + (0.24827887449177677::DOUBLE) * y::DOUBLE >= (8.718624111206166::DOUBLE)
                                    THEN 662
                                    ELSE 623
                                  END
                                END
                              END
                              ELSE CASE WHEN (0.6543448851160144::DOUBLE) * x::DOUBLE + (-0.7561962518569567::DOUBLE) * y::DOUBLE >= (0.4755978648116761::DOUBLE)
                                THEN CASE WHEN (0.3234544324291042::DOUBLE) * x::DOUBLE + (0.9462437477426027::DOUBLE) * y::DOUBLE >= (7.713743186019888::DOUBLE)
                                  THEN CASE WHEN (0.8705839589063556::DOUBLE) * x::DOUBLE + (-0.49201988831239013::DOUBLE) * y::DOUBLE >= (3.857448246085854::DOUBLE)
                                    THEN 662
                                    ELSE 634
                                  END
                                  ELSE CASE WHEN (0.9686885983024146::DOUBLE) * x::DOUBLE + (0.24827887449177677::DOUBLE) * y::DOUBLE >= (8.718624111206166::DOUBLE)
                                    THEN 662
                                    ELSE 623
                                  END
                                END
                                ELSE CASE WHEN (0.9920013831772498::DOUBLE) * x::DOUBLE + (0.12622700097214887::DOUBLE) * y::DOUBLE >= (7.931077015306766::DOUBLE)
                                  THEN 634
                                  ELSE 597
                                END
                              END
                            END
                            ELSE CASE WHEN (0.19653353794064393::DOUBLE) * x::DOUBLE + (0.9804971027313305::DOUBLE) * y::DOUBLE >= (6.683646844207984::DOUBLE)
                              THEN CASE WHEN (0.7205302740449896::DOUBLE) * x::DOUBLE + (-0.6934234811315897::DOUBLE) * y::DOUBLE >= (1.1555671533430276::DOUBLE)
                                THEN CASE WHEN (0.09105698713005878::DOUBLE) * x::DOUBLE + (0.9958456833740839::DOUBLE) * y::DOUBLE >= (6.172182006804101::DOUBLE)
                                  THEN 597
                                  ELSE 594
                                END
                                ELSE CASE WHEN (0.9338758374491539::DOUBLE) * x::DOUBLE + (0.3575974276035015::DOUBLE) * y::DOUBLE >= (8.48531332101859::DOUBLE)
                                  THEN 597
                                  ELSE 566
                                END
                              END
                              ELSE CASE WHEN (0.674768508548996::DOUBLE) * x::DOUBLE + (-0.7380294437693956::DOUBLE) * y::DOUBLE >= (0.7804681518987637::DOUBLE)
                                THEN CASE WHEN (0.2670347683367372::DOUBLE) * x::DOUBLE + (0.9636868954693454::DOUBLE) * y::DOUBLE >= (6.868317634580799::DOUBLE)
                                  THEN CASE WHEN (0.7060972156795029::DOUBLE) * x::DOUBLE + (-0.7081149073488381::DOUBLE) * y::DOUBLE >= (1.4274555905293953::DOUBLE)
                                    THEN 627
                                    ELSE 594
                                  END
                                  ELSE CASE WHEN (0.99720140631417::DOUBLE) * x::DOUBLE + (-0.07476199064392151::DOUBLE) * y::DOUBLE >= (6.770922878679356::DOUBLE)
                                    THEN 627
                                    ELSE 583
                                  END
                                END
                                ELSE CASE WHEN (0.9931068781306037::DOUBLE) * x::DOUBLE + (0.11721232277233543::DOUBLE) * y::DOUBLE >= (7.434770872535493::DOUBLE)
                                  THEN 594
                                  ELSE 562
                                END
                              END
                            END
                          END
                          ELSE CASE WHEN (0.5257154931973934::DOUBLE) * x::DOUBLE + (-0.8506604611783842::DOUBLE) * y::DOUBLE >= (-1.5204165300895585::DOUBLE)
                            THEN CASE WHEN (0.6936880606751319::DOUBLE) * x::DOUBLE + (0.7202755545461572::DOUBLE) * y::DOUBLE >= (9.159920493520797::DOUBLE)
                              THEN CASE WHEN (0.047125057546423314::DOUBLE) * x::DOUBLE + (-0.9988889973121371::DOUBLE) * y::DOUBLE >= (-5.669670653283847::DOUBLE)
                                THEN CASE WHEN (0.5218507378194559::DOUBLE) * x::DOUBLE + (0.8530368148194365::DOUBLE) * y::DOUBLE >= (8.79466253760982::DOUBLE)
                                  THEN 617
                                  ELSE 597
                                END
                                ELSE CASE WHEN (0.8008852069203837::DOUBLE) * x::DOUBLE + (-0.5988179066595237::DOUBLE) * y::DOUBLE >= (2.03455652855207::DOUBLE)
                                  THEN 617
                                  ELSE 595
                                END
                              END
                              ELSE CASE WHEN (0.11234900571849142::DOUBLE) * x::DOUBLE + (-0.9936688084638997::DOUBLE) * y::DOUBLE >= (-4.982380084653715::DOUBLE)
                                THEN CASE WHEN (0.9338758374491539::DOUBLE) * x::DOUBLE + (0.3575974276035015::DOUBLE) * y::DOUBLE >= (8.48531332101859::DOUBLE)
                                  THEN 597
                                  ELSE 566
                                END
                                ELSE CASE WHEN (0.9044161129749806::DOUBLE) * x::DOUBLE + (-0.4266514907875363::DOUBLE) * y::DOUBLE >= (3.741580561713946::DOUBLE)
                                  THEN 597
                                  ELSE 564
                                END
                              END
                            END
                            ELSE CASE WHEN (0.8190868587837374::DOUBLE) * x::DOUBLE + (-0.5736695196433133::DOUBLE) * y::DOUBLE >= (1.9433429027402496::DOUBLE)
                              THEN CASE WHEN (0.08375154652758154::DOUBLE) * x::DOUBLE + (0.9964866674744015::DOUBLE) * y::DOUBLE >= (6.711291789418992::DOUBLE)
                                THEN CASE WHEN (0.8849412965154287::DOUBLE) * x::DOUBLE + (-0.46570258934387704::DOUBLE) * y::DOUBLE >= (3.152337089236309::DOUBLE)
                                  THEN 595
                                  ELSE 568
                                END
                                ELSE CASE WHEN (0.6936880606751319::DOUBLE) * x::DOUBLE + (0.7202755545461572::DOUBLE) * y::DOUBLE >= (9.159920493520797::DOUBLE)
                                  THEN 595
                                  ELSE 564
                                END
                              END
                              ELSE CASE WHEN (0.13147700015025782::DOUBLE) * x::DOUBLE + (-0.991319221255943::DOUBLE) * y::DOUBLE >= (-5.416244035870951::DOUBLE)
                                THEN CASE WHEN (0.6909952297610292::DOUBLE) * x::DOUBLE + (0.7228593171893839::DOUBLE) * y::DOUBLE >= (9.088175326476419::DOUBLE)
                                  THEN 568
                                  ELSE 542
                                END
                                ELSE CASE WHEN (0.954465543032676::DOUBLE) * x::DOUBLE + (-0.2983211812180608::DOUBLE) * y::DOUBLE >= (4.344909763651108::DOUBLE)
                                  THEN 568
                                  ELSE 536
                                END
                              END
                            END
                          END
                        END
                        ELSE CASE WHEN (0.8134255767657623::DOUBLE) * x::DOUBLE + (0.5816690047297406::DOUBLE) * y::DOUBLE >= (8.349867852330945::DOUBLE)
                          THEN CASE WHEN (0.7990799270511573::DOUBLE) * x::DOUBLE + (-0.6012248083570048::DOUBLE) * y::DOUBLE >= (1.9373017110370716::DOUBLE)
                            THEN CASE WHEN (0.19653353794064393::DOUBLE) * x::DOUBLE + (0.9804971027313305::DOUBLE) * y::DOUBLE >= (6.683646844207984::DOUBLE)
                              THEN 566
                              ELSE CASE WHEN (0.15225021209379982::DOUBLE) * x::DOUBLE + (-0.9883419817641023::DOUBLE) * y::DOUBLE >= (-3.967485416695573::DOUBLE)
                                THEN CASE WHEN (0.5953063173958955::DOUBLE) * x::DOUBLE + (0.8034988416099534::DOUBLE) * y::DOUBLE >= (8.02269635884246::DOUBLE)
                                  THEN 583
                                  ELSE 571
                                END
                                ELSE CASE WHEN (0.674768508548996::DOUBLE) * x::DOUBLE + (-0.7380294437693956::DOUBLE) * y::DOUBLE >= (0.7804681518987637::DOUBLE)
                                  THEN 583
                                  ELSE 562
                                END
                              END
                            END
                            ELSE CASE WHEN (0.8190868587837374::DOUBLE) * x::DOUBLE + (-0.5736695196433133::DOUBLE) * y::DOUBLE >= (1.9433429027402496::DOUBLE)
                              THEN CASE WHEN (0.7124429604953545::DOUBLE) * x::DOUBLE + (0.7017300250385576::DOUBLE) * y::DOUBLE >= (8.682076586700306::DOUBLE)
                                THEN CASE WHEN (0.11234900571849142::DOUBLE) * x::DOUBLE + (-0.9936688084638997::DOUBLE) * y::DOUBLE >= (-4.982380084653715::DOUBLE)
                                  THEN 566
                                  ELSE 564
                                END
                                ELSE CASE WHEN (0.9862351083046452::DOUBLE) * x::DOUBLE + (0.1653490585014764::DOUBLE) * y::DOUBLE >= (7.382600610279045::DOUBLE)
                                  THEN 566
                                  ELSE 530
                                END
                              END
                              ELSE CASE WHEN (0.5177319698557001::DOUBLE) * x::DOUBLE + (-0.8555428729113093::DOUBLE) * y::DOUBLE >= (-1.7303179218861096::DOUBLE)
                                THEN CASE WHEN (0.1890325833090415::DOUBLE) * x::DOUBLE + (0.9819708154764631::DOUBLE) * y::DOUBLE >= (6.937465901908551::DOUBLE)
                                  THEN 542
                                  ELSE 530
                                END
                                ELSE CASE WHEN (0.9672172580935398::DOUBLE) * x::DOUBLE + (0.25395034090549057::DOUBLE) * y::DOUBLE >= (7.599339759247082::DOUBLE)
                                  THEN 542
                                  ELSE 509
                                END
                              END
                            END
                          END
                          ELSE CASE WHEN (0.684595429145356::DOUBLE) * x::DOUBLE + (-0.7289232458862084::DOUBLE) * y::DOUBLE >= (0.6108207680006341::DOUBLE)
                            THEN CASE WHEN (0.8122578581631321::DOUBLE) * x::DOUBLE + (0.5832985272159026::DOUBLE) * y::DOUBLE >= (7.977623345128892::DOUBLE)
                              THEN CASE WHEN (0.34221047629023615::DOUBLE) * x::DOUBLE + (0.9396233234212579::DOUBLE) * y::DOUBLE >= (6.820464321066728::DOUBLE)
                                THEN CASE WHEN (0.25573627105749547::DOUBLE) * x::DOUBLE + (-0.9667465850291932::DOUBLE) * y::DOUBLE >= (-3.0984008803008245::DOUBLE)
                                  THEN CASE WHEN (0.9626119250070083::DOUBLE) * x::DOUBLE + (0.2708842591113442::DOUBLE) * y::DOUBLE >= (7.6707367006496945::DOUBLE)
                                    THEN 571
                                    ELSE 549
                                  END
                                  ELSE CASE WHEN (0.7523399467807047::DOUBLE) * x::DOUBLE + (-0.6587750788228154::DOUBLE) * y::DOUBLE >= (1.6907153738392209::DOUBLE)
                                    THEN 571
                                    ELSE 535
                                  END
                                END
                                ELSE CASE WHEN (0.9415684508143058::DOUBLE) * x::DOUBLE + (-0.3368216923405438::DOUBLE) * y::DOUBLE >= (4.416770227825008::DOUBLE)
                                  THEN 549
                                  ELSE 526
                                END
                              END
                              ELSE CASE WHEN (0.25202568782142093::DOUBLE) * x::DOUBLE + (0.9677205447225659::DOUBLE) * y::DOUBLE >= (6.14927885103976::DOUBLE)
                                THEN CASE WHEN (0.9230247359961044::DOUBLE) * x::DOUBLE + (-0.3847406096830978::DOUBLE) * y::DOUBLE >= (3.842624893960567::DOUBLE)
                                  THEN 526
                                  ELSE 508
                                END
                                ELSE CASE WHEN (0.916704962631847::DOUBLE) * x::DOUBLE + (0.39956477758449166::DOUBLE) * y::DOUBLE >= (7.532467863798059::DOUBLE)
                                  THEN 526
                                  ELSE 506
                                END
                              END
                            END
                            ELSE CASE WHEN (0.04130471873999038::DOUBLE) * x::DOUBLE + (-0.9991465959556737::DOUBLE) * y::DOUBLE >= (-4.944311758674248::DOUBLE)
                              THEN CASE WHEN (0.29997575136887966::DOUBLE) * x::DOUBLE + (-0.9539468269199683::DOUBLE) * y::DOUBLE >= (-2.9356643067666646::DOUBLE)
                                THEN CASE WHEN (0.8122578581631321::DOUBLE) * x::DOUBLE + (0.5832985272159026::DOUBLE) * y::DOUBLE >= (7.977623345128892::DOUBLE)
                                  THEN 535
                                  ELSE 508
                                END
                                ELSE CASE WHEN (0.9969521971380654::DOUBLE) * x::DOUBLE + (0.07801484872499666::DOUBLE) * y::DOUBLE >= (6.582897670945606::DOUBLE)
                                  THEN 535
                                  ELSE 503
                                END
                              END
                              ELSE CASE WHEN (0.8141402749577483::DOUBLE) * x::DOUBLE + (0.5806682466707836::DOUBLE) * y::DOUBLE >= (8.186513337228423::DOUBLE)
                                THEN CASE WHEN (0.10305310810564385::DOUBLE) * x::DOUBLE + (-0.994675855195936::DOUBLE) * y::DOUBLE >= (-4.6503647613560775::DOUBLE)
                                  THEN 535
                                  ELSE 530
                                END
                                ELSE CASE WHEN (0.8847481944934001::DOUBLE) * x::DOUBLE + (-0.4660693428457494::DOUBLE) * y::DOUBLE >= (3.0559339778324635::DOUBLE)
                                  THEN 535
                                  ELSE 501
                                END
                              END
                            END
                          END
                        END
                      END
                    END
                  END
                  ELSE CASE WHEN (0.9980852463782705::DOUBLE) * x::DOUBLE + (-0.06185338278564159::DOUBLE) * y::DOUBLE >= (6.716401632107284::DOUBLE)
                    THEN CASE WHEN (0.8525488227756588::DOUBLE) * x::DOUBLE + (-0.5226475913881536::DOUBLE) * y::DOUBLE >= (4.494209349616303::DOUBLE)
                      THEN CASE WHEN (0.9450991324909507::DOUBLE) * x::DOUBLE + (-0.32678376606687864::DOUBLE) * y::DOUBLE >= (6.399865796052919::DOUBLE)
                        THEN CASE WHEN (0.9918671015017141::DOUBLE) * x::DOUBLE + (-0.12727785729885785::DOUBLE) * y::DOUBLE >= (7.92972325614615::DOUBLE)
                          THEN CASE WHEN (0.28889889717589595::DOUBLE) * x::DOUBLE + (-0.9573596122724998::DOUBLE) * y::DOUBLE >= (-0.8964878112586003::DOUBLE)
                            THEN CASE WHEN (0.8781171474512323::DOUBLE) * x::DOUBLE + (0.47844568694065015::DOUBLE) * y::DOUBLE >= (9.125613982202756::DOUBLE)
                              THEN CASE WHEN (0.16360870705755445::DOUBLE) * x::DOUBLE + (0.9865253118774779::DOUBLE) * y::DOUBLE >= (4.701724420623214::DOUBLE)
                                THEN CASE WHEN (0.5722577393264042::DOUBLE) * x::DOUBLE + (-0.8200738258114528::DOUBLE) * y::DOUBLE >= (2.3100624746981953::DOUBLE)
                                  THEN 745
                                  ELSE 730
                                END
                                ELSE CASE WHEN (0.9921386469346031::DOUBLE) * x::DOUBLE + (-0.12514353862175623::DOUBLE) * y::DOUBLE >= (8.2967035248095::DOUBLE)
                                  THEN 745
                                  ELSE 725
                                END
                              END
                              ELSE CASE WHEN (0.4099314360739047::DOUBLE) * x::DOUBLE + (-0.912116340012822::DOUBLE) * y::DOUBLE >= (0.5571151546482769::DOUBLE)
                                THEN CASE WHEN (0.7421603102675796::DOUBLE) * x::DOUBLE + (0.670222406267897::DOUBLE) * y::DOUBLE >= (8.47564515968635::DOUBLE)
                                  THEN 725
                                  ELSE 715
                                END
                                ELSE CASE WHEN (0.9210310104666006::DOUBLE) * x::DOUBLE + (-0.38948925243050403::DOUBLE) * y::DOUBLE >= (6.590411888890388::DOUBLE)
                                  THEN 725
                                  ELSE 707
                                END
                              END
                            END
                            ELSE CASE WHEN (0.7458604098108526::DOUBLE) * x::DOUBLE + (0.6661022812427436::DOUBLE) * y::DOUBLE >= (8.75526435757922::DOUBLE)
                              THEN CASE WHEN (0.41750045532450264::DOUBLE) * x::DOUBLE + (-0.9086767135807063::DOUBLE) * y::DOUBLE >= (0.2966992098900332::DOUBLE)
                                THEN CASE WHEN (0.5554091388189003::DOUBLE) * x::DOUBLE + (0.8315772294359963::DOUBLE) * y::DOUBLE >= (7.880718503351855::DOUBLE)
                                  THEN 747
                                  ELSE 730
                                END
                                ELSE CASE WHEN (0.9921645335478686::DOUBLE) * x::DOUBLE + (-0.12493813817141727::DOUBLE) * y::DOUBLE >= (8.169341661853013::DOUBLE)
                                  THEN 747
                                  ELSE 719
                                END
                              END
                              ELSE CASE WHEN (0.9103166568629211::DOUBLE) * x::DOUBLE + (-0.41391253211024526::DOUBLE) * y::DOUBLE >= (6.277938744834483::DOUBLE)
                                THEN 730
                                ELSE 701
                              END
                            END
                          END
                          ELSE CASE WHEN (0.4402498780439387::DOUBLE) * x::DOUBLE + (-0.8978752947276682::DOUBLE) * y::DOUBLE >= (0.441564123258849::DOUBLE)
                            THEN CASE WHEN (0.9998265140176441::DOUBLE) * x::DOUBLE + (0.018626375582110197::DOUBLE) * y::DOUBLE >= (8.054254896763632::DOUBLE)
                              THEN CASE WHEN (0.6082284818425223::DOUBLE) * x::DOUBLE + (0.793762000775762::DOUBLE) * y::DOUBLE >= (7.621731315089399::DOUBLE)
                                THEN CASE WHEN (0.5115077661261114::DOUBLE) * x::DOUBLE + (0.8592786539840702::DOUBLE) * y::DOUBLE >= (7.205917870069368::DOUBLE)
                                  THEN CASE WHEN (0.28889889717589595::DOUBLE) * x::DOUBLE + (-0.9573596122724998::DOUBLE) * y::DOUBLE >= (-0.8964878112586003::DOUBLE)
                                    THEN 707
                                    ELSE 701
                                  END
                                  ELSE CASE WHEN (0.9873419866218429::DOUBLE) * x::DOUBLE + (-0.1586058052330765::DOUBLE) * y::DOUBLE >= (7.653501328971672::DOUBLE)
                                    THEN 707
                                    ELSE 686
                                  END
                                END
                                ELSE CASE WHEN (0.6034022073089306::DOUBLE) * x::DOUBLE + (0.7974370045431239::DOUBLE) * y::DOUBLE >= (7.480281437905726::DOUBLE)
                                  THEN CASE WHEN (0.44836708202096703::DOUBLE) * x::DOUBLE + (-0.8938495174021203::DOUBLE) * y::DOUBLE >= (0.7956959067040104::DOUBLE)
                                    THEN 696
                                    ELSE 686
                                  END
                                  ELSE CASE WHEN (0.9739340106270606::DOUBLE) * x::DOUBLE + (-0.22683152987159516::DOUBLE) * y::DOUBLE >= (7.222777273629651::DOUBLE)
                                    THEN 696
                                    ELSE 672
                                  END
                                END
                              END
                              ELSE CASE WHEN (0.11646258635453026::DOUBLE) * x::DOUBLE + (-0.9931950795184264::DOUBLE) * y::DOUBLE >= (-2.2767637983535485::DOUBLE)
                                THEN CASE WHEN (0.8863043323325641::DOUBLE) * x::DOUBLE + (0.4631032611508235::DOUBLE) * y::DOUBLE >= (8.488965361955405::DOUBLE)
                                  THEN 672
                                  ELSE 664
                                END
                                ELSE CASE WHEN (0.7595639259583161::DOUBLE) * x::DOUBLE + (-0.6504326578384496::DOUBLE) * y::DOUBLE >= (3.904495129636289::DOUBLE)
                                  THEN 672
                                  ELSE 659
                                END
                              END
                            END
                            ELSE CASE WHEN (0.999000456016961::DOUBLE) * x::DOUBLE + (0.04469998744859089::DOUBLE) * y::DOUBLE >= (8.326858681960317::DOUBLE)
                              THEN CASE WHEN (0.6521472478144659::DOUBLE) * x::DOUBLE + (-0.7580923210058375::DOUBLE) * y::DOUBLE >= (2.4679681468453873::DOUBLE)
                                THEN CASE WHEN (0.7458604098108526::DOUBLE) * x::DOUBLE + (0.6661022812427436::DOUBLE) * y::DOUBLE >= (8.75526435757922::DOUBLE)
                                  THEN 719
                                  ELSE 701
                                END
                                ELSE CASE WHEN (0.9614652595528793::DOUBLE) * x::DOUBLE + (-0.2749264532068796::DOUBLE) * y::DOUBLE >= (6.899611341474761::DOUBLE)
                                  THEN 719
                                  ELSE 676
                                END
                              END
                              ELSE CASE WHEN (0.5910202105964912::DOUBLE) * x::DOUBLE + (0.8066567489747292::DOUBLE) * y::DOUBLE >= (7.487566410697786::DOUBLE)
                                THEN CASE WHEN (0.04099037094772875::DOUBLE) * x::DOUBLE + (0.9991595415595887::DOUBLE) * y::DOUBLE >= (4.101308262263043::DOUBLE)
                                  THEN 676
                                  ELSE 674
                                END
                                ELSE 659
                              END
                            END
                          END
                        END
                        ELSE CASE WHEN (0.3237849061093708::DOUBLE) * x::DOUBLE + (0.9461307174887336::DOUBLE) * y::DOUBLE >= (5.6912274550289865::DOUBLE)
                          THEN CASE WHEN (0.9857273194779379::DOUBLE) * x::DOUBLE + (-0.16834978953013033::DOUBLE) * y::DOUBLE >= (6.856924029144505::DOUBLE)
                            THEN CASE WHEN (0.04099037094772875::DOUBLE) * x::DOUBLE + (0.9991595415595887::DOUBLE) * y::DOUBLE >= (4.101308262263043::DOUBLE)
                              THEN CASE WHEN (0.1160358369923115::DOUBLE) * x::DOUBLE + (-0.993245027439601::DOUBLE) * y::DOUBLE >= (-3.0079140004430527::DOUBLE)
                                THEN CASE WHEN (0.8188908004850913::DOUBLE) * x::DOUBLE + (0.5739493504490499::DOUBLE) * y::DOUBLE >= (8.668167634199245::DOUBLE)
                                  THEN 676
                                  ELSE 654
                                END
                                ELSE CASE WHEN (0.8828555673079497::DOUBLE) * x::DOUBLE + (-0.4696445967679798::DOUBLE) * y::DOUBLE >= (5.054456705777069::DOUBLE)
                                  THEN 676
                                  ELSE 651
                                END
                              END
                              ELSE CASE WHEN (0.578605166404944::DOUBLE) * x::DOUBLE + (-0.8156077865061779::DOUBLE) * y::DOUBLE >= (1.4992237155428092::DOUBLE)
                                THEN CASE WHEN (0.9075675501845393::DOUBLE) * x::DOUBLE + (-0.4199061107581475::DOUBLE) * y::DOUBLE >= (5.616006137833965::DOUBLE)
                                  THEN CASE WHEN (0.5910202105964912::DOUBLE) * x::DOUBLE + (0.8066567489747292::DOUBLE) * y::DOUBLE >= (7.487566410697786::DOUBLE)
                                    THEN 674
                                    ELSE 659
                                  END
                                  ELSE CASE WHEN (0.3859454892601334::DOUBLE) * x::DOUBLE + (0.9225215874546007::DOUBLE) * y::DOUBLE >= (6.285580497111033::DOUBLE)
                                    THEN CASE WHEN (0.20800136974457792::DOUBLE) * x::DOUBLE + (-0.9781285345926574::DOUBLE) * y::DOUBLE >= (-1.8403223056052942::DOUBLE)
                                      THEN 659
                                      ELSE 654
                                    END
                                    ELSE CASE WHEN (0.8611925801967518::DOUBLE) * x::DOUBLE + (-0.5082788012636974::DOUBLE) * y::DOUBLE >= (4.929983877891764::DOUBLE)
                                      THEN 659
                                      ELSE 646
                                    END
                                  END
                                END
                                ELSE CASE WHEN (0.8775720284877983::DOUBLE) * x::DOUBLE + (0.4794448193648681::DOUBLE) * y::DOUBLE >= (8.460180070374733::DOUBLE)
                                  THEN 654
                                  ELSE 638
                                END
                              END
                            END
                            ELSE CASE WHEN (0.6252926096702645::DOUBLE) * x::DOUBLE + (-0.7803903845459339::DOUBLE) * y::DOUBLE >= (1.934953521390784::DOUBLE)
                              THEN CASE WHEN (0.40822782620924214::DOUBLE) * x::DOUBLE + (0.9128800807929138::DOUBLE) * y::DOUBLE >= (6.237391706362134::DOUBLE)
                                THEN CASE WHEN (0.578605166404944::DOUBLE) * x::DOUBLE + (-0.8156077865061779::DOUBLE) * y::DOUBLE >= (1.4992237155428092::DOUBLE)
                                  THEN 646
                                  ELSE 638
                                END
                                ELSE CASE WHEN (0.9343381747255328::DOUBLE) * x::DOUBLE + (0.3563876755031796::DOUBLE) * y::DOUBLE >= (8.244841013217446::DOUBLE)
                                  THEN 646
                                  ELSE 630
                                END
                              END
                              ELSE CASE WHEN (0.8163470711897247::DOUBLE) * x::DOUBLE + (0.577561649834854::DOUBLE) * y::DOUBLE >= (8.10890904922676::DOUBLE)
                                THEN CASE WHEN (0.3637709709449538::DOUBLE) * x::DOUBLE + (-0.9314884222027484::DOUBLE) * y::DOUBLE >= (-0.7236213275697705::DOUBLE)
                                  THEN 638
                                  ELSE 633
                                END
                                ELSE 621
                              END
                            END
                          END
                          ELSE CASE WHEN (0.664431975097382::DOUBLE) * x::DOUBLE + (0.7473487475524342::DOUBLE) * y::DOUBLE >= (7.428094173320467::DOUBLE)
                            THEN CASE WHEN (0.7875911521857067::DOUBLE) * x::DOUBLE + (-0.6161981637418202::DOUBLE) * y::DOUBLE >= (3.874734544617387::DOUBLE)
                              THEN CASE WHEN (0.14777721373069078::DOUBLE) * x::DOUBLE + (0.98902067475963::DOUBLE) * y::DOUBLE >= (4.433016634557962::DOUBLE)
                                THEN CASE WHEN (0.8611925801967518::DOUBLE) * x::DOUBLE + (-0.5082788012636974::DOUBLE) * y::DOUBLE >= (4.929983877891764::DOUBLE)
                                  THEN 659
                                  ELSE 646
                                END
                                ELSE CASE WHEN (0.9107337214089755::DOUBLE) * x::DOUBLE + (0.4129940540595693::DOUBLE) * y::DOUBLE >= (8.381596189884931::DOUBLE)
                                  THEN CASE WHEN (0.11646258635453026::DOUBLE) * x::DOUBLE + (-0.9931950795184264::DOUBLE) * y::DOUBLE >= (-2.2767637983535485::DOUBLE)
                                    THEN 664
                                    ELSE 659
                                  END
                                  ELSE CASE WHEN (0.8758656087697546::DOUBLE) * x::DOUBLE + (-0.4825551112301964::DOUBLE) * y::DOUBLE >= (5.244398444511216::DOUBLE)
                                    THEN 664
                                    ELSE 642
                                  END
                                END
                              END
                              ELSE CASE WHEN (0.6252926096702645::DOUBLE) * x::DOUBLE + (-0.7803903845459339::DOUBLE) * y::DOUBLE >= (1.934953521390784::DOUBLE)
                                THEN CASE WHEN (0.9343381747255328::DOUBLE) * x::DOUBLE + (0.3563876755031796::DOUBLE) * y::DOUBLE >= (8.244841013217446::DOUBLE)
                                  THEN 646
                                  ELSE 630
                                END
                                ELSE 621
                              END
                            END
                            ELSE CASE WHEN (0.7875911521857067::DOUBLE) * x::DOUBLE + (-0.6161981637418202::DOUBLE) * y::DOUBLE >= (3.874734544617387::DOUBLE)
                              THEN CASE WHEN (0.9649429072377204::DOUBLE) * x::DOUBLE + (-0.2624598745934629::DOUBLE) * y::DOUBLE >= (6.351420009085343::DOUBLE)
                                THEN CASE WHEN (0.43231783098621424::DOUBLE) * x::DOUBLE + (0.9017212945313952::DOUBLE) * y::DOUBLE >= (6.1082679450762605::DOUBLE)
                                  THEN 642
                                  ELSE 637
                                END
                                ELSE CASE WHEN (0.9226807332764438::DOUBLE) * x::DOUBLE + (0.3855648641155515::DOUBLE) * y::DOUBLE >= (8.110691654705924::DOUBLE)
                                  THEN 642
                                  ELSE 622
                                END
                              END
                              ELSE CASE WHEN (0.6587485641390258::DOUBLE) * x::DOUBLE + (0.752363163136508::DOUBLE) * y::DOUBLE >= (7.088572768926623::DOUBLE)
                                THEN CASE WHEN (0.5205359096088039::DOUBLE) * x::DOUBLE + (-0.8538397781830822::DOUBLE) * y::DOUBLE >= (1.07335065161285::DOUBLE)
                                  THEN CASE WHEN (0.3096348600553839::DOUBLE) * x::DOUBLE + (0.9508555376283416::DOUBLE) * y::DOUBLE >= (5.3708914384185285::DOUBLE)
                                    THEN 630
                                    ELSE 622
                                  END
                                  ELSE CASE WHEN (0.8017651933730336::DOUBLE) * x::DOUBLE + (0.5976391676383851::DOUBLE) * y::DOUBLE >= (7.858612158235721::DOUBLE)
                                    THEN 630
                                    ELSE 614
                                  END
                                END
                                ELSE CASE WHEN (0.9646454333823641::DOUBLE) * x::DOUBLE + (0.26355111051663344::DOUBLE) * y::DOUBLE >= (7.759831393841224::DOUBLE)
                                  THEN 622
                                  ELSE 599
                                END
                              END
                            END
                          END
                        END
                      END
                      ELSE CASE WHEN (0.15743938549530312::DOUBLE) * x::DOUBLE + (-0.9875286526956376::DOUBLE) * y::DOUBLE >= (-2.514691756478488::DOUBLE)
                        THEN CASE WHEN (0.9043942532386664::DOUBLE) * x::DOUBLE + (0.4266978259950183::DOUBLE) * y::DOUBLE >= (7.946838103218137::DOUBLE)
                          THEN CASE WHEN (0.08607235289601506::DOUBLE) * x::DOUBLE + (0.9962888888605271::DOUBLE) * y::DOUBLE >= (4.15723862019445::DOUBLE)
                            THEN CASE WHEN (0.8717156252331804::DOUBLE) * x::DOUBLE + (0.4900121107935245::DOUBLE) * y::DOUBLE >= (8.079109056705844::DOUBLE)
                              THEN CASE WHEN (0.9373699236200079::DOUBLE) * x::DOUBLE + (-0.3483355082282317::DOUBLE) * y::DOUBLE >= (5.561265331195504::DOUBLE)
                                THEN CASE WHEN (0.5085155698536825::DOUBLE) * x::DOUBLE + (0.8610527946742782::DOUBLE) * y::DOUBLE >= (6.94091847346011::DOUBLE)
                                  THEN CASE WHEN (0.3637709709449538::DOUBLE) * x::DOUBLE + (-0.9314884222027484::DOUBLE) * y::DOUBLE >= (-0.7236213275697705::DOUBLE)
                                    THEN 638
                                    ELSE 633
                                  END
                                  ELSE CASE WHEN (0.9971627696894408::DOUBLE) * x::DOUBLE + (0.07527556539331416::DOUBLE) * y::DOUBLE >= (7.6801090081822165::DOUBLE)
                                    THEN 638
                                    ELSE 624
                                  END
                                END
                                ELSE 610
                              END
                              ELSE CASE WHEN (0.6380711441200154::DOUBLE) * x::DOUBLE + (-0.7699774120332198::DOUBLE) * y::DOUBLE >= (1.7910937672609668::DOUBLE)
                                THEN CASE WHEN (0.17270827805130895::DOUBLE) * x::DOUBLE + (0.9849730202866227::DOUBLE) * y::DOUBLE >= (4.772136541337285::DOUBLE)
                                  THEN 610
                                  ELSE 606
                                END
                                ELSE CASE WHEN (0.9952711072792801::DOUBLE) * x::DOUBLE + (-0.09713610562028746::DOUBLE) * y::DOUBLE >= (6.759567671452625::DOUBLE)
                                  THEN 610
                                  ELSE 600
                                END
                              END
                            END
                            ELSE CASE WHEN (0.0002576593256606495::DOUBLE) * x::DOUBLE + (0.9999999668058354::DOUBLE) * y::DOUBLE >= (3.449837564895231::DOUBLE)
                              THEN CASE WHEN (0.9603797414789275::DOUBLE) * x::DOUBLE + (-0.2786947293309801::DOUBLE) * y::DOUBLE >= (5.999803192918747::DOUBLE)
                                THEN CASE WHEN (0.8163470711897247::DOUBLE) * x::DOUBLE + (0.577561649834854::DOUBLE) * y::DOUBLE >= (8.10890904922676::DOUBLE)
                                  THEN 638
                                  ELSE 621
                                END
                                ELSE 606
                              END
                              ELSE CASE WHEN (0.39959523375184614::DOUBLE) * x::DOUBLE + (-0.9166916870806713::DOUBLE) * y::DOUBLE >= (-0.1534489131086305::DOUBLE)
                                THEN CASE WHEN (0.8017651933730336::DOUBLE) * x::DOUBLE + (0.5976391676383851::DOUBLE) * y::DOUBLE >= (7.858612158235721::DOUBLE)
                                  THEN 630
                                  ELSE 614
                                END
                                ELSE CASE WHEN (0.8010174606188525::DOUBLE) * x::DOUBLE + (0.598640984049476::DOUBLE) * y::DOUBLE >= (7.869789039159711::DOUBLE)
                                  THEN CASE WHEN (0.6252926096702645::DOUBLE) * x::DOUBLE + (-0.7803903845459339::DOUBLE) * y::DOUBLE >= (1.934953521390784::DOUBLE)
                                    THEN 630
                                    ELSE 621
                                  END
                                  ELSE CASE WHEN (0.9998942358085219::DOUBLE) * x::DOUBLE + (-0.014543630801566046::DOUBLE) * y::DOUBLE >= (7.254171278089368::DOUBLE)
                                    THEN 630
                                    ELSE 605
                                  END
                                END
                              END
                            END
                          END
                          ELSE CASE WHEN (0.14770430198325726::DOUBLE) * x::DOUBLE + (0.9890315663191134::DOUBLE) * y::DOUBLE >= (4.370046928221015::DOUBLE)
                            THEN CASE WHEN (0.029909681847607533::DOUBLE) * x::DOUBLE + (-0.9995526053849165::DOUBLE) * y::DOUBLE >= (-3.3421024703880393::DOUBLE)
                              THEN CASE WHEN (0.9982421880517661::DOUBLE) * x::DOUBLE + (0.05926663474183724::DOUBLE) * y::DOUBLE >= (7.22074255256143::DOUBLE)
                                THEN CASE WHEN (0.7871362096785075::DOUBLE) * x::DOUBLE + (-0.616779204750738::DOUBLE) * y::DOUBLE >= (3.5093531138509277::DOUBLE)
                                  THEN 605
                                  ELSE 601
                                END
                                ELSE 588
                              END
                              ELSE CASE WHEN (0.9935305173719872::DOUBLE) * x::DOUBLE + (0.11356544831308263::DOUBLE) * y::DOUBLE >= (7.391787565441672::DOUBLE)
                                THEN CASE WHEN (0.027371089507537295::DOUBLE) * x::DOUBLE + (-0.9996253415451063::DOUBLE) * y::DOUBLE >= (-3.366726479407813::DOUBLE)
                                  THEN 601
                                  ELSE 600
                                END
                                ELSE CASE WHEN (0.5465226118803652::DOUBLE) * x::DOUBLE + (-0.8374443472276016::DOUBLE) * y::DOUBLE >= (0.8618851450363616::DOUBLE)
                                  THEN 601
                                  ELSE 587
                                END
                              END
                            END
                            ELSE CASE WHEN (0.4067351386770245::DOUBLE) * x::DOUBLE + (0.9135461274426057::DOUBLE) * y::DOUBLE >= (5.872083204706735::DOUBLE)
                              THEN CASE WHEN (0.3800925542065521::DOUBLE) * x::DOUBLE + (-0.9249484581514471::DOUBLE) * y::DOUBLE >= (-0.4419541879237374::DOUBLE)
                                THEN CASE WHEN (0.769397658568873::DOUBLE) * x::DOUBLE + (0.6387701018275165::DOUBLE) * y::DOUBLE >= (7.601651466312921::DOUBLE)
                                  THEN CASE WHEN (0.39959523375184614::DOUBLE) * x::DOUBLE + (-0.9166916870806713::DOUBLE) * y::DOUBLE >= (-0.1534489131086305::DOUBLE)
                                    THEN 614
                                    ELSE 605
                                  END
                                  ELSE CASE WHEN (0.999337639187223::DOUBLE) * x::DOUBLE + (-0.03639069803820258::DOUBLE) * y::DOUBLE >= (7.028229456254765::DOUBLE)
                                    THEN 614
                                    ELSE 596
                                  END
                                END
                                ELSE 588
                              END
                              ELSE CASE WHEN (0.9891606128563856::DOUBLE) * x::DOUBLE + (0.146837604085533::DOUBLE) * y::DOUBLE >= (7.363777764028551::DOUBLE)
                                THEN CASE WHEN (0.08898407761027204::DOUBLE) * x::DOUBLE + (-0.9960330486142762::DOUBLE) * y::DOUBLE >= (-2.5144761140751557::DOUBLE)
                                  THEN CASE WHEN (0.6587485641390258::DOUBLE) * x::DOUBLE + (0.752363163136508::DOUBLE) * y::DOUBLE >= (7.088572768926623::DOUBLE)
                                    THEN 614
                                    ELSE 599
                                  END
                                  ELSE CASE WHEN (0.999337639187223::DOUBLE) * x::DOUBLE + (-0.03639069803820258::DOUBLE) * y::DOUBLE >= (7.028229456254765::DOUBLE)
                                    THEN 614
                                    ELSE 596
                                  END
                                END
                                ELSE CASE WHEN (0.1786025383406026::DOUBLE) * x::DOUBLE + (0.9839213044234247::DOUBLE) * y::DOUBLE >= (4.279088778781368::DOUBLE)
                                  THEN CASE WHEN (0.7387570184051562::DOUBLE) * x::DOUBLE + (-0.6739718597665066::DOUBLE) * y::DOUBLE >= (3.0329028546211276::DOUBLE)
                                    THEN 599
                                    ELSE 580
                                  END
                                  ELSE CASE WHEN (0.9597801632265429::DOUBLE) * x::DOUBLE + (0.28075262826344244::DOUBLE) * y::DOUBLE >= (7.515529245548351::DOUBLE)
                                    THEN 599
                                    ELSE 575
                                  END
                                END
                              END
                            END
                          END
                        END
                        ELSE CASE WHEN (0.9213184354007368::DOUBLE) * x::DOUBLE + (-0.38880887411521137::DOUBLE) * y::DOUBLE >= (5.115129527473119::DOUBLE)
                          THEN CASE WHEN (0.8003970546883729::DOUBLE) * x::DOUBLE + (0.599470228490271::DOUBLE) * y::DOUBLE >= (8.247617086205413::DOUBLE)
                            THEN CASE WHEN (0.9949672122636488::DOUBLE) * x::DOUBLE + (0.10020103053513565::DOUBLE) * y::DOUBLE >= (7.933665748903958::DOUBLE)
                              THEN CASE WHEN (0.5951093425342727::DOUBLE) * x::DOUBLE + (0.8036447414302079::DOUBLE) * y::DOUBLE >= (7.687709315610787::DOUBLE)
                                THEN CASE WHEN (0.1160358369923115::DOUBLE) * x::DOUBLE + (-0.993245027439601::DOUBLE) * y::DOUBLE >= (-3.0079140004430527::DOUBLE)
                                  THEN 654
                                  ELSE 651
                                END
                                ELSE CASE WHEN (0.9857273194779379::DOUBLE) * x::DOUBLE + (-0.16834978953013033::DOUBLE) * y::DOUBLE >= (6.856924029144505::DOUBLE)
                                  THEN 654
                                  ELSE 633
                                END
                              END
                              ELSE CASE WHEN (0.3583755539944281::DOUBLE) * x::DOUBLE + (0.9335775073871407::DOUBLE) * y::DOUBLE >= (6.382866957448853::DOUBLE)
                                THEN CASE WHEN (0.10440286690801837::DOUBLE) * x::DOUBLE + (-0.9945350880594341::DOUBLE) * y::DOUBLE >= (-3.1438957326264725::DOUBLE)
                                  THEN 633
                                  ELSE 632
                                END
                                ELSE CASE WHEN (0.647485075420294::DOUBLE) * x::DOUBLE + (-0.7620781305797827::DOUBLE) * y::DOUBLE >= (1.8580480086379687::DOUBLE)
                                  THEN 633
                                  ELSE 625
                                END
                              END
                            END
                            ELSE CASE WHEN (0.647485075420294::DOUBLE) * x::DOUBLE + (-0.7620781305797827::DOUBLE) * y::DOUBLE >= (1.8580480086379687::DOUBLE)
                              THEN CASE WHEN (0.6858146860035119::DOUBLE) * x::DOUBLE + (-0.7277762131740116::DOUBLE) * y::DOUBLE >= (2.3132326272081385::DOUBLE)
                                THEN CASE WHEN (0.5085155698536825::DOUBLE) * x::DOUBLE + (0.8610527946742782::DOUBLE) * y::DOUBLE >= (6.94091847346011::DOUBLE)
                                  THEN 633
                                  ELSE 624
                                END
                                ELSE CASE WHEN (0.9871351601259621::DOUBLE) * x::DOUBLE + (0.15988800969144315::DOUBLE) * y::DOUBLE >= (7.834264028906372::DOUBLE)
                                  THEN 633
                                  ELSE 607
                                END
                              END
                              ELSE CASE WHEN (0.8114798700488158::DOUBLE) * x::DOUBLE + (0.5843803731351326::DOUBLE) * y::DOUBLE >= (7.957661721556493::DOUBLE)
                                THEN CASE WHEN (0.07772040833731772::DOUBLE) * x::DOUBLE + (0.9969751943392977::DOUBLE) * y::DOUBLE >= (4.353036766160001::DOUBLE)
                                  THEN CASE WHEN (0.9450370610725878::DOUBLE) * x::DOUBLE + (0.32696322912414166::DOUBLE) * y::DOUBLE >= (8.1492234344704::DOUBLE)
                                    THEN 625
                                    ELSE 609
                                  END
                                  ELSE CASE WHEN (0.6671928807510318::DOUBLE) * x::DOUBLE + (0.7448849977514244::DOUBLE) * y::DOUBLE >= (7.704866930093227::DOUBLE)
                                    THEN 625
                                    ELSE 607
                                  END
                                END
                                ELSE 600
                              END
                            END
                          END
                          ELSE CASE WHEN (0.05750106429121421::DOUBLE) * x::DOUBLE + (0.9983454450266087::DOUBLE) * y::DOUBLE >= (4.30388765993193::DOUBLE)
                            THEN CASE WHEN (0.8529515330830023::DOUBLE) * x::DOUBLE + (-0.5219901169671282::DOUBLE) * y::DOUBLE >= (4.0765484384782::DOUBLE)
                              THEN CASE WHEN (0.44456471321594404::DOUBLE) * x::DOUBLE + (-0.89574673639552::DOUBLE) * y::DOUBLE >= (-0.3724328145579636::DOUBLE)
                                THEN CASE WHEN (0.9450370610725878::DOUBLE) * x::DOUBLE + (0.32696322912414166::DOUBLE) * y::DOUBLE >= (8.1492234344704::DOUBLE)
                                  THEN 625
                                  ELSE 609
                                END
                                ELSE CASE WHEN (0.8271069892910344::DOUBLE) * x::DOUBLE + (-0.5620445073710094::DOUBLE) * y::DOUBLE >= (3.7331895964249986::DOUBLE)
                                  THEN 625
                                  ELSE 603
                                END
                              END
                              ELSE CASE WHEN (0.8881042250820983::DOUBLE) * x::DOUBLE + (0.45964212752023254::DOUBLE) * y::DOUBLE >= (8.109116482089718::DOUBLE)
                                THEN CASE WHEN (0.04753011475628272::DOUBLE) * x::DOUBLE + (-0.9988698054257394::DOUBLE) * y::DOUBLE >= (-3.6557510382305516::DOUBLE)
                                  THEN 604
                                  ELSE 603
                                END
                                ELSE CASE WHEN (0.8535051086746259::DOUBLE) * x::DOUBLE + (-0.5210844744053645::DOUBLE) * y::DOUBLE >= (3.9458115157247273::DOUBLE)
                                  THEN 604
                                  ELSE 589
                                END
                              END
                            END
                            ELSE CASE WHEN (0.8064710755693913::DOUBLE) * x::DOUBLE + (0.5912735443683822::DOUBLE) * y::DOUBLE >= (7.962542177189186::DOUBLE)
                              THEN CASE WHEN (0.20661109463097413::DOUBLE) * x::DOUBLE + (0.9784231475059196::DOUBLE) * y::DOUBLE >= (5.242337144421502::DOUBLE)
                                THEN CASE WHEN (0.8529515330830023::DOUBLE) * x::DOUBLE + (-0.5219901169671282::DOUBLE) * y::DOUBLE >= (4.0765484384782::DOUBLE)
                                  THEN 609
                                  ELSE 604
                                END
                                ELSE CASE WHEN (0.8816191799321513::DOUBLE) * x::DOUBLE + (0.47196146196036054::DOUBLE) * y::DOUBLE >= (8.108863448746666::DOUBLE)
                                  THEN 609
                                  ELSE 602
                                END
                              END
                              ELSE CASE WHEN (0.9935305173719872::DOUBLE) * x::DOUBLE + (0.11356544831308263::DOUBLE) * y::DOUBLE >= (7.391787565441672::DOUBLE)
                                THEN CASE WHEN (0.5987868655776735::DOUBLE) * x::DOUBLE + (-0.800908415245879::DOUBLE) * y::DOUBLE >= (1.2121341039142557::DOUBLE)
                                  THEN CASE WHEN (0.05069546370647644::DOUBLE) * x::DOUBLE + (0.998714158285335::DOUBLE) * y::DOUBLE >= (4.081240482990781::DOUBLE)
                                    THEN 602
                                    ELSE 600
                                  END
                                  ELSE CASE WHEN (0.9901520860956873::DOUBLE) * x::DOUBLE + (-0.13999587994065632::DOUBLE) * y::DOUBLE >= (6.422676647276418::DOUBLE)
                                    THEN 602
                                    ELSE 586
                                  END
                                END
                                ELSE CASE WHEN (0.01828682710598664::DOUBLE) * x::DOUBLE + (-0.9998327819962675::DOUBLE) * y::DOUBLE >= (-3.6012433861788224::DOUBLE)
                                  THEN 587
                                  ELSE 586
                                END
                              END
                            END
                          END
                        END
                      END
                    END
                    ELSE CASE WHEN (0.9365320889065809::DOUBLE) * x::DOUBLE + (-0.3505818683963506::DOUBLE) * y::DOUBLE >= (4.77517485780566::DOUBLE)
                      THEN CASE WHEN (0.39527987880272647::DOUBLE) * x::DOUBLE + (0.9185607314781651::DOUBLE) * y::DOUBLE >= (5.923192697190368::DOUBLE)
                        THEN CASE WHEN (0.8334384421447697::DOUBLE) * x::DOUBLE + (-0.5526123081829605::DOUBLE) * y::DOUBLE >= (3.5143824036696207::DOUBLE)
                          THEN CASE WHEN (0.5067877164540356::DOUBLE) * x::DOUBLE + (-0.8620708848182405::DOUBLE) * y::DOUBLE >= (0.20844305734962143::DOUBLE)
                            THEN CASE WHEN (0.21993954837482002::DOUBLE) * x::DOUBLE + (-0.9755135032692681::DOUBLE) * y::DOUBLE >= (-2.005339838179852::DOUBLE)
                              THEN CASE WHEN (0.9268495361997756::DOUBLE) * x::DOUBLE + (-0.3754329996767212::DOUBLE) * y::DOUBLE >= (4.90145536935289::DOUBLE)
                                THEN CASE WHEN (0.6637382415816993::DOUBLE) * x::DOUBLE + (0.7479649367865006::DOUBLE) * y::DOUBLE >= (7.266235888368975::DOUBLE)
                                  THEN CASE WHEN (0.029909681847607533::DOUBLE) * x::DOUBLE + (-0.9995526053849165::DOUBLE) * y::DOUBLE >= (-3.3421024703880393::DOUBLE)
                                    THEN 588
                                    ELSE 587
                                  END
                                  ELSE CASE WHEN (0.8883077467883493::DOUBLE) * x::DOUBLE + (-0.4592486766402338::DOUBLE) * y::DOUBLE >= (4.538621737369268::DOUBLE)
                                    THEN 588
                                    ELSE 577
                                  END
                                END
                                ELSE 556
                              END
                              ELSE CASE WHEN (0.9631392811563032::DOUBLE) * x::DOUBLE + (0.2690032064747916::DOUBLE) * y::DOUBLE >= (7.449390068745979::DOUBLE)
                                THEN CASE WHEN (0.7216225468311424::DOUBLE) * x::DOUBLE + (0.6922867179896895::DOUBLE) * y::DOUBLE >= (7.5646841867822445::DOUBLE)
                                  THEN CASE WHEN (0.01828682710598664::DOUBLE) * x::DOUBLE + (-0.9998327819962675::DOUBLE) * y::DOUBLE >= (-3.6012433861788224::DOUBLE)
                                    THEN 587
                                    ELSE 586
                                  END
                                  ELSE CASE WHEN (0.9808775105368579::DOUBLE) * x::DOUBLE + (-0.1946260756502485::DOUBLE) * y::DOUBLE >= (6.0486183080697895::DOUBLE)
                                    THEN 587
                                    ELSE 574
                                  END
                                END
                                ELSE 556
                              END
                            END
                            ELSE CASE WHEN (0.7332472996800872::DOUBLE) * x::DOUBLE + (0.679962055935374::DOUBLE) * y::DOUBLE >= (7.61317665064627::DOUBLE)
                              THEN CASE WHEN (0.7041680192127463::DOUBLE) * x::DOUBLE + (-0.7100333800026568::DOUBLE) * y::DOUBLE >= (2.119952853954288::DOUBLE)
                                THEN CASE WHEN (0.05750106429121421::DOUBLE) * x::DOUBLE + (0.9983454450266087::DOUBLE) * y::DOUBLE >= (4.30388765993193::DOUBLE)
                                  THEN 589
                                  ELSE 586
                                END
                                ELSE CASE WHEN (0.8103160232744026::DOUBLE) * x::DOUBLE + (0.5859931248954702::DOUBLE) * y::DOUBLE >= (7.926201204669546::DOUBLE)
                                  THEN 589
                                  ELSE 578
                                END
                              END
                              ELSE CASE WHEN (0.541847389507494::DOUBLE) * x::DOUBLE + (0.8404768922962214::DOUBLE) * y::DOUBLE >= (6.739303216731138::DOUBLE)
                                THEN CASE WHEN (0.9999924710898355::DOUBLE) * x::DOUBLE + (0.003880433435136776::DOUBLE) * y::DOUBLE >= (6.865677699825732::DOUBLE)
                                  THEN 586
                                  ELSE 565
                                END
                                ELSE 556
                              END
                            END
                          END
                          ELSE CASE WHEN (0.541847389507494::DOUBLE) * x::DOUBLE + (0.8404768922962214::DOUBLE) * y::DOUBLE >= (6.739303216731138::DOUBLE)
                            THEN CASE WHEN (0.9946489512485399::DOUBLE) * x::DOUBLE + (0.10331245704260288::DOUBLE) * y::DOUBLE >= (7.057457292981658::DOUBLE)
                              THEN CASE WHEN (0.08265123363418311::DOUBLE) * x::DOUBLE + (0.9965785335731188::DOUBLE) * y::DOUBLE >= (4.471637096386449::DOUBLE)
                                THEN CASE WHEN (0.6281250332721241::DOUBLE) * x::DOUBLE + (-0.7781124228393306::DOUBLE) * y::DOUBLE >= (1.1773298667467471::DOUBLE)
                                  THEN CASE WHEN (0.8103160232744026::DOUBLE) * x::DOUBLE + (0.5859931248954702::DOUBLE) * y::DOUBLE >= (7.926201204669546::DOUBLE)
                                    THEN 589
                                    ELSE 578
                                  END
                                  ELSE CASE WHEN (0.9862914792211934::DOUBLE) * x::DOUBLE + (-0.16501247836351737::DOUBLE) * y::DOUBLE >= (6.107851228701677::DOUBLE)
                                    THEN 589
                                    ELSE 569
                                  END
                                END
                                ELSE CASE WHEN (0.7332472996800872::DOUBLE) * x::DOUBLE + (0.679962055935374::DOUBLE) * y::DOUBLE >= (7.61317665064627::DOUBLE)
                                  THEN 578
                                  ELSE 565
                                END
                              END
                              ELSE CASE WHEN (0.032034314185074055::DOUBLE) * x::DOUBLE + (0.9994867696546524::DOUBLE) * y::DOUBLE >= (4.135880712233552::DOUBLE)
                                THEN CASE WHEN (0.5576404998330377::DOUBLE) * x::DOUBLE + (-0.8300825699567242::DOUBLE) * y::DOUBLE >= (0.46470612940895206::DOUBLE)
                                  THEN 565
                                  ELSE 555
                                END
                                ELSE CASE WHEN (0.9945557466333614::DOUBLE) * x::DOUBLE + (-0.10420588677496571::DOUBLE) * y::DOUBLE >= (6.229329150994836::DOUBLE)
                                  THEN 565
                                  ELSE 554
                                END
                              END
                            END
                            ELSE CASE WHEN (0.9589345188887236::DOUBLE) * x::DOUBLE + (-0.2836275524057072::DOUBLE) * y::DOUBLE >= (5.199987556926558::DOUBLE)
                              THEN CASE WHEN (0.11502076063487227::DOUBLE) * x::DOUBLE + (-0.9933630880111135::DOUBLE) * y::DOUBLE >= (-2.9384893462387036::DOUBLE)
                                THEN 556
                                ELSE 554
                              END
                              ELSE CASE WHEN (0.3449677149462199::DOUBLE) * x::DOUBLE + (0.9386145511576004::DOUBLE) * y::DOUBLE >= (5.746461263425049::DOUBLE)
                                THEN CASE WHEN (0.9945419031057402::DOUBLE) * x::DOUBLE + (-0.10433792678989026::DOUBLE) * y::DOUBLE >= (6.083639169506906::DOUBLE)
                                  THEN 554
                                  ELSE 541
                                END
                                ELSE CASE WHEN (0.8057982257030456::DOUBLE) * x::DOUBLE + (0.5921901885828772::DOUBLE) * y::DOUBLE >= (7.453461567430622::DOUBLE)
                                  THEN 554
                                  ELSE 534
                                END
                              END
                            END
                          END
                        END
                        ELSE CASE WHEN (0.9730731282802605::DOUBLE) * x::DOUBLE + (0.23049660956046117::DOUBLE) * y::DOUBLE >= (7.252143974837076::DOUBLE)
                          THEN CASE WHEN (0.4067351386770245::DOUBLE) * x::DOUBLE + (0.9135461274426057::DOUBLE) * y::DOUBLE >= (5.872083204706735::DOUBLE)
                            THEN CASE WHEN (0.5666629347633385::DOUBLE) * x::DOUBLE + (-0.8239497062111257::DOUBLE) * y::DOUBLE >= (0.8892110028091338::DOUBLE)
                              THEN CASE WHEN (0.7040961656346549::DOUBLE) * x::DOUBLE + (0.7101046328102475::DOUBLE) * y::DOUBLE >= (7.252287836464836::DOUBLE)
                                THEN CASE WHEN (0.8883077467883493::DOUBLE) * x::DOUBLE + (-0.4592486766402338::DOUBLE) * y::DOUBLE >= (4.538621737369268::DOUBLE)
                                  THEN 588
                                  ELSE 577
                                END
                                ELSE CASE WHEN (0.9815881294217036::DOUBLE) * x::DOUBLE + (0.19100980126265993::DOUBLE) * y::DOUBLE >= (7.391921415923258::DOUBLE)
                                  THEN 588
                                  ELSE 567
                                END
                              END
                              ELSE CASE WHEN (0.9268495361997756::DOUBLE) * x::DOUBLE + (-0.3754329996767212::DOUBLE) * y::DOUBLE >= (4.90145536935289::DOUBLE)
                                THEN 577
                                ELSE 556
                              END
                            END
                            ELSE CASE WHEN (0.3989042668834076::DOUBLE) * x::DOUBLE + (0.9169925767759579::DOUBLE) * y::DOUBLE >= (5.690454064625469::DOUBLE)
                              THEN CASE WHEN (0.5498909458528943::DOUBLE) * x::DOUBLE + (-0.8352364621285455::DOUBLE) * y::DOUBLE >= (0.9687901765623628::DOUBLE)
                                THEN 580
                                ELSE 567
                              END
                              ELSE CASE WHEN (0.6909751973546303::DOUBLE) * x::DOUBLE + (-0.7228784660236669::DOUBLE) * y::DOUBLE >= (2.4318344629551616::DOUBLE)
                                THEN CASE WHEN (0.1786025383406026::DOUBLE) * x::DOUBLE + (0.9839213044234247::DOUBLE) * y::DOUBLE >= (4.279088778781368::DOUBLE)
                                  THEN 580
                                  ELSE 575
                                END
                                ELSE CASE WHEN (0.9613148980969266::DOUBLE) * x::DOUBLE + (0.27545175021570567::DOUBLE) * y::DOUBLE >= (7.377959993876565::DOUBLE)
                                  THEN 580
                                  ELSE 558
                                END
                              END
                            END
                          END
                          ELSE CASE WHEN (0.6707789518918593::DOUBLE) * x::DOUBLE + (-0.7416573317232552::DOUBLE) * y::DOUBLE >= (1.9384402045177818::DOUBLE)
                            THEN CASE WHEN (0.3089834091037222::DOUBLE) * x::DOUBLE + (0.9510674281556708::DOUBLE) * y::DOUBLE >= (5.030969083806582::DOUBLE)
                              THEN CASE WHEN (0.43588599487851265::DOUBLE) * x::DOUBLE + (-0.9000018885917791::DOUBLE) * y::DOUBLE >= (-0.06609422325580283::DOUBLE)
                                THEN 558
                                ELSE 550
                              END
                              ELSE CASE WHEN (0.7850478312427357::DOUBLE) * x::DOUBLE + (0.619435148067235::DOUBLE) * y::DOUBLE >= (7.0401138483888515::DOUBLE)
                                THEN 558
                                ELSE 539
                              END
                            END
                            ELSE CASE WHEN (0.25445894582924117::DOUBLE) * x::DOUBLE + (0.967083576991912::DOUBLE) * y::DOUBLE >= (5.051724785454174::DOUBLE)
                              THEN CASE WHEN (0.11629004302533572::DOUBLE) * x::DOUBLE + (0.9932152968481534::DOUBLE) * y::DOUBLE >= (4.288190632698335::DOUBLE)
                                THEN CASE WHEN (0.9589345188887236::DOUBLE) * x::DOUBLE + (-0.2836275524057072::DOUBLE) * y::DOUBLE >= (5.199987556926558::DOUBLE)
                                  THEN 556
                                  ELSE 534
                                END
                                ELSE CASE WHEN (0.8424516661731855::DOUBLE) * x::DOUBLE + (0.5387719277783725::DOUBLE) * y::DOUBLE >= (7.372888401551954::DOUBLE)
                                  THEN 556
                                  ELSE 531
                                END
                              END
                              ELSE CASE WHEN (0.5028308473308513::DOUBLE) * x::DOUBLE + (0.8643848326830695::DOUBLE) * y::DOUBLE >= (6.0518036034092475::DOUBLE)
                                THEN CASE WHEN (0.8941212426824784::DOUBLE) * x::DOUBLE + (-0.44782496958514995::DOUBLE) * y::DOUBLE >= (4.244234323847847::DOUBLE)
                                  THEN 550
                                  ELSE 531
                                END
                                ELSE CASE WHEN (0.9082595658388121::DOUBLE) * x::DOUBLE + (0.4184071713800957::DOUBLE) * y::DOUBLE >= (7.178725068867233::DOUBLE)
                                  THEN 550
                                  ELSE 520
                                END
                              END
                            END
                          END
                        END
                      END
                      ELSE CASE WHEN (0.3449677149462199::DOUBLE) * x::DOUBLE + (0.9386145511576004::DOUBLE) * y::DOUBLE >= (5.746461263425049::DOUBLE)
                        THEN CASE WHEN (0.7818278324693413::DOUBLE) * x::DOUBLE + (-0.6234943787848386::DOUBLE) * y::DOUBLE >= (2.4241453268892537::DOUBLE)
                          THEN CASE WHEN (0.0829723098192716::DOUBLE) * x::DOUBLE + (0.9965518530429086::DOUBLE) * y::DOUBLE >= (4.469673557555244::DOUBLE)
                            THEN CASE WHEN (0.8577845370629364::DOUBLE) * x::DOUBLE + (-0.5140094240145056::DOUBLE) * y::DOUBLE >= (3.3936270569798657::DOUBLE)
                              THEN CASE WHEN (0.23586554432781148::DOUBLE) * x::DOUBLE + (0.9717856991121784::DOUBLE) * y::DOUBLE >= (5.46040755242651::DOUBLE)
                                THEN CASE WHEN (0.7835232420846296::DOUBLE) * x::DOUBLE + (-0.6213624780377319::DOUBLE) * y::DOUBLE >= (2.5842977591089933::DOUBLE)
                                  THEN 555
                                  ELSE 545
                                END
                                ELSE CASE WHEN (0.9630862177995414::DOUBLE) * x::DOUBLE + (0.26919312228319353::DOUBLE) * y::DOUBLE >= (7.350364743481505::DOUBLE)
                                  THEN 555
                                  ELSE 540
                                END
                              END
                              ELSE CASE WHEN (0.9281619517794422::DOUBLE) * x::DOUBLE + (0.37217655926855003::DOUBLE) * y::DOUBLE >= (7.44784843874673::DOUBLE)
                                THEN 545
                                ELSE 529
                              END
                            END
                            ELSE CASE WHEN (0.7870893787647057::DOUBLE) * x::DOUBLE + (0.616838965886389::DOUBLE) * y::DOUBLE >= (7.422446672398976::DOUBLE)
                              THEN CASE WHEN (0.9630862177995414::DOUBLE) * x::DOUBLE + (0.26919312228319353::DOUBLE) * y::DOUBLE >= (7.350364743481505::DOUBLE)
                                THEN CASE WHEN (0.032034314185074055::DOUBLE) * x::DOUBLE + (0.9994867696546524::DOUBLE) * y::DOUBLE >= (4.135880712233552::DOUBLE)
                                  THEN 555
                                  ELSE 554
                                END
                                ELSE CASE WHEN (0.13363488099441803::DOUBLE) * x::DOUBLE + (-0.9910306345323577::DOUBLE) * y::DOUBLE >= (-3.015354772738107::DOUBLE)
                                  THEN CASE WHEN (0.9945419031057402::DOUBLE) * x::DOUBLE + (-0.10433792678989026::DOUBLE) * y::DOUBLE >= (6.083639169506906::DOUBLE)
                                    THEN 554
                                    ELSE 541
                                  END
                                  ELSE CASE WHEN (0.7181240534637147::DOUBLE) * x::DOUBLE + (-0.6959151125222414::DOUBLE) * y::DOUBLE >= (1.9582698915413657::DOUBLE)
                                    THEN 554
                                    ELSE 540
                                  END
                                END
                              END
                              ELSE CASE WHEN (0.9922924501227921::DOUBLE) * x::DOUBLE + (-0.12391809161420275::DOUBLE) * y::DOUBLE >= (5.839694812383263::DOUBLE)
                                THEN 541
                                ELSE 527
                              END
                            END
                          END
                          ELSE CASE WHEN (0.9910930725633593::DOUBLE) * x::DOUBLE + (0.13317102356338556::DOUBLE) * y::DOUBLE >= (6.560669516293827::DOUBLE)
                            THEN CASE WHEN (0.7565146696976698::DOUBLE) * x::DOUBLE + (-0.6539767232342644::DOUBLE) * y::DOUBLE >= (1.970026592081053::DOUBLE)
                              THEN CASE WHEN (0.4511663012906795::DOUBLE) * x::DOUBLE + (0.8924398963401893::DOUBLE) * y::DOUBLE >= (6.444650601153351::DOUBLE)
                                THEN CASE WHEN (0.1607575787007596::DOUBLE) * x::DOUBLE + (-0.9869939214049238::DOUBLE) * y::DOUBLE >= (-3.062553621127779::DOUBLE)
                                  THEN CASE WHEN (0.9281619517794422::DOUBLE) * x::DOUBLE + (0.37217655926855003::DOUBLE) * y::DOUBLE >= (7.44784843874673::DOUBLE)
                                    THEN 545
                                    ELSE 529
                                  END
                                  ELSE CASE WHEN (0.9428932149125747::DOUBLE) * x::DOUBLE + (-0.3330951594842368::DOUBLE) * y::DOUBLE >= (4.622116756398132::DOUBLE)
                                    THEN 545
                                    ELSE 524
                                  END
                                END
                                ELSE CASE WHEN (0.8184791494715501::DOUBLE) * x::DOUBLE + (0.5745362319996259::DOUBLE) * y::DOUBLE >= (7.402392671682085::DOUBLE)
                                  THEN 529
                                  ELSE 518
                                END
                              END
                              ELSE CASE WHEN (0.49121659799986367::DOUBLE) * x::DOUBLE + (0.8710374583503515::DOUBLE) * y::DOUBLE >= (6.629182466964953::DOUBLE)
                                THEN CASE WHEN (0.852810739201468::DOUBLE) * x::DOUBLE + (-0.5222201098221378::DOUBLE) * y::DOUBLE >= (3.0716755765518173::DOUBLE)
                                  THEN 524
                                  ELSE 515
                                END
                                ELSE CASE WHEN (0.9317990022998829::DOUBLE) * x::DOUBLE + (0.3629746813662668::DOUBLE) * y::DOUBLE >= (7.2279095606659345::DOUBLE)
                                  THEN 524
                                  ELSE 502
                                END
                              END
                            END
                            ELSE CASE WHEN (0.33673859809058354::DOUBLE) * x::DOUBLE + (-0.9415981714914214::DOUBLE) * y::DOUBLE >= (-1.925859124946398::DOUBLE)
                              THEN CASE WHEN (0.8004019323455968::DOUBLE) * x::DOUBLE + (-0.5994637159140116::DOUBLE) * y::DOUBLE >= (2.285704727088389::DOUBLE)
                                THEN CASE WHEN (0.3336910253276174::DOUBLE) * x::DOUBLE + (0.942682502020592::DOUBLE) * y::DOUBLE >= (5.727899502388002::DOUBLE)
                                  THEN CASE WHEN (0.7565146696976698::DOUBLE) * x::DOUBLE + (-0.6539767232342644::DOUBLE) * y::DOUBLE >= (1.970026592081053::DOUBLE)
                                    THEN 518
                                    ELSE 502
                                  END
                                  ELSE CASE WHEN (0.8888042993856178::DOUBLE) * x::DOUBLE + (0.4582869378387746::DOUBLE) * y::DOUBLE >= (7.155612140280299::DOUBLE)
                                    THEN 518
                                    ELSE 496
                                  END
                                END
                                ELSE CASE WHEN (0.9788850073608406::DOUBLE) * x::DOUBLE + (0.20441169820772706::DOUBLE) * y::DOUBLE >= (6.549197026858384::DOUBLE)
                                  THEN 502
                                  ELSE 477
                                END
                              END
                              ELSE 497
                            END
                          END
                        END
                        ELSE CASE WHEN (0.44859836470279635::DOUBLE) * x::DOUBLE + (0.8937334654056415::DOUBLE) * y::DOUBLE >= (5.888326102149245::DOUBLE)
                          THEN CASE WHEN (0.7818278324693413::DOUBLE) * x::DOUBLE + (-0.6234943787848386::DOUBLE) * y::DOUBLE >= (2.4241453268892537::DOUBLE)
                            THEN CASE WHEN (0.5717816368027386::DOUBLE) * x::DOUBLE + (0.820405850670984::DOUBLE) * y::DOUBLE >= (6.6431192786289825::DOUBLE)
                              THEN CASE WHEN (0.5173094957223066::DOUBLE) * x::DOUBLE + (-0.8557983907647484::DOUBLE) * y::DOUBLE >= (0.04923662589108524::DOUBLE)
                                THEN 534
                                ELSE 527
                              END
                              ELSE CASE WHEN (0.7200492327406992::DOUBLE) * x::DOUBLE + (-0.6939229801855035::DOUBLE) * y::DOUBLE >= (2.0316754447290095::DOUBLE)
                                THEN CASE WHEN (0.11629004302533572::DOUBLE) * x::DOUBLE + (0.9932152968481534::DOUBLE) * y::DOUBLE >= (4.288190632698335::DOUBLE)
                                  THEN 534
                                  ELSE 531
                                END
                                ELSE CASE WHEN (0.9984156541319337::DOUBLE) * x::DOUBLE + (0.05626883315213741::DOUBLE) * y::DOUBLE >= (6.4660863712991805::DOUBLE)
                                  THEN 534
                                  ELSE 516
                                END
                              END
                            END
                            ELSE CASE WHEN (0.5569394854574758::DOUBLE) * x::DOUBLE + (0.8305530744861294::DOUBLE) * y::DOUBLE >= (6.311825682474162::DOUBLE)
                              THEN CASE WHEN (0.7999140018770253::DOUBLE) * x::DOUBLE + (-0.6001146470476141::DOUBLE) * y::DOUBLE >= (2.5738263819739524::DOUBLE)
                                THEN CASE WHEN (0.041067681842706816::DOUBLE) * x::DOUBLE + (0.9991563668956258::DOUBLE) * y::DOUBLE >= (4.064715989795257::DOUBLE)
                                  THEN 518
                                  ELSE 516
                                END
                                ELSE CASE WHEN (0.8888042993856178::DOUBLE) * x::DOUBLE + (0.4582869378387746::DOUBLE) * y::DOUBLE >= (7.155612140280299::DOUBLE)
                                  THEN 518
                                  ELSE 496
                                END
                              END
                              ELSE CASE WHEN (0.9620577414605668::DOUBLE) * x::DOUBLE + (0.2728459310596244::DOUBLE) * y::DOUBLE >= (6.696537010361679::DOUBLE)
                                THEN 516
                                ELSE 484
                              END
                            END
                          END
                          ELSE CASE WHEN (0.8913853884923095::DOUBLE) * x::DOUBLE + (-0.45324616841448817::DOUBLE) * y::DOUBLE >= (3.6569722915618166::DOUBLE)
                            THEN CASE WHEN (0.7434331018670084::DOUBLE) * x::DOUBLE + (0.6688103042331199::DOUBLE) * y::DOUBLE >= (6.638845434051422::DOUBLE)
                              THEN CASE WHEN (0.7542579269050226::DOUBLE) * x::DOUBLE + (-0.6565782357807314::DOUBLE) * y::DOUBLE >= (2.4416659616918963::DOUBLE)
                                THEN CASE WHEN (0.5028308473308513::DOUBLE) * x::DOUBLE + (0.8643848326830695::DOUBLE) * y::DOUBLE >= (6.0518036034092475::DOUBLE)
                                  THEN 531
                                  ELSE 520
                                END
                                ELSE CASE WHEN (0.9880931650316442::DOUBLE) * x::DOUBLE + (0.15385674251636738::DOUBLE) * y::DOUBLE >= (6.643792558279523::DOUBLE)
                                  THEN 531
                                  ELSE 505
                                END
                              END
                              ELSE CASE WHEN (0.9706399232611684::DOUBLE) * x::DOUBLE + (0.24053718916532077::DOUBLE) * y::DOUBLE >= (6.375753808203073::DOUBLE)
                                THEN CASE WHEN (0.0012056545089568491::DOUBLE) * x::DOUBLE + (0.9999992731983384::DOUBLE) * y::DOUBLE >= (3.223333672494376::DOUBLE)
                                  THEN 505
                                  ELSE 504
                                END
                                ELSE CASE WHEN (0.6194850542418076::DOUBLE) * x::DOUBLE + (0.7850084506366951::DOUBLE) * y::DOUBLE >= (6.100271571660846::DOUBLE)
                                  THEN 505
                                  ELSE 470
                                END
                              END
                            END
                            ELSE CASE WHEN (0.4243486683249894::DOUBLE) * x::DOUBLE + (-0.9054988722747302::DOUBLE) * y::DOUBLE >= (-0.5357287778515243::DOUBLE)
                              THEN CASE WHEN (0.13192559388175995::DOUBLE) * x::DOUBLE + (0.9912596217333505::DOUBLE) * y::DOUBLE >= (3.9652427730607775::DOUBLE)
                                THEN 484
                                ELSE 470
                              END
                              ELSE CASE WHEN (0.9330670933237378::DOUBLE) * x::DOUBLE + (0.35970237607832245::DOUBLE) * y::DOUBLE >= (6.453217343125636::DOUBLE)
                                THEN 484
                                ELSE 456
                              END
                            END
                          END
                        END
                      END
                    END
                  END
                END
              END
            END
            ELSE CASE WHEN (0.9874948329944009::DOUBLE) * x::DOUBLE + (0.15765137109889166::DOUBLE) * y::DOUBLE >= (3.95993670264319::DOUBLE)
              THEN CASE WHEN (0.8856281381843857::DOUBLE) * x::DOUBLE + (-0.46439509133501694::DOUBLE) * y::DOUBLE >= (1.8567109895727172::DOUBLE)
                THEN CASE WHEN (0.481645385934408::DOUBLE) * x::DOUBLE + (0.8763662032552916::DOUBLE) * y::DOUBLE >= (6.57127673779001::DOUBLE)
                  THEN CASE WHEN (0.011192612251744031::DOUBLE) * x::DOUBLE + (0.9999373607536535::DOUBLE) * y::DOUBLE >= (5.176607820956395::DOUBLE)
                    THEN CASE WHEN (0.30311241359134644::DOUBLE) * x::DOUBLE + (0.9529548072845997::DOUBLE) * y::DOUBLE >= (7.250238267971635::DOUBLE)
                      THEN CASE WHEN (0.6372635821776933::DOUBLE) * x::DOUBLE + (0.7706459153398884::DOUBLE) * y::DOUBLE >= (9.13767259575267::DOUBLE)
                        THEN CASE WHEN (0.20647211475792107::DOUBLE) * x::DOUBLE + (0.9784524852170349::DOUBLE) * y::DOUBLE >= (8.74218089429732::DOUBLE)
                          THEN CASE WHEN (0.996970030982381::DOUBLE) * x::DOUBLE + (-0.07778661403474305::DOUBLE) * y::DOUBLE >= (5.868576138252906::DOUBLE)
                            THEN CASE WHEN (0.382763996567691::DOUBLE) * x::DOUBLE + (-0.9238461576104154::DOUBLE) * y::DOUBLE >= (-4.470813224364335::DOUBLE)
                              THEN CASE WHEN (0.439597386507974::DOUBLE) * x::DOUBLE + (0.8981949330603903::DOUBLE) * y::DOUBLE >= (9.768125794707567::DOUBLE)
                                THEN 581
                                ELSE 561
                              END
                              ELSE CASE WHEN (0.9993748979574812::DOUBLE) * x::DOUBLE + (-0.03535269908329357::DOUBLE) * y::DOUBLE >= (6.405765075823421::DOUBLE)
                                THEN 581
                                ELSE 546
                              END
                            END
                            ELSE CASE WHEN (0.3939290074410568::DOUBLE) * x::DOUBLE + (-0.9191408690165527::DOUBLE) * y::DOUBLE >= (-4.648291677067367::DOUBLE)
                              THEN CASE WHEN (0.6772408278297505::DOUBLE) * x::DOUBLE + (0.7357614158954479::DOUBLE) * y::DOUBLE >= (9.943856837131325::DOUBLE)
                                THEN 546
                                ELSE 519
                              END
                              ELSE CASE WHEN (0.9920479959165908::DOUBLE) * x::DOUBLE + (-0.12586013585673594::DOUBLE) * y::DOUBLE >= (5.244953241353213::DOUBLE)
                                THEN 546
                                ELSE 511
                              END
                            END
                          END
                          ELSE CASE WHEN (0.05554246668512555::DOUBLE) * x::DOUBLE + (-0.9984563257321433::DOUBLE) * y::DOUBLE >= (-6.384644832928653::DOUBLE)
                            THEN 536
                            ELSE CASE WHEN (0.7685514288289909::DOUBLE) * x::DOUBLE + (0.6397880127393109::DOUBLE) * y::DOUBLE >= (9.304580404382712::DOUBLE)
                              THEN CASE WHEN (0.9826951740983699::DOUBLE) * x::DOUBLE + (-0.18523011311278345::DOUBLE) * y::DOUBLE >= (4.699580850642224::DOUBLE)
                                THEN CASE WHEN (0.6243873767055932::DOUBLE) * x::DOUBLE + (-0.781114846748356::DOUBLE) * y::DOUBLE >= (-1.8836314004324541::DOUBLE)
                                  THEN CASE WHEN (0.005286943391934601::DOUBLE) * x::DOUBLE + (0.9999860240171212::DOUBLE) * y::DOUBLE >= (7.195725163327072::DOUBLE)
                                    THEN CASE WHEN (0.992605154986485::DOUBLE) * x::DOUBLE + (-0.12138783421025359::DOUBLE) * y::DOUBLE >= (5.583819031258147::DOUBLE)
                                      THEN 561
                                      ELSE 533
                                    END
                                    ELSE CASE WHEN (0.6519690522062608::DOUBLE) * x::DOUBLE + (0.7582455769506803::DOUBLE) * y::DOUBLE >= (9.668726915030462::DOUBLE)
                                      THEN 561
                                      ELSE 532
                                    END
                                  END
                                  ELSE 519
                                END
                                ELSE CASE WHEN (0.9126648891569126::DOUBLE) * x::DOUBLE + (0.40870869834174123::DOUBLE) * y::DOUBLE >= (8.627416093430035::DOUBLE)
                                  THEN 519
                                  ELSE 499
                                END
                              END
                              ELSE CASE WHEN (0.9999972048590673::DOUBLE) * x::DOUBLE + (-0.002364376038729915::DOUBLE) * y::DOUBLE >= (6.126496947272631::DOUBLE)
                                THEN 532
                                ELSE CASE WHEN (0.7209975251361473::DOUBLE) * x::DOUBLE + (-0.6929376369829761::DOUBLE) * y::DOUBLE >= (-0.7477528475440947::DOUBLE)
                                  THEN CASE WHEN (0.13667074805813909::DOUBLE) * x::DOUBLE + (0.9906165285443347::DOUBLE) * y::DOUBLE >= (7.945102297210781::DOUBLE)
                                    THEN 499
                                    ELSE 495
                                  END
                                  ELSE CASE WHEN (0.8431704778949606::DOUBLE) * x::DOUBLE + (0.5376463012114783::DOUBLE) * y::DOUBLE >= (8.841576166345444::DOUBLE)
                                    THEN 499
                                    ELSE 472
                                  END
                                END
                              END
                            END
                          END
                        END
                        ELSE CASE WHEN (0.8282994281675117::DOUBLE) * x::DOUBLE + (-0.5602856925688653::DOUBLE) * y::DOUBLE >= (1.3975606311218414::DOUBLE)
                          THEN CASE WHEN (0.7129953491081726::DOUBLE) * x::DOUBLE + (-0.701168761533281::DOUBLE) * y::DOUBLE >= (0.15577201982527988::DOUBLE)
                            THEN CASE WHEN (0.9672172580935398::DOUBLE) * x::DOUBLE + (0.25395034090549057::DOUBLE) * y::DOUBLE >= (7.599339759247082::DOUBLE)
                              THEN 542
                              ELSE CASE WHEN (0.2863052257320081::DOUBLE) * x::DOUBLE + (0.9581384647943864::DOUBLE) * y::DOUBLE >= (7.2828436216853945::DOUBLE)
                                THEN CASE WHEN (0.5177319698557001::DOUBLE) * x::DOUBLE + (-0.8555428729113093::DOUBLE) * y::DOUBLE >= (-1.7303179218861096::DOUBLE)
                                  THEN 530
                                  ELSE 509
                                END
                                ELSE CASE WHEN (0.9957413922903202::DOUBLE) * x::DOUBLE + (-0.09219045330040762::DOUBLE) * y::DOUBLE >= (5.614191640347483::DOUBLE)
                                  THEN 530
                                  ELSE 498
                                END
                              END
                            END
                            ELSE CASE WHEN (0.9994719885147662::DOUBLE) * x::DOUBLE + (0.03249221713486118::DOUBLE) * y::DOUBLE >= (6.405308766932966::DOUBLE)
                              THEN CASE WHEN (0.5146049083154698::DOUBLE) * x::DOUBLE + (0.857427424530862::DOUBLE) * y::DOUBLE >= (8.584247615837342::DOUBLE)
                                THEN CASE WHEN (0.13147700015025782::DOUBLE) * x::DOUBLE + (-0.991319221255943::DOUBLE) * y::DOUBLE >= (-5.416244035870951::DOUBLE)
                                  THEN 542
                                  ELSE 536
                                END
                                ELSE CASE WHEN (0.9672172580935398::DOUBLE) * x::DOUBLE + (0.25395034090549057::DOUBLE) * y::DOUBLE >= (7.599339759247082::DOUBLE)
                                  THEN 542
                                  ELSE 509
                                END
                              END
                              ELSE CASE WHEN (0.9048733560338806::DOUBLE) * x::DOUBLE + (0.42568087758317497::DOUBLE) * y::DOUBLE >= (7.8597564221455904::DOUBLE)
                                THEN CASE WHEN (0.16411819669564406::DOUBLE) * x::DOUBLE + (-0.9864406811934359::DOUBLE) * y::DOUBLE >= (-5.1844980857653225::DOUBLE)
                                  THEN 509
                                  ELSE 500
                                END
                                ELSE 483
                              END
                            END
                          END
                          ELSE CASE WHEN (0.877904634846738::DOUBLE) * x::DOUBLE + (0.47883551676396724::DOUBLE) * y::DOUBLE >= (8.173219844897423::DOUBLE)
                            THEN CASE WHEN (0.9994719885147662::DOUBLE) * x::DOUBLE + (0.03249221713486118::DOUBLE) * y::DOUBLE >= (6.405308766932966::DOUBLE)
                              THEN 536
                              ELSE CASE WHEN (0.8314557674586489::DOUBLE) * x::DOUBLE + (0.5555909527338877::DOUBLE) * y::DOUBLE >= (8.553625853806508::DOUBLE)
                                THEN CASE WHEN (0.17900458990599893::DOUBLE) * x::DOUBLE + (-0.9838482386997423::DOUBLE) * y::DOUBLE >= (-5.568748262642129::DOUBLE)
                                  THEN 500
                                  ELSE 495
                                END
                                ELSE CASE WHEN (0.9275538869006036::DOUBLE) * x::DOUBLE + (-0.3736894257208548::DOUBLE) * y::DOUBLE >= (2.8704560368749283::DOUBLE)
                                  THEN 500
                                  ELSE 463
                                END
                              END
                            END
                            ELSE CASE WHEN (0.6147708904107957::DOUBLE) * x::DOUBLE + (0.7887057450681575::DOUBLE) * y::DOUBLE >= (8.272520726105132::DOUBLE)
                              THEN CASE WHEN (0.2570294909306363::DOUBLE) * x::DOUBLE + (-0.9664035600058279::DOUBLE) * y::DOUBLE >= (-4.859779504381572::DOUBLE)
                                THEN CASE WHEN (0.19497996913466828::DOUBLE) * x::DOUBLE + (-0.9808072245024727::DOUBLE) * y::DOUBLE >= (-4.851570083125432::DOUBLE)
                                  THEN 483
                                  ELSE 469
                                END
                                ELSE 463
                              END
                              ELSE CASE WHEN (0.23123568866696073::DOUBLE) * x::DOUBLE + (0.9728977625047331::DOUBLE) * y::DOUBLE >= (7.012345273302788::DOUBLE)
                                THEN CASE WHEN (0.8076108637190234::DOUBLE) * x::DOUBLE + (-0.5897157728965821::DOUBLE) * y::DOUBLE >= (0.9942120790874536::DOUBLE)
                                  THEN 483
                                  ELSE 457
                                END
                                ELSE CASE WHEN (0.995181358128653::DOUBLE) * x::DOUBLE + (0.09805133570334196::DOUBLE) * y::DOUBLE >= (6.084807945166118::DOUBLE)
                                  THEN 483
                                  ELSE 447
                                END
                              END
                            END
                          END
                        END
                      END
                      ELSE CASE WHEN (0.8500823351768584::DOUBLE) * x::DOUBLE + (0.5266498109942314::DOUBLE) * y::DOUBLE >= (7.32725327753578::DOUBLE)
                        THEN CASE WHEN (0.7129953491081726::DOUBLE) * x::DOUBLE + (-0.701168761533281::DOUBLE) * y::DOUBLE >= (0.15577201982527988::DOUBLE)
                          THEN CASE WHEN (0.9999847374925672::DOUBLE) * x::DOUBLE + (0.005524923702771534::DOUBLE) * y::DOUBLE >= (5.857466295187139::DOUBLE)
                            THEN CASE WHEN (0.09942834152562952::DOUBLE) * x::DOUBLE + (-0.995044725075945::DOUBLE) * y::DOUBLE >= (-4.716811522379766::DOUBLE)
                              THEN CASE WHEN (0.7811942649560718::DOUBLE) * x::DOUBLE + (0.624288010776871::DOUBLE) * y::DOUBLE >= (7.827041271489945::DOUBLE)
                                THEN CASE WHEN (0.04130471873999038::DOUBLE) * x::DOUBLE + (-0.9991465959556737::DOUBLE) * y::DOUBLE >= (-4.944311758674248::DOUBLE)
                                  THEN 503
                                  ELSE 501
                                END
                                ELSE CASE WHEN (0.9991835330721688::DOUBLE) * x::DOUBLE + (-0.04040132717397464::DOUBLE) * y::DOUBLE >= (5.656250477761624::DOUBLE)
                                  THEN 503
                                  ELSE 482
                                END
                              END
                              ELSE CASE WHEN (0.14741089610368624::DOUBLE) * x::DOUBLE + (-0.989075339754211::DOUBLE) * y::DOUBLE >= (-4.515841631942691::DOUBLE)
                                THEN CASE WHEN (0.8141402749577483::DOUBLE) * x::DOUBLE + (0.5806682466707836::DOUBLE) * y::DOUBLE >= (8.186513337228423::DOUBLE)
                                  THEN 530
                                  ELSE 501
                                END
                                ELSE CASE WHEN (0.9957413922903202::DOUBLE) * x::DOUBLE + (-0.09219045330040762::DOUBLE) * y::DOUBLE >= (5.614191640347483::DOUBLE)
                                  THEN 530
                                  ELSE 498
                                END
                              END
                            END
                            ELSE CASE WHEN (0.4654488969336131::DOUBLE) * x::DOUBLE + (-0.8850747563586271::DOUBLE) * y::DOUBLE >= (-2.022036254818619::DOUBLE)
                              THEN CASE WHEN (0.8535340718943852::DOUBLE) * x::DOUBLE + (-0.5210370314242455::DOUBLE) * y::DOUBLE >= (2.008945311969688::DOUBLE)
                                THEN CASE WHEN (0.41768320161782674::DOUBLE) * x::DOUBLE + (0.9085927267407999::DOUBLE) * y::DOUBLE >= (7.036116234680454::DOUBLE)
                                  THEN CASE WHEN (0.28568959090962526::DOUBLE) * x::DOUBLE + (-0.9583222097217047::DOUBLE) * y::DOUBLE >= (-3.3603067711218::DOUBLE)
                                    THEN 482
                                    ELSE 473
                                  END
                                  ELSE CASE WHEN (0.9625100497028914::DOUBLE) * x::DOUBLE + (0.27124602157623867::DOUBLE) * y::DOUBLE >= (6.785382319186954::DOUBLE)
                                    THEN 482
                                    ELSE 464
                                  END
                                END
                                ELSE 452
                              END
                              ELSE CASE WHEN (0.5042886932541122::DOUBLE) * x::DOUBLE + (0.86353512601171::DOUBLE) * y::DOUBLE >= (7.426563608448028::DOUBLE)
                                THEN CASE WHEN (0.44551200702880706::DOUBLE) * x::DOUBLE + (-0.8952759639313257::DOUBLE) * y::DOUBLE >= (-2.3600238707698615::DOUBLE)
                                  THEN CASE WHEN (0.7325069777377147::DOUBLE) * x::DOUBLE + (0.6807595225669334::DOUBLE) * y::DOUBLE >= (7.968125271877268::DOUBLE)
                                    THEN 498
                                    ELSE 473
                                  END
                                  ELSE CASE WHEN (0.9870724693717249::DOUBLE) * x::DOUBLE + (0.16027457754867191::DOUBLE) * y::DOUBLE >= (6.5704896019477::DOUBLE)
                                    THEN 498
                                    ELSE 465
                                  END
                                END
                                ELSE CASE WHEN (0.09705078051900193::DOUBLE) * x::DOUBLE + (0.9952794311150274::DOUBLE) * y::DOUBLE >= (5.699052032919889::DOUBLE)
                                  THEN CASE WHEN (0.990680625098239::DOUBLE) * x::DOUBLE + (0.1362053561904328::DOUBLE) * y::DOUBLE >= (6.1955146131854955::DOUBLE)
                                    THEN 473
                                    ELSE 455
                                  END
                                  ELSE 452
                                END
                              END
                            END
                          END
                          ELSE CASE WHEN (0.14174303505448616::DOUBLE) * x::DOUBLE + (0.98990348621143::DOUBLE) * y::DOUBLE >= (6.375435106908335::DOUBLE)
                            THEN CASE WHEN (0.866507800346284::DOUBLE) * x::DOUBLE + (-0.49916353226076554::DOUBLE) * y::DOUBLE >= (1.7532483276281754::DOUBLE)
                              THEN CASE WHEN (0.5649318692573555::DOUBLE) * x::DOUBLE + (-0.8251375540462269::DOUBLE) * y::DOUBLE >= (-1.593895136457613::DOUBLE)
                                THEN CASE WHEN (0.49987946307230163::DOUBLE) * x::DOUBLE + (0.8660949846284457::DOUBLE) * y::DOUBLE >= (7.737904008994333::DOUBLE)
                                  THEN 483
                                  ELSE 465
                                END
                                ELSE CASE WHEN (0.995181358128653::DOUBLE) * x::DOUBLE + (0.09805133570334196::DOUBLE) * y::DOUBLE >= (6.084807945166118::DOUBLE)
                                  THEN 483
                                  ELSE 447
                                END
                              END
                              ELSE CASE WHEN (0.5612365523126166::DOUBLE) * x::DOUBLE + (-0.8276554430125181::DOUBLE) * y::DOUBLE >= (-1.8798087235658079::DOUBLE)
                                THEN CASE WHEN (0.780682892677669::DOUBLE) * x::DOUBLE + (0.6249273726445556::DOUBLE) * y::DOUBLE >= (7.683385989667324::DOUBLE)
                                  THEN 447
                                  ELSE 424
                                END
                                ELSE CASE WHEN (0.997615532921861::DOUBLE) * x::DOUBLE + (-0.06901629135958572::DOUBLE) * y::DOUBLE >= (4.788188585714327::DOUBLE)
                                  THEN 447
                                  ELSE 415
                                END
                              END
                            END
                            ELSE CASE WHEN (0.8715023435710295::DOUBLE) * x::DOUBLE + (-0.4903913387797579::DOUBLE) * y::DOUBLE >= (1.944658317252558::DOUBLE)
                              THEN CASE WHEN (0.46471011594301725::DOUBLE) * x::DOUBLE + (0.8854628779007212::DOUBLE) * y::DOUBLE >= (7.304854901554654::DOUBLE)
                                THEN CASE WHEN (0.253546967563103::DOUBLE) * x::DOUBLE + (-0.9673230769704374::DOUBLE) * y::DOUBLE >= (-3.8783109837933067::DOUBLE)
                                  THEN CASE WHEN (0.5042886932541122::DOUBLE) * x::DOUBLE + (0.86353512601171::DOUBLE) * y::DOUBLE >= (7.426563608448028::DOUBLE)
                                    THEN 465
                                    ELSE 455
                                  END
                                  ELSE CASE WHEN (0.9960211736856195::DOUBLE) * x::DOUBLE + (-0.08911689834100404::DOUBLE) * y::DOUBLE >= (4.920322089269246::DOUBLE)
                                    THEN 465
                                    ELSE 444
                                  END
                                END
                                ELSE CASE WHEN (0.7798398799575132::DOUBLE) * x::DOUBLE + (-0.6259790424829343::DOUBLE) * y::DOUBLE >= (0.80832176491062::DOUBLE)
                                  THEN 455
                                  ELSE 433
                                END
                              END
                              ELSE CASE WHEN (0.3121794008426844::DOUBLE) * x::DOUBLE + (0.9500231690277363::DOUBLE) * y::DOUBLE >= (6.868593737875382::DOUBLE)
                                THEN CASE WHEN (0.8743119023570943::DOUBLE) * x::DOUBLE + (-0.4853644995224914::DOUBLE) * y::DOUBLE >= (1.8696758723011806::DOUBLE)
                                  THEN 444
                                  ELSE 424
                                END
                                ELSE CASE WHEN (0.9534687627947543::DOUBLE) * x::DOUBLE + (-0.3014918214058891::DOUBLE) * y::DOUBLE >= (3.2976089956685053::DOUBLE)
                                  THEN CASE WHEN (0.46471011594301725::DOUBLE) * x::DOUBLE + (0.8854628779007212::DOUBLE) * y::DOUBLE >= (7.304854901554654::DOUBLE)
                                    THEN 444
                                    ELSE 433
                                  END
                                  ELSE CASE WHEN (0.9072529036284901::DOUBLE) * x::DOUBLE + (0.4205855071892918::DOUBLE) * y::DOUBLE >= (7.042113735518527::DOUBLE)
                                    THEN 444
                                    ELSE 419
                                  END
                                END
                              END
                            END
                          END
                        END
                        ELSE CASE WHEN (0.05336662989171223::DOUBLE) * x::DOUBLE + (0.9985749860746568::DOUBLE) * y::DOUBLE >= (5.530883053916457::DOUBLE)
                          THEN CASE WHEN (0.8392680509420675::DOUBLE) * x::DOUBLE + (-0.5437178851830268::DOUBLE) * y::DOUBLE >= (1.3663976171006031::DOUBLE)
                            THEN CASE WHEN (0.9534687627947543::DOUBLE) * x::DOUBLE + (-0.3014918214058891::DOUBLE) * y::DOUBLE >= (3.2976089956685053::DOUBLE)
                              THEN CASE WHEN (0.37929768254172186::DOUBLE) * x::DOUBLE + (0.9252746986806022::DOUBLE) * y::DOUBLE >= (6.9060815389860775::DOUBLE)
                                THEN CASE WHEN (0.7798398799575132::DOUBLE) * x::DOUBLE + (-0.6259790424829343::DOUBLE) * y::DOUBLE >= (0.80832176491062::DOUBLE)
                                  THEN 455
                                  ELSE 433
                                END
                                ELSE CASE WHEN (0.9918939110079655::DOUBLE) * x::DOUBLE + (0.1270687581796644::DOUBLE) * y::DOUBLE >= (5.917906869638788::DOUBLE)
                                  THEN 455
                                  ELSE 427
                                END
                              END
                              ELSE CASE WHEN (0.4306102720265751::DOUBLE) * x::DOUBLE + (0.9025379735087046::DOUBLE) * y::DOUBLE >= (7.04337735458891::DOUBLE)
                                THEN CASE WHEN (0.4046657856647373::DOUBLE) * x::DOUBLE + (-0.9144646531782084::DOUBLE) * y::DOUBLE >= (-2.8100587390996217::DOUBLE)
                                  THEN 427
                                  ELSE 419
                                END
                                ELSE CASE WHEN (0.895029668018537::DOUBLE) * x::DOUBLE + (-0.4460066068643238::DOUBLE) * y::DOUBLE >= (2.218635526012073::DOUBLE)
                                  THEN 427
                                  ELSE 414
                                END
                              END
                            END
                            ELSE CASE WHEN (0.4306102720265751::DOUBLE) * x::DOUBLE + (0.9025379735087046::DOUBLE) * y::DOUBLE >= (7.04337735458891::DOUBLE)
                              THEN CASE WHEN (0.14562062079460397::DOUBLE) * x::DOUBLE + (0.989340504982685::DOUBLE) * y::DOUBLE >= (6.149781189307491::DOUBLE)
                                THEN CASE WHEN (0.6454902385903851::DOUBLE) * x::DOUBLE + (-0.7637685198307976::DOUBLE) * y::DOUBLE >= (-0.9505113138918988::DOUBLE)
                                  THEN CASE WHEN (0.3121794008426844::DOUBLE) * x::DOUBLE + (0.9500231690277363::DOUBLE) * y::DOUBLE >= (6.868593737875382::DOUBLE)
                                    THEN 424
                                    ELSE 419
                                  END
                                  ELSE CASE WHEN (0.9283552028475192::DOUBLE) * x::DOUBLE + (0.3716942525059295::DOUBLE) * y::DOUBLE >= (6.798570561556954::DOUBLE)
                                    THEN 424
                                    ELSE 409
                                  END
                                END
                                ELSE CASE WHEN (0.9304247752397641::DOUBLE) * x::DOUBLE + (0.3664829295070024::DOUBLE) * y::DOUBLE >= (6.669227311494018::DOUBLE)
                                  THEN 419
                                  ELSE 406
                                END
                              END
                              ELSE CASE WHEN (0.3934999609139112::DOUBLE) * x::DOUBLE + (-0.91932463295658::DOUBLE) * y::DOUBLE >= (-2.904370988874355::DOUBLE)
                                THEN CASE WHEN (0.686595256576393::DOUBLE) * x::DOUBLE + (0.7270398569863946::DOUBLE) * y::DOUBLE >= (7.241558453661072::DOUBLE)
                                  THEN 414
                                  ELSE 400
                                END
                                ELSE CASE WHEN (0.7836395562187713::DOUBLE) * x::DOUBLE + (0.621215780489555::DOUBLE) * y::DOUBLE >= (7.178149951480705::DOUBLE)
                                  THEN CASE WHEN (0.7297318026105483::DOUBLE) * x::DOUBLE + (-0.6837334979791173::DOUBLE) * y::DOUBLE >= (-0.01228504880152359::DOUBLE)
                                    THEN 414
                                    ELSE 406
                                  END
                                  ELSE CASE WHEN (0.9984359816978134::DOUBLE) * x::DOUBLE + (0.055906980343455474::DOUBLE) * y::DOUBLE >= (5.243068246931136::DOUBLE)
                                    THEN 414
                                    ELSE 392
                                  END
                                END
                              END
                            END
                          END
                          ELSE CASE WHEN (0.9709858061937034::DOUBLE) * x::DOUBLE + (0.23913712419940947::DOUBLE) * y::DOUBLE >= (6.187264388015433::DOUBLE)
                            THEN CASE WHEN (0.9999964883349097::DOUBLE) * x::DOUBLE + (-0.0026501543066219666::DOUBLE) * y::DOUBLE >= (5.1363421764813::DOUBLE)
                              THEN CASE WHEN (0.9918939110079655::DOUBLE) * x::DOUBLE + (0.1270687581796644::DOUBLE) * y::DOUBLE >= (5.917906869638788::DOUBLE)
                                THEN CASE WHEN (0.09705078051900193::DOUBLE) * x::DOUBLE + (0.9952794311150274::DOUBLE) * y::DOUBLE >= (5.699052032919889::DOUBLE)
                                  THEN 455
                                  ELSE 452
                                END
                                ELSE CASE WHEN (0.24495825469437704::DOUBLE) * x::DOUBLE + (-0.9695336267799506::DOUBLE) * y::DOUBLE >= (-3.7461593500640236::DOUBLE)
                                  THEN CASE WHEN (0.9948209009521461::DOUBLE) * x::DOUBLE + (0.10164337178960794::DOUBLE) * y::DOUBLE >= (5.794908768382502::DOUBLE)
                                    THEN 452
                                    ELSE 430
                                  END
                                  ELSE CASE WHEN (0.8362049945245238::DOUBLE) * x::DOUBLE + (-0.5484170011334817::DOUBLE) * y::DOUBLE >= (1.574063283902987::DOUBLE)
                                    THEN 452
                                    ELSE 427
                                  END
                                END
                              END
                              ELSE CASE WHEN (0.3566401341220937::DOUBLE) * x::DOUBLE + (-0.9342418395326635::DOUBLE) * y::DOUBLE >= (-3.018395808083827::DOUBLE)
                                THEN CASE WHEN (0.6008029986962727::DOUBLE) * x::DOUBLE + (0.7993971208089046::DOUBLE) * y::DOUBLE >= (7.223104343412572::DOUBLE)
                                  THEN 427
                                  ELSE 416
                                END
                                ELSE CASE WHEN (0.9728446529914353::DOUBLE) * x::DOUBLE + (0.23145902692695688::DOUBLE) * y::DOUBLE >= (6.183298068416584::DOUBLE)
                                  THEN 427
                                  ELSE 413
                                END
                              END
                            END
                            ELSE CASE WHEN (0.8743999526536603::DOUBLE) * x::DOUBLE + (-0.4852058561057116::DOUBLE) * y::DOUBLE >= (1.7744551656316108::DOUBLE)
                              THEN CASE WHEN (0.03458820632909938::DOUBLE) * x::DOUBLE + (-0.9994016489794959::DOUBLE) * y::DOUBLE >= (-4.948175993451417::DOUBLE)
                                THEN CASE WHEN (0.9400334085301585::DOUBLE) * x::DOUBLE + (0.34108238132036667::DOUBLE) * y::DOUBLE >= (6.432163841875655::DOUBLE)
                                  THEN 416
                                  ELSE 401
                                END
                                ELSE CASE WHEN (0.9812396436345783::DOUBLE) * x::DOUBLE + (0.19279201684687575::DOUBLE) * y::DOUBLE >= (5.88645809173666::DOUBLE)
                                  THEN CASE WHEN (0.3566401341220937::DOUBLE) * x::DOUBLE + (-0.9342418395326635::DOUBLE) * y::DOUBLE >= (-3.018395808083827::DOUBLE)
                                    THEN 416
                                    ELSE 413
                                  END
                                  ELSE CASE WHEN (0.880780776557768::DOUBLE) * x::DOUBLE + (-0.4735242587727635::DOUBLE) * y::DOUBLE >= (1.963156067125194::DOUBLE)
                                    THEN 416
                                    ELSE 400
                                  END
                                END
                              END
                              ELSE CASE WHEN (0.8991052488337254::DOUBLE) * x::DOUBLE + (0.43773251138068864::DOUBLE) * y::DOUBLE >= (6.619937744308463::DOUBLE)
                                THEN CASE WHEN (0.3934999609139112::DOUBLE) * x::DOUBLE + (-0.91932463295658::DOUBLE) * y::DOUBLE >= (-2.904370988874355::DOUBLE)
                                  THEN 400
                                  ELSE 392
                                END
                                ELSE 387
                              END
                            END
                          END
                        END
                      END
                    END
                    ELSE CASE WHEN (0.9462805422513121::DOUBLE) * x::DOUBLE + (-0.3233467726088554::DOUBLE) * y::DOUBLE >= (3.6475719528012953::DOUBLE)
                      THEN CASE WHEN (0.13352933818055335::DOUBLE) * x::DOUBLE + (0.9910448606622525::DOUBLE) * y::DOUBLE >= (5.373392953470303::DOUBLE)
                        THEN CASE WHEN (0.8248077676914883::DOUBLE) * x::DOUBLE + (-0.5654132527238673::DOUBLE) * y::DOUBLE >= (2.0451698784192835::DOUBLE)
                          THEN CASE WHEN (0.02224033607635252::DOUBLE) * x::DOUBLE + (0.9997526531353698::DOUBLE) * y::DOUBLE >= (4.953294891463772::DOUBLE)
                            THEN CASE WHEN (0.7141476188707759::DOUBLE) * x::DOUBLE + (0.699995127455328::DOUBLE) * y::DOUBLE >= (7.724609405475096::DOUBLE)
                              THEN CASE WHEN (0.29997575136887966::DOUBLE) * x::DOUBLE + (-0.9539468269199683::DOUBLE) * y::DOUBLE >= (-2.9356643067666646::DOUBLE)
                                THEN 508
                                ELSE 503
                              END
                              ELSE CASE WHEN (0.9937705880335026::DOUBLE) * x::DOUBLE + (-0.11144513609640619::DOUBLE) * y::DOUBLE >= (5.373329808908188::DOUBLE)
                                THEN 508
                                ELSE 490
                              END
                            END
                            ELSE CASE WHEN (0.9698346871980553::DOUBLE) * x::DOUBLE + (0.24376357297071694::DOUBLE) * y::DOUBLE >= (6.889272948089635::DOUBLE)
                              THEN CASE WHEN (0.9473652420697701::DOUBLE) * x::DOUBLE + (-0.32015480336563096::DOUBLE) * y::DOUBLE >= (4.107289873204116::DOUBLE)
                                THEN CASE WHEN (0.25202568782142093::DOUBLE) * x::DOUBLE + (0.9677205447225659::DOUBLE) * y::DOUBLE >= (6.14927885103976::DOUBLE)
                                  THEN 508
                                  ELSE 506
                                END
                                ELSE CASE WHEN (0.8776734053758605::DOUBLE) * x::DOUBLE + (0.4792592132614046::DOUBLE) * y::DOUBLE >= (7.53130634851688::DOUBLE)
                                  THEN 508
                                  ELSE 489
                                END
                              END
                              ELSE CASE WHEN (0.9811026286115869::DOUBLE) * x::DOUBLE + (0.19348806715514638::DOUBLE) * y::DOUBLE >= (6.557399430799444::DOUBLE)
                                THEN CASE WHEN (0.09076628566296426::DOUBLE) * x::DOUBLE + (-0.9958722214154531::DOUBLE) * y::DOUBLE >= (-4.1403189448338775::DOUBLE)
                                  THEN 491
                                  ELSE 489
                                END
                                ELSE CASE WHEN (0.9091360891159522::DOUBLE) * x::DOUBLE + (-0.4164991854337191::DOUBLE) * y::DOUBLE >= (3.286599023458497::DOUBLE)
                                  THEN 491
                                  ELSE 476
                                END
                              END
                            END
                          END
                          ELSE CASE WHEN (0.37338506927360726::DOUBLE) * x::DOUBLE + (0.9276764468517801::DOUBLE) * y::DOUBLE >= (6.638077455870637::DOUBLE)
                            THEN CASE WHEN (0.9675672351792735::DOUBLE) * x::DOUBLE + (-0.252613628705057::DOUBLE) * y::DOUBLE >= (4.2302569511719215::DOUBLE)
                              THEN CASE WHEN (0.09553338958212601::DOUBLE) * x::DOUBLE + (0.9954262260333259::DOUBLE) * y::DOUBLE >= (5.486561144658556::DOUBLE)
                                THEN CASE WHEN (0.5278997228284272::DOUBLE) * x::DOUBLE + (-0.8493067070485607::DOUBLE) * y::DOUBLE >= (-1.1940945530578566::DOUBLE)
                                  THEN CASE WHEN (0.7141476188707759::DOUBLE) * x::DOUBLE + (0.699995127455328::DOUBLE) * y::DOUBLE >= (7.724609405475096::DOUBLE)
                                    THEN 503
                                    ELSE 490
                                  END
                                  ELSE CASE WHEN (0.9991835330721688::DOUBLE) * x::DOUBLE + (-0.04040132717397464::DOUBLE) * y::DOUBLE >= (5.656250477761624::DOUBLE)
                                    THEN 503
                                    ELSE 482
                                  END
                                END
                                ELSE CASE WHEN (0.9017312362172004::DOUBLE) * x::DOUBLE + (0.4322970941727453::DOUBLE) * y::DOUBLE >= (7.305097542543221::DOUBLE)
                                  THEN 490
                                  ELSE 479
                                END
                              END
                              ELSE CASE WHEN (0.31865665210726185::DOUBLE) * x::DOUBLE + (-0.9478702116153833::DOUBLE) * y::DOUBLE >= (-2.9235559139494383::DOUBLE)
                                THEN CASE WHEN (0.5288189580679653::DOUBLE) * x::DOUBLE + (0.8487346520485137::DOUBLE) * y::DOUBLE >= (7.214149372094024::DOUBLE)
                                  THEN 482
                                  ELSE 467
                                END
                                ELSE CASE WHEN (0.9625100497028914::DOUBLE) * x::DOUBLE + (0.27124602157623867::DOUBLE) * y::DOUBLE >= (6.785382319186954::DOUBLE)
                                  THEN 482
                                  ELSE 464
                                END
                              END
                            END
                            ELSE CASE WHEN (0.9993236014690486::DOUBLE) * x::DOUBLE + (-0.036774169561389715::DOUBLE) * y::DOUBLE >= (5.416134579106463::DOUBLE)
                              THEN CASE WHEN (0.9017312362172004::DOUBLE) * x::DOUBLE + (0.4322970941727453::DOUBLE) * y::DOUBLE >= (7.305097542543221::DOUBLE)
                                THEN 490
                                ELSE CASE WHEN (0.49558597658505704::DOUBLE) * x::DOUBLE + (-0.8685588867844454::DOUBLE) * y::DOUBLE >= (-1.3724680324690315::DOUBLE)
                                  THEN CASE WHEN (0.20322100427627557::DOUBLE) * x::DOUBLE + (0.9791328936466908::DOUBLE) * y::DOUBLE >= (5.8306861661726614::DOUBLE)
                                    THEN 479
                                    ELSE 476
                                  END
                                  ELSE CASE WHEN (0.9675672351792735::DOUBLE) * x::DOUBLE + (-0.252613628705057::DOUBLE) * y::DOUBLE >= (4.2302569511719215::DOUBLE)
                                    THEN 479
                                    ELSE 467
                                  END
                                END
                              END
                              ELSE CASE WHEN (0.4119608506073354::DOUBLE) * x::DOUBLE + (-0.9112015460735791::DOUBLE) * y::DOUBLE >= (-2.102907160502726::DOUBLE)
                                THEN CASE WHEN (0.4017792048033313::DOUBLE) * x::DOUBLE + (0.9157365727039642::DOUBLE) * y::DOUBLE >= (6.618789073914828::DOUBLE)
                                  THEN 467
                                  ELSE 462
                                END
                                ELSE CASE WHEN (0.9964394971494926::DOUBLE) * x::DOUBLE + (0.08431090392390835::DOUBLE) * y::DOUBLE >= (5.9081881785680475::DOUBLE)
                                  THEN 467
                                  ELSE 458
                                END
                              END
                            END
                          END
                        END
                        ELSE CASE WHEN (0.9324707170580696::DOUBLE) * x::DOUBLE + (-0.3612455699786635::DOUBLE) * y::DOUBLE >= (3.7364690204561315::DOUBLE)
                          THEN CASE WHEN (0.0437366871526488::DOUBLE) * x::DOUBLE + (0.9990430932632041::DOUBLE) * y::DOUBLE >= (4.739851664100902::DOUBLE)
                            THEN CASE WHEN (0.9698346871980553::DOUBLE) * x::DOUBLE + (0.24376357297071694::DOUBLE) * y::DOUBLE >= (6.889272948089635::DOUBLE)
                              THEN CASE WHEN (0.6246883417620532::DOUBLE) * x::DOUBLE + (0.7808741740297063::DOUBLE) * y::DOUBLE >= (7.311172773452304::DOUBLE)
                                THEN CASE WHEN (0.3865778201732702::DOUBLE) * x::DOUBLE + (-0.92225679121928::DOUBLE) * y::DOUBLE >= (-1.9006381515404955::DOUBLE)
                                  THEN 510
                                  ELSE 506
                                END
                                ELSE CASE WHEN (0.9995177101939681::DOUBLE) * x::DOUBLE + (0.0310539370870566::DOUBLE) * y::DOUBLE >= (6.12844375040559::DOUBLE)
                                  THEN 510
                                  ELSE 493
                                END
                              END
                              ELSE CASE WHEN (0.7008181554295702::DOUBLE) * x::DOUBLE + (0.7133399701546905::DOUBLE) * y::DOUBLE >= (7.301264732004412::DOUBLE)
                                THEN CASE WHEN (0.3773413660958425::DOUBLE) * x::DOUBLE + (-0.9260742375387211::DOUBLE) * y::DOUBLE >= (-2.0221405919209334::DOUBLE)
                                  THEN 493
                                  ELSE 491
                                END
                                ELSE CASE WHEN (0.9941087684794349::DOUBLE) * x::DOUBLE + (0.10838706764324485::DOUBLE) * y::DOUBLE >= (6.251393181471468::DOUBLE)
                                  THEN 493
                                  ELSE 480
                                END
                              END
                            END
                            ELSE CASE WHEN (0.9941087684794349::DOUBLE) * x::DOUBLE + (0.10838706764324485::DOUBLE) * y::DOUBLE >= (6.251393181471468::DOUBLE)
                              THEN CASE WHEN (0.34125735031348536::DOUBLE) * x::DOUBLE + (0.9399699042293956::DOUBLE) * y::DOUBLE >= (6.162712205592161::DOUBLE)
                                THEN CASE WHEN (0.2156097842510989::DOUBLE) * x::DOUBLE + (-0.9764796060006551::DOUBLE) * y::DOUBLE >= (-3.015203756877147::DOUBLE)
                                  THEN 497
                                  ELSE 493
                                END
                                ELSE CASE WHEN (0.8578086205401928::DOUBLE) * x::DOUBLE + (-0.5139692311091506::DOUBLE) * y::DOUBLE >= (2.834685286473466::DOUBLE)
                                  THEN 497
                                  ELSE 487
                                END
                              END
                              ELSE CASE WHEN (0.2810269262717742::DOUBLE) * x::DOUBLE + (0.9596998836668883::DOUBLE) * y::DOUBLE >= (5.822900961396998::DOUBLE)
                                THEN CASE WHEN (0.6427918908675329::DOUBLE) * x::DOUBLE + (-0.7660408507611991::DOUBLE) * y::DOUBLE >= (0.3219235297424041::DOUBLE)
                                  THEN 487
                                  ELSE 480
                                END
                                ELSE CASE WHEN (0.9882844364923808::DOUBLE) * x::DOUBLE + (0.1526233028961744::DOUBLE) * y::DOUBLE >= (6.334197881099917::DOUBLE)
                                  THEN 487
                                  ELSE 471
                                END
                              END
                            END
                          END
                          ELSE CASE WHEN (0.9227570451372684::DOUBLE) * x::DOUBLE + (-0.38538219425595827::DOUBLE) * y::DOUBLE >= (3.4237138332082457::DOUBLE)
                            THEN CASE WHEN (0.5902514182283862::DOUBLE) * x::DOUBLE + (0.8072194641356083::DOUBLE) * y::DOUBLE >= (6.9234846600137585::DOUBLE)
                              THEN CASE WHEN (0.395210548930656::DOUBLE) * x::DOUBLE + (-0.9185905627720816::DOUBLE) * y::DOUBLE >= (-1.9341507497624768::DOUBLE)
                                THEN CASE WHEN (0.7008181554295702::DOUBLE) * x::DOUBLE + (0.7133399701546905::DOUBLE) * y::DOUBLE >= (7.301264732004412::DOUBLE)
                                  THEN 491
                                  ELSE 480
                                END
                                ELSE CASE WHEN (0.9879656948842809::DOUBLE) * x::DOUBLE + (0.1546731577611967::DOUBLE) * y::DOUBLE >= (6.39421993139323::DOUBLE)
                                  THEN 491
                                  ELSE 475
                                END
                              END
                              ELSE CASE WHEN (0.8954512660931406::DOUBLE) * x::DOUBLE + (-0.44515955572377813::DOUBLE) * y::DOUBLE >= (3.0546531789736875::DOUBLE)
                                THEN CASE WHEN (0.2810269262717742::DOUBLE) * x::DOUBLE + (0.9596998836668883::DOUBLE) * y::DOUBLE >= (5.822900961396998::DOUBLE)
                                  THEN 480
                                  ELSE 471
                                END
                                ELSE CASE WHEN (0.8951562920883854::DOUBLE) * x::DOUBLE + (0.44575241192232834::DOUBLE) * y::DOUBLE >= (6.994759499769704::DOUBLE)
                                  THEN 480
                                  ELSE 460
                                END
                              END
                            END
                            ELSE CASE WHEN (0.7859958449103049::DOUBLE) * x::DOUBLE + (0.618231778367738::DOUBLE) * y::DOUBLE >= (7.159421602028465::DOUBLE)
                              THEN CASE WHEN (0.0814574250604909::DOUBLE) * x::DOUBLE + (0.9966768221958985::DOUBLE) * y::DOUBLE >= (5.080927852069675::DOUBLE)
                                THEN CASE WHEN (0.7749969094100335::DOUBLE) * x::DOUBLE + (-0.6319650230866392::DOUBLE) * y::DOUBLE >= (1.383106624662259::DOUBLE)
                                  THEN 475
                                  ELSE 462
                                END
                                ELSE CASE WHEN (0.9825462469776604::DOUBLE) * x::DOUBLE + (0.18601847367967075::DOUBLE) * y::DOUBLE >= (6.3368190306801635::DOUBLE)
                                  THEN 475
                                  ELSE 461
                                END
                              END
                              ELSE CASE WHEN (0.9816364193856703::DOUBLE) * x::DOUBLE + (-0.1907614744535185::DOUBLE) * y::DOUBLE >= (4.4616713009517::DOUBLE)
                                THEN CASE WHEN (0.027067045849455434::DOUBLE) * x::DOUBLE + (0.9996336203974852::DOUBLE) * y::DOUBLE >= (4.631417436742824::DOUBLE)
                                  THEN 461
                                  ELSE 460
                                END
                                ELSE 448
                              END
                            END
                          END
                        END
                      END
                      ELSE CASE WHEN (0.6807773685142041::DOUBLE) * x::DOUBLE + (-0.7324903921000436::DOUBLE) * y::DOUBLE >= (-0.029364789632322363::DOUBLE)
                        THEN CASE WHEN (0.6420013471471038::DOUBLE) * x::DOUBLE + (0.7667035087054864::DOUBLE) * y::DOUBLE >= (7.083037330209509::DOUBLE)
                          THEN CASE WHEN (0.4134390745236838::DOUBLE) * x::DOUBLE + (0.9105317850888018::DOUBLE) * y::DOUBLE >= (6.677471403579658::DOUBLE)
                            THEN CASE WHEN (0.8535340718943852::DOUBLE) * x::DOUBLE + (-0.5210370314242455::DOUBLE) * y::DOUBLE >= (2.008945311969688::DOUBLE)
                              THEN CASE WHEN (0.5226000055096391::DOUBLE) * x::DOUBLE + (-0.852577993054785::DOUBLE) * y::DOUBLE >= (-1.3479741463766155::DOUBLE)
                                THEN CASE WHEN (0.37338506927360726::DOUBLE) * x::DOUBLE + (0.9276764468517801::DOUBLE) * y::DOUBLE >= (6.638077455870637::DOUBLE)
                                  THEN CASE WHEN (0.31865665210726185::DOUBLE) * x::DOUBLE + (-0.9478702116153833::DOUBLE) * y::DOUBLE >= (-2.9235559139494383::DOUBLE)
                                    THEN 467
                                    ELSE 464
                                  END
                                  ELSE CASE WHEN (0.9964394971494926::DOUBLE) * x::DOUBLE + (0.08431090392390835::DOUBLE) * y::DOUBLE >= (5.9081881785680475::DOUBLE)
                                    THEN 467
                                    ELSE 458
                                  END
                                END
                                ELSE CASE WHEN (0.8530625472267609::DOUBLE) * x::DOUBLE + (0.521808672330185::DOUBLE) * y::DOUBLE >= (7.2639150534195345::DOUBLE)
                                  THEN 464
                                  ELSE 454
                                END
                              END
                              ELSE CASE WHEN (0.5001514021825132::DOUBLE) * x::DOUBLE + (0.8659379740459856::DOUBLE) * y::DOUBLE >= (7.059115323471558::DOUBLE)
                                THEN CASE WHEN (0.06881416384254917::DOUBLE) * x::DOUBLE + (-0.9976294957822021::DOUBLE) * y::DOUBLE >= (-4.655824534950752::DOUBLE)
                                  THEN 454
                                  ELSE 452
                                END
                                ELSE CASE WHEN (0.8538031840178159::DOUBLE) * x::DOUBLE + (-0.520595930603611::DOUBLE) * y::DOUBLE >= (1.9790559372689605::DOUBLE)
                                  THEN 454
                                  ELSE 440
                                END
                              END
                            END
                            ELSE CASE WHEN (0.8815243220861052::DOUBLE) * x::DOUBLE + (-0.47213861266648444::DOUBLE) * y::DOUBLE >= (2.3998683905932583::DOUBLE)
                              THEN CASE WHEN (0.1446180130346209::DOUBLE) * x::DOUBLE + (0.9894875594497983::DOUBLE) * y::DOUBLE >= (5.605461654633585::DOUBLE)
                                THEN CASE WHEN (0.5226000055096391::DOUBLE) * x::DOUBLE + (-0.852577993054785::DOUBLE) * y::DOUBLE >= (-1.3479741463766155::DOUBLE)
                                  THEN 458
                                  ELSE 454
                                END
                                ELSE CASE WHEN (0.8314921271065928::DOUBLE) * x::DOUBLE + (0.5555365357559786::DOUBLE) * y::DOUBLE >= (7.183625407328723::DOUBLE)
                                  THEN CASE WHEN (0.4119608506073354::DOUBLE) * x::DOUBLE + (-0.9112015460735791::DOUBLE) * y::DOUBLE >= (-2.102907160502726::DOUBLE)
                                    THEN 462
                                    ELSE 458
                                  END
                                  ELSE CASE WHEN (0.8663743850914918::DOUBLE) * x::DOUBLE + (-0.49939505890360925::DOUBLE) * y::DOUBLE >= (2.339348261792009::DOUBLE)
                                    THEN 462
                                    ELSE 449
                                  END
                                END
                              END
                              ELSE CASE WHEN (0.8504225482424879::DOUBLE) * x::DOUBLE + (0.5261002655775358::DOUBLE) * y::DOUBLE >= (7.109972258387902::DOUBLE)
                                THEN 454
                                ELSE 434
                              END
                            END
                          END
                          ELSE CASE WHEN (0.9638731001465488::DOUBLE) * x::DOUBLE + (-0.26636187192216704::DOUBLE) * y::DOUBLE >= (3.8741806258474103::DOUBLE)
                            THEN CASE WHEN (0.41792428060488285::DOUBLE) * x::DOUBLE + (-0.9084818631546207::DOUBLE) * y::DOUBLE >= (-2.0073210012607507::DOUBLE)
                              THEN CASE WHEN (0.7859958449103049::DOUBLE) * x::DOUBLE + (0.618231778367738::DOUBLE) * y::DOUBLE >= (7.159421602028465::DOUBLE)
                                THEN 462
                                ELSE 448
                              END
                              ELSE CASE WHEN (0.9985943854949594::DOUBLE) * x::DOUBLE + (-0.053002389172042204::DOUBLE) * y::DOUBLE >= (5.15571109794017::DOUBLE)
                                THEN 462
                                ELSE 439
                              END
                            END
                            ELSE CASE WHEN (0.7062736165149068::DOUBLE) * x::DOUBLE + (0.7079389653176001::DOUBLE) * y::DOUBLE >= (7.037946367843052::DOUBLE)
                              THEN CASE WHEN (0.8597056777443163::DOUBLE) * x::DOUBLE + (0.5107897293937944::DOUBLE) * y::DOUBLE >= (6.918712973675188::DOUBLE)
                                THEN CASE WHEN (0.39872565413312927::DOUBLE) * x::DOUBLE + (-0.9170702550710651::DOUBLE) * y::DOUBLE >= (-2.294283669918693::DOUBLE)
                                  THEN 439
                                  ELSE 434
                                END
                                ELSE CASE WHEN (0.9660295941044322::DOUBLE) * x::DOUBLE + (-0.2584314673456502::DOUBLE) * y::DOUBLE >= (3.804810888087562::DOUBLE)
                                  THEN 439
                                  ELSE 422
                                END
                              END
                              ELSE CASE WHEN (0.004988818559887512::DOUBLE) * x::DOUBLE + (0.9999875557672587::DOUBLE) * y::DOUBLE >= (4.710695218287127::DOUBLE)
                                THEN CASE WHEN (0.6292859079812767::DOUBLE) * x::DOUBLE + (-0.7771738840286516::DOUBLE) * y::DOUBLE >= (-0.410726492081245::DOUBLE)
                                  THEN 432
                                  ELSE 422
                                END
                                ELSE CASE WHEN (0.9007035430393278::DOUBLE) * x::DOUBLE + (0.43443426149004627::DOUBLE) * y::DOUBLE >= (6.659156136688348::DOUBLE)
                                  THEN 432
                                  ELSE 421
                                END
                              END
                            END
                          END
                        END
                        ELSE CASE WHEN (0.9400334085301585::DOUBLE) * x::DOUBLE + (0.34108238132036667::DOUBLE) * y::DOUBLE >= (6.432163841875655::DOUBLE)
                          THEN CASE WHEN (0.9917304960938077::DOUBLE) * x::DOUBLE + (-0.12833792548397382::DOUBLE) * y::DOUBLE >= (4.461247076485389::DOUBLE)
                            THEN CASE WHEN (0.19327651339036608::DOUBLE) * x::DOUBLE + (0.9811443264737678::DOUBLE) * y::DOUBLE >= (5.9461803878925625::DOUBLE)
                              THEN CASE WHEN (0.6637031351349911::DOUBLE) * x::DOUBLE + (-0.7479960885004573::DOUBLE) * y::DOUBLE >= (-0.28451825598434777::DOUBLE)
                                THEN CASE WHEN (0.5001514021825132::DOUBLE) * x::DOUBLE + (0.8659379740459856::DOUBLE) * y::DOUBLE >= (7.059115323471558::DOUBLE)
                                  THEN 452
                                  ELSE 440
                                END
                                ELSE CASE WHEN (0.9948209009521461::DOUBLE) * x::DOUBLE + (0.10164337178960794::DOUBLE) * y::DOUBLE >= (5.794908768382502::DOUBLE)
                                  THEN 452
                                  ELSE 430
                                END
                              END
                              ELSE CASE WHEN (0.42084333678250924::DOUBLE) * x::DOUBLE + (0.9071333341277695::DOUBLE) * y::DOUBLE >= (6.588758933102534::DOUBLE)
                                THEN CASE WHEN (0.5099123621570428::DOUBLE) * x::DOUBLE + (-0.8602263556293919::DOUBLE) * y::DOUBLE >= (-1.564386071779941::DOUBLE)
                                  THEN CASE WHEN (0.4134390745236838::DOUBLE) * x::DOUBLE + (0.9105317850888018::DOUBLE) * y::DOUBLE >= (6.677471403579658::DOUBLE)
                                    THEN 440
                                    ELSE 434
                                  END
                                  ELSE CASE WHEN (0.9460196510764027::DOUBLE) * x::DOUBLE + (0.3241092713534764::DOUBLE) * y::DOUBLE >= (6.585495949068624::DOUBLE)
                                    THEN 440
                                    ELSE 428
                                  END
                                END
                                ELSE CASE WHEN (0.8597056777443163::DOUBLE) * x::DOUBLE + (0.5107897293937944::DOUBLE) * y::DOUBLE >= (6.918712973675188::DOUBLE)
                                  THEN 434
                                  ELSE 422
                                END
                              END
                            END
                            ELSE CASE WHEN (0.11446307759283833::DOUBLE) * x::DOUBLE + (-0.9934275030760804::DOUBLE) * y::DOUBLE >= (-4.2638286617707415::DOUBLE)
                              THEN 422
                              ELSE CASE WHEN (0.08847376323337579::DOUBLE) * x::DOUBLE + (-0.9960785075581767::DOUBLE) * y::DOUBLE >= (-4.571979514352261::DOUBLE)
                                THEN CASE WHEN (0.7179452642244393::DOUBLE) * x::DOUBLE + (0.6960995601045156::DOUBLE) * y::DOUBLE >= (7.210714554940372::DOUBLE)
                                  THEN 430
                                  ELSE 417
                                END
                                ELSE CASE WHEN (0.9999964883349097::DOUBLE) * x::DOUBLE + (-0.0026501543066219666::DOUBLE) * y::DOUBLE >= (5.1363421764813::DOUBLE)
                                  THEN 430
                                  ELSE 416
                                END
                              END
                            END
                          END
                          ELSE CASE WHEN (0.6621957669694252::DOUBLE) * x::DOUBLE + (-0.749330878989899::DOUBLE) * y::DOUBLE >= (-0.531997803530595::DOUBLE)
                            THEN CASE WHEN (0.5736981535684261::DOUBLE) * x::DOUBLE + (-0.8190668034978458::DOUBLE) * y::DOUBLE >= (-1.191210591489714::DOUBLE)
                              THEN CASE WHEN (0.3973073037352908::DOUBLE) * x::DOUBLE + (0.9176856250364792::DOUBLE) * y::DOUBLE >= (6.40505127367021::DOUBLE)
                                THEN CASE WHEN (0.8824431072168931::DOUBLE) * x::DOUBLE + (0.4704191349481809::DOUBLE) * y::DOUBLE >= (6.765451691931424::DOUBLE)
                                  THEN CASE WHEN (0.11446307759283833::DOUBLE) * x::DOUBLE + (-0.9934275030760804::DOUBLE) * y::DOUBLE >= (-4.2638286617707415::DOUBLE)
                                    THEN 422
                                    ELSE 417
                                  END
                                  ELSE CASE WHEN (0.726488854238994::DOUBLE) * x::DOUBLE + (-0.6871782481034404::DOUBLE) * y::DOUBLE >= (0.3308209928418764::DOUBLE)
                                    THEN 422
                                    ELSE 407
                                  END
                                END
                                ELSE CASE WHEN (0.9969501357908052::DOUBLE) * x::DOUBLE + (0.07804118622045038::DOUBLE) * y::DOUBLE >= (5.3671230656848845::DOUBLE)
                                  THEN 422
                                  ELSE 399
                                END
                              END
                              ELSE CASE WHEN (0.7526727134907277::DOUBLE) * x::DOUBLE + (0.658394855969049::DOUBLE) * y::DOUBLE >= (6.942686587829656::DOUBLE)
                                THEN CASE WHEN (0.34316225266429123::DOUBLE) * x::DOUBLE + (-0.939276140624454::DOUBLE) * y::DOUBLE >= (-2.9820536003145737::DOUBLE)
                                  THEN CASE WHEN (0.8824431072168931::DOUBLE) * x::DOUBLE + (0.4704191349481809::DOUBLE) * y::DOUBLE >= (6.765451691931424::DOUBLE)
                                    THEN 417
                                    ELSE 407
                                  END
                                  ELSE CASE WHEN (0.9133863046605504::DOUBLE) * x::DOUBLE + (-0.40709391847403503::DOUBLE) * y::DOUBLE >= (2.5311067291018627::DOUBLE)
                                    THEN 417
                                    ELSE 401
                                  END
                                END
                                ELSE CASE WHEN (0.9933646386675579::DOUBLE) * x::DOUBLE + (-0.11500736778516445::DOUBLE) * y::DOUBLE >= (4.282705667253371::DOUBLE)
                                  THEN 407
                                  ELSE 388
                                END
                              END
                            END
                            ELSE CASE WHEN (0.7526727134907277::DOUBLE) * x::DOUBLE + (0.658394855969049::DOUBLE) * y::DOUBLE >= (6.942686587829656::DOUBLE)
                              THEN CASE WHEN (0.8991052488337254::DOUBLE) * x::DOUBLE + (0.43773251138068864::DOUBLE) * y::DOUBLE >= (6.619937744308463::DOUBLE)
                                THEN CASE WHEN (0.03458820632909938::DOUBLE) * x::DOUBLE + (-0.9994016489794959::DOUBLE) * y::DOUBLE >= (-4.948175993451417::DOUBLE)
                                  THEN 401
                                  ELSE 400
                                END
                                ELSE CASE WHEN (0.8743999526536603::DOUBLE) * x::DOUBLE + (-0.4852058561057116::DOUBLE) * y::DOUBLE >= (1.7744551656316108::DOUBLE)
                                  THEN 401
                                  ELSE 387
                                END
                              END
                              ELSE CASE WHEN (0.6041706949826583::DOUBLE) * x::DOUBLE + (0.7968549248917093::DOUBLE) * y::DOUBLE >= (6.879120149294178::DOUBLE)
                                THEN CASE WHEN (0.03563809760288821::DOUBLE) * x::DOUBLE + (-0.9993647612354796::DOUBLE) * y::DOUBLE >= (-4.857474338043892::DOUBLE)
                                  THEN 388
                                  ELSE 387
                                END
                                ELSE CASE WHEN (0.9568236052584619::DOUBLE) * x::DOUBLE + (-0.290669207898255::DOUBLE) * y::DOUBLE >= (3.084608671257425::DOUBLE)
                                  THEN 388
                                  ELSE 376
                                END
                              END
                            END
                          END
                        END
                      END
                    END
                  END
                  ELSE CASE WHEN (0.55305407741887::DOUBLE) * x::DOUBLE + (0.8331453579360341::DOUBLE) * y::DOUBLE >= (5.2254980859361::DOUBLE)
                    THEN CASE WHEN (0.9179212603938361::DOUBLE) * x::DOUBLE + (-0.39676259868716346::DOUBLE) * y::DOUBLE >= (3.0103760852303756::DOUBLE)
                      THEN CASE WHEN (0.07834004794884279::DOUBLE) * x::DOUBLE + (0.9969266958444704::DOUBLE) * y::DOUBLE >= (4.4183526215636695::DOUBLE)
                        THEN CASE WHEN (0.8299733900837516::DOUBLE) * x::DOUBLE + (-0.5578029865040924::DOUBLE) * y::DOUBLE >= (2.051028952639771::DOUBLE)
                          THEN CASE WHEN (0.9882844364923808::DOUBLE) * x::DOUBLE + (0.1526233028961744::DOUBLE) * y::DOUBLE >= (6.334197881099917::DOUBLE)
                            THEN CASE WHEN (0.33673859809058354::DOUBLE) * x::DOUBLE + (-0.9415981714914214::DOUBLE) * y::DOUBLE >= (-1.925859124946398::DOUBLE)
                              THEN CASE WHEN (0.8004019323455968::DOUBLE) * x::DOUBLE + (-0.5994637159140116::DOUBLE) * y::DOUBLE >= (2.285704727088389::DOUBLE)
                                THEN 496
                                ELSE CASE WHEN (0.9788850073608406::DOUBLE) * x::DOUBLE + (0.20441169820772706::DOUBLE) * y::DOUBLE >= (6.549197026858384::DOUBLE)
                                  THEN 502
                                  ELSE 477
                                END
                              END
                              ELSE CASE WHEN (0.42642699203369105::DOUBLE) * x::DOUBLE + (0.9045219845117632::DOUBLE) * y::DOUBLE >= (6.236378726603215::DOUBLE)
                                THEN CASE WHEN (0.8578086205401928::DOUBLE) * x::DOUBLE + (-0.5139692311091506::DOUBLE) * y::DOUBLE >= (2.834685286473466::DOUBLE)
                                  THEN 497
                                  ELSE 487
                                END
                                ELSE CASE WHEN (0.7239368316068955::DOUBLE) * x::DOUBLE + (0.6898662651869342::DOUBLE) * y::DOUBLE >= (7.068055465105952::DOUBLE)
                                  THEN 497
                                  ELSE 477
                                END
                              END
                            END
                            ELSE CASE WHEN (0.0856731049289719::DOUBLE) * x::DOUBLE + (-0.9963233004862575::DOUBLE) * y::DOUBLE >= (-3.6680092601559915::DOUBLE)
                              THEN CASE WHEN (0.048916671586456614::DOUBLE) * x::DOUBLE + (0.9988028630520153::DOUBLE) * y::DOUBLE >= (4.315431657669071::DOUBLE)
                                THEN CASE WHEN (0.8418200150049422::DOUBLE) * x::DOUBLE + (-0.5397583369778358::DOUBLE) * y::DOUBLE >= (2.438757224223668::DOUBLE)
                                  THEN 477
                                  ELSE 453
                                END
                                ELSE CASE WHEN (0.9373759891284458::DOUBLE) * x::DOUBLE + (0.34831918552595975::DOUBLE) * y::DOUBLE >= (6.561856565493477::DOUBLE)
                                  THEN 477
                                  ELSE 451
                                END
                              END
                              ELSE CASE WHEN (0.5029407079695118::DOUBLE) * x::DOUBLE + (0.8643209150929568::DOUBLE) * y::DOUBLE >= (6.453740747462533::DOUBLE)
                                THEN CASE WHEN (0.8954512660931406::DOUBLE) * x::DOUBLE + (-0.44515955572377813::DOUBLE) * y::DOUBLE >= (3.0546531789736875::DOUBLE)
                                  THEN 471
                                  ELSE 460
                                END
                                ELSE CASE WHEN (0.9194327102432113::DOUBLE) * x::DOUBLE + (0.3932473665961709::DOUBLE) * y::DOUBLE >= (6.751939666025773::DOUBLE)
                                  THEN 471
                                  ELSE 453
                                END
                              END
                            END
                          END
                          ELSE CASE WHEN (0.5029407079695118::DOUBLE) * x::DOUBLE + (0.8643209150929568::DOUBLE) * y::DOUBLE >= (6.453740747462533::DOUBLE)
                            THEN CASE WHEN (0.46160206215379535::DOUBLE) * x::DOUBLE + (-0.8870871074564005::DOUBLE) * y::DOUBLE >= (-1.605183540699354::DOUBLE)
                              THEN CASE WHEN (0.932140787782793::DOUBLE) * x::DOUBLE + (-0.36209605321195404::DOUBLE) * y::DOUBLE >= (3.4390369314672427::DOUBLE)
                                THEN CASE WHEN (0.027067045849455434::DOUBLE) * x::DOUBLE + (0.9996336203974852::DOUBLE) * y::DOUBLE >= (4.631417436742824::DOUBLE)
                                  THEN 461
                                  ELSE 460
                                END
                                ELSE CASE WHEN (0.340279265856665::DOUBLE) * x::DOUBLE + (0.9403244233922934::DOUBLE) * y::DOUBLE >= (6.080449639141009::DOUBLE)
                                  THEN CASE WHEN (0.9816364193856703::DOUBLE) * x::DOUBLE + (-0.1907614744535185::DOUBLE) * y::DOUBLE >= (4.4616713009517::DOUBLE)
                                    THEN 461
                                    ELSE 448
                                  END
                                  ELSE CASE WHEN (0.8528433137066347::DOUBLE) * x::DOUBLE + (0.5221669103513614::DOUBLE) * y::DOUBLE >= (6.97512322517902::DOUBLE)
                                    THEN 461
                                    ELSE 441
                                  END
                                END
                              END
                              ELSE CASE WHEN (0.9638731001465488::DOUBLE) * x::DOUBLE + (-0.26636187192216704::DOUBLE) * y::DOUBLE >= (3.8741806258474103::DOUBLE)
                                THEN 448
                                ELSE 432
                              END
                            END
                            ELSE CASE WHEN (0.842931845063349::DOUBLE) * x::DOUBLE + (0.5380203570294514::DOUBLE) * y::DOUBLE >= (6.577043859045359::DOUBLE)
                              THEN CASE WHEN (0.5743303361589096::DOUBLE) * x::DOUBLE + (0.8186236406112359::DOUBLE) * y::DOUBLE >= (6.609752986334758::DOUBLE)
                                THEN CASE WHEN (0.27079373478785174::DOUBLE) * x::DOUBLE + (-0.9626373944532004::DOUBLE) * y::DOUBLE >= (-2.721547281273832::DOUBLE)
                                  THEN 453
                                  ELSE 441
                                END
                                ELSE CASE WHEN (0.8840016850045859::DOUBLE) * x::DOUBLE + (-0.46748371191845056::DOUBLE) * y::DOUBLE >= (2.6954827148255225::DOUBLE)
                                  THEN 453
                                  ELSE 429
                                END
                              END
                              ELSE CASE WHEN (0.9954489693339252::DOUBLE) * x::DOUBLE + (0.0952961145694089::DOUBLE) * y::DOUBLE >= (5.567450303633452::DOUBLE)
                                THEN 453
                                ELSE 410
                              END
                            END
                          END
                        END
                        ELSE CASE WHEN (0.9330670933237378::DOUBLE) * x::DOUBLE + (0.35970237607832245::DOUBLE) * y::DOUBLE >= (6.453217343125636::DOUBLE)
                          THEN CASE WHEN (0.9373759891284458::DOUBLE) * x::DOUBLE + (0.34831918552595975::DOUBLE) * y::DOUBLE >= (6.561856565493477::DOUBLE)
                            THEN CASE WHEN (0.10506384901597154::DOUBLE) * x::DOUBLE + (-0.9944654783500276::DOUBLE) * y::DOUBLE >= (-3.1653998402437846::DOUBLE)
                              THEN CASE WHEN (0.5569394854574758::DOUBLE) * x::DOUBLE + (0.8305530744861294::DOUBLE) * y::DOUBLE >= (6.311825682474162::DOUBLE)
                                THEN 496
                                ELSE 484
                              END
                              ELSE CASE WHEN (0.8004019323455968::DOUBLE) * x::DOUBLE + (-0.5994637159140116::DOUBLE) * y::DOUBLE >= (2.285704727088389::DOUBLE)
                                THEN 496
                                ELSE 477
                              END
                            END
                            ELSE CASE WHEN (0.6982882559010928::DOUBLE) * x::DOUBLE + (-0.7158166746245926::DOUBLE) * y::DOUBLE >= (1.207031829953741::DOUBLE)
                              THEN 484
                              ELSE 451
                            END
                          END
                          ELSE CASE WHEN (0.24934174493474692::DOUBLE) * x::DOUBLE + (-0.9684155586487113::DOUBLE) * y::DOUBLE >= (-1.9854155842659795::DOUBLE)
                            THEN CASE WHEN (0.950364995400335::DOUBLE) * x::DOUBLE + (-0.3111372293984138::DOUBLE) * y::DOUBLE >= (3.486380657084866::DOUBLE)
                              THEN CASE WHEN (0.44024948876535963::DOUBLE) * x::DOUBLE + (0.8978754856002248::DOUBLE) * y::DOUBLE >= (4.976798256927053::DOUBLE)
                                THEN CASE WHEN (0.9926604888652809::DOUBLE) * x::DOUBLE + (-0.12093450229666279::DOUBLE) * y::DOUBLE >= (4.753602895310946::DOUBLE)
                                  THEN CASE WHEN (0.12003429287302485::DOUBLE) * x::DOUBLE + (0.9927697459806442::DOUBLE) * y::DOUBLE >= (3.888285875608321::DOUBLE)
                                    THEN CASE WHEN (0.4243486683249894::DOUBLE) * x::DOUBLE + (-0.9054988722747302::DOUBLE) * y::DOUBLE >= (-0.5357287778515243::DOUBLE)
                                      THEN 470
                                      ELSE 456
                                    END
                                    ELSE CASE WHEN (0.8577756734287596::DOUBLE) * x::DOUBLE + (-0.5140242154547178::DOUBLE) * y::DOUBLE >= (3.1750541682141895::DOUBLE)
                                      THEN 470
                                      ELSE 450
                                    END
                                  END
                                  ELSE CASE WHEN (0.8492831131005166::DOUBLE) * x::DOUBLE + (0.5279376798470581::DOUBLE) * y::DOUBLE >= (6.143791651640889::DOUBLE)
                                    THEN 456
                                    ELSE 404
                                  END
                                END
                                ELSE CASE WHEN (0.5851548683165998::DOUBLE) * x::DOUBLE + (-0.8109215622274344::DOUBLE) * y::DOUBLE >= (0.5723618978306::DOUBLE)
                                  THEN CASE WHEN (0.5827939996833954::DOUBLE) * x::DOUBLE + (-0.8126199320303623::DOUBLE) * y::DOUBLE >= (0.986871396891059::DOUBLE)
                                    THEN CASE WHEN (0.3413809130028527::DOUBLE) * x::DOUBLE + (0.9399250354349216::DOUBLE) * y::DOUBLE >= (4.428011487625811::DOUBLE)
                                      THEN 470
                                      ELSE 459
                                    END
                                    ELSE CASE WHEN (0.9444571378740573::DOUBLE) * x::DOUBLE + (0.3286346219112406::DOUBLE) * y::DOUBLE >= (6.073541005321778::DOUBLE)
                                      THEN 470
                                      ELSE 431
                                    END
                                  END
                                  ELSE 404
                                END
                              END
                              ELSE 358
                            END
                            ELSE CASE WHEN (0.598571937207873::DOUBLE) * x::DOUBLE + (0.8010690581886273::DOUBLE) * y::DOUBLE >= (5.887741948788073::DOUBLE)
                              THEN CASE WHEN (0.2322922060625934::DOUBLE) * x::DOUBLE + (-0.9726460461044262::DOUBLE) * y::DOUBLE >= (-2.687610168432715::DOUBLE)
                                THEN CASE WHEN (0.8972584370383397::DOUBLE) * x::DOUBLE + (0.44150571588997106::DOUBLE) * y::DOUBLE >= (6.3897095571696685::DOUBLE)
                                  THEN CASE WHEN (0.07949282090201867::DOUBLE) * x::DOUBLE + (-0.9968354384877374::DOUBLE) * y::DOUBLE >= (-3.2288252394423287::DOUBLE)
                                    THEN 456
                                    ELSE 451
                                  END
                                  ELSE CASE WHEN (0.6938292621895711::DOUBLE) * x::DOUBLE + (-0.7201395385128325::DOUBLE) * y::DOUBLE >= (1.0523317669538241::DOUBLE)
                                    THEN 456
                                    ELSE 418
                                  END
                                END
                                ELSE CASE WHEN (0.8299733900837516::DOUBLE) * x::DOUBLE + (-0.5578029865040924::DOUBLE) * y::DOUBLE >= (2.051028952639771::DOUBLE)
                                  THEN 451
                                  ELSE 410
                                END
                              END
                              ELSE CASE WHEN (0.9091012325508645::DOUBLE) * x::DOUBLE + (0.4165752620769731::DOUBLE) * y::DOUBLE >= (5.6707183884656045::DOUBLE)
                                THEN CASE WHEN (0.9946936297631739::DOUBLE) * x::DOUBLE + (-0.10288140215103116::DOUBLE) * y::DOUBLE >= (4.7631242493560615::DOUBLE)
                                  THEN 456
                                  ELSE 395
                                END
                                ELSE 358
                              END
                            END
                          END
                        END
                      END
                      ELSE CASE WHEN (0.05762926575549048::DOUBLE) * x::DOUBLE + (0.9983380528300436::DOUBLE) * y::DOUBLE >= (4.716331810887804::DOUBLE)
                        THEN CASE WHEN (0.8967822697209886::DOUBLE) * x::DOUBLE + (-0.4424721016223191::DOUBLE) * y::DOUBLE >= (2.265875961017828::DOUBLE)
                          THEN CASE WHEN (0.7764486132957432::DOUBLE) * x::DOUBLE + (-0.6301805700837795::DOUBLE) * y::DOUBLE >= (1.02793995112591::DOUBLE)
                            THEN CASE WHEN (0.42938320465027263::DOUBLE) * x::DOUBLE + (0.9031223967792306::DOUBLE) * y::DOUBLE >= (6.24533752990213::DOUBLE)
                              THEN CASE WHEN (0.9007035430393278::DOUBLE) * x::DOUBLE + (0.43443426149004627::DOUBLE) * y::DOUBLE >= (6.659156136688348::DOUBLE)
                                THEN CASE WHEN (0.46160206215379535::DOUBLE) * x::DOUBLE + (-0.8870871074564005::DOUBLE) * y::DOUBLE >= (-1.605183540699354::DOUBLE)
                                  THEN 441
                                  ELSE 432
                                END
                                ELSE CASE WHEN (0.857074261821537::DOUBLE) * x::DOUBLE + (-0.5151928859398851::DOUBLE) * y::DOUBLE >= (2.137758186159859::DOUBLE)
                                  THEN 441
                                  ELSE 421
                                END
                              END
                              ELSE CASE WHEN (0.8267383360859503::DOUBLE) * x::DOUBLE + (-0.562586636568835::DOUBLE) * y::DOUBLE >= (1.777809186560361::DOUBLE)
                                THEN CASE WHEN (0.5743303361589096::DOUBLE) * x::DOUBLE + (0.8186236406112359::DOUBLE) * y::DOUBLE >= (6.609752986334758::DOUBLE)
                                  THEN 441
                                  ELSE 429
                                END
                                ELSE CASE WHEN (0.9900609035969012::DOUBLE) * x::DOUBLE + (0.1406392803198567::DOUBLE) * y::DOUBLE >= (5.748005636025381::DOUBLE)
                                  THEN 441
                                  ELSE 412
                                END
                              END
                            END
                            ELSE CASE WHEN (0.08876013134230638::DOUBLE) * x::DOUBLE + (0.9960530302569721::DOUBLE) * y::DOUBLE >= (5.068732143845892::DOUBLE)
                              THEN CASE WHEN (0.7466329635426326::DOUBLE) * x::DOUBLE + (-0.6652362119965705::DOUBLE) * y::DOUBLE >= (0.6285517739289697::DOUBLE)
                                THEN CASE WHEN (0.004988818559887512::DOUBLE) * x::DOUBLE + (0.9999875557672587::DOUBLE) * y::DOUBLE >= (4.710695218287127::DOUBLE)
                                  THEN 422
                                  ELSE 421
                                END
                                ELSE CASE WHEN (0.9969501357908052::DOUBLE) * x::DOUBLE + (0.07804118622045038::DOUBLE) * y::DOUBLE >= (5.3671230656848845::DOUBLE)
                                  THEN 422
                                  ELSE 399
                                END
                              END
                              ELSE CASE WHEN (0.9755356106771056::DOUBLE) * x::DOUBLE + (0.21984147083943634::DOUBLE) * y::DOUBLE >= (5.879777313569972::DOUBLE)
                                THEN 421
                                ELSE 397
                              END
                            END
                          END
                          ELSE CASE WHEN (0.9568236052584619::DOUBLE) * x::DOUBLE + (-0.290669207898255::DOUBLE) * y::DOUBLE >= (3.084608671257425::DOUBLE)
                            THEN CASE WHEN (0.31530222993604484::DOUBLE) * x::DOUBLE + (0.9489913085994821::DOUBLE) * y::DOUBLE >= (6.035740208895268::DOUBLE)
                              THEN CASE WHEN (0.5736981535684261::DOUBLE) * x::DOUBLE + (-0.8190668034978458::DOUBLE) * y::DOUBLE >= (-1.191210591489714::DOUBLE)
                                THEN 399
                                ELSE 388
                              END
                              ELSE CASE WHEN (0.8544528231714673::DOUBLE) * x::DOUBLE + (0.5195289914666066::DOUBLE) * y::DOUBLE >= (6.543414987744928::DOUBLE)
                                THEN 399
                                ELSE 381
                              END
                            END
                            ELSE CASE WHEN (0.5028778285973854::DOUBLE) * x::DOUBLE + (-0.8643575009827695::DOUBLE) * y::DOUBLE >= (-1.653729450746161::DOUBLE)
                              THEN CASE WHEN (0.6698449066525176::DOUBLE) * x::DOUBLE + (0.7425010444650432::DOUBLE) * y::DOUBLE >= (6.369365771898657::DOUBLE)
                                THEN 381
                                ELSE 350
                              END
                              ELSE CASE WHEN (0.7782193600283889::DOUBLE) * x::DOUBLE + (0.6279925379150654::DOUBLE) * y::DOUBLE >= (6.339426101572499::DOUBLE)
                                THEN CASE WHEN (0.5717680395574223::DOUBLE) * x::DOUBLE + (0.8204153271000376::DOUBLE) * y::DOUBLE >= (6.615061311225542::DOUBLE)
                                  THEN CASE WHEN (0.07116651851774478::DOUBLE) * x::DOUBLE + (-0.997464448811116::DOUBLE) * y::DOUBLE >= (-4.458688883921213::DOUBLE)
                                    THEN 381
                                    ELSE 376
                                  END
                                  ELSE CASE WHEN (0.8274052586800036::DOUBLE) * x::DOUBLE + (-0.5616053221869219::DOUBLE) * y::DOUBLE >= (1.171808963377126::DOUBLE)
                                    THEN 381
                                    ELSE 362
                                  END
                                END
                                ELSE CASE WHEN (0.9823523570175031::DOUBLE) * x::DOUBLE + (0.1870396927450324::DOUBLE) * y::DOUBLE >= (5.258768003222924::DOUBLE)
                                  THEN 381
                                  ELSE 337
                                END
                              END
                            END
                          END
                        END
                        ELSE CASE WHEN (0.598571937207873::DOUBLE) * x::DOUBLE + (0.8010690581886273::DOUBLE) * y::DOUBLE >= (5.887741948788073::DOUBLE)
                          THEN CASE WHEN (0.028567508362432797::DOUBLE) * x::DOUBLE + (-0.9995918654460741::DOUBLE) * y::DOUBLE >= (-3.9860390554569536::DOUBLE)
                            THEN CASE WHEN (0.9828173722264544::DOUBLE) * x::DOUBLE + (0.18458064050676373::DOUBLE) * y::DOUBLE >= (5.443682305866102::DOUBLE)
                              THEN CASE WHEN (0.847357205924117::DOUBLE) * x::DOUBLE + (0.5310233192322853::DOUBLE) * y::DOUBLE >= (6.258106181319343::DOUBLE)
                                THEN CASE WHEN (0.2322922060625934::DOUBLE) * x::DOUBLE + (-0.9726460461044262::DOUBLE) * y::DOUBLE >= (-2.687610168432715::DOUBLE)
                                  THEN 418
                                  ELSE 410
                                END
                                ELSE CASE WHEN (0.8973969410160924::DOUBLE) * x::DOUBLE + (-0.44122412700912::DOUBLE) * y::DOUBLE >= (2.6757902258950717::DOUBLE)
                                  THEN 418
                                  ELSE 378
                                END
                              END
                              ELSE CASE WHEN (0.6202620648621912::DOUBLE) * x::DOUBLE + (-0.7843946525142118::DOUBLE) * y::DOUBLE >= (-0.43293791792867786::DOUBLE)
                                THEN CASE WHEN (0.28423984346137643::DOUBLE) * x::DOUBLE + (0.9587532067164377::DOUBLE) * y::DOUBLE >= (4.981608568705962::DOUBLE)
                                  THEN 378
                                  ELSE 369
                                END
                                ELSE 350
                              END
                            END
                            ELSE CASE WHEN (0.7764486132957432::DOUBLE) * x::DOUBLE + (-0.6301805700837795::DOUBLE) * y::DOUBLE >= (1.02793995112591::DOUBLE)
                              THEN CASE WHEN (0.9497474079924396::DOUBLE) * x::DOUBLE + (-0.3130173493780217::DOUBLE) * y::DOUBLE >= (3.2680773454392877::DOUBLE)
                                THEN CASE WHEN (0.1456878094344139::DOUBLE) * x::DOUBLE + (0.9893306131835817::DOUBLE) * y::DOUBLE >= (4.978447790524896::DOUBLE)
                                  THEN CASE WHEN (0.8267383360859503::DOUBLE) * x::DOUBLE + (-0.562586636568835::DOUBLE) * y::DOUBLE >= (1.777809186560361::DOUBLE)
                                    THEN 429
                                    ELSE 412
                                  END
                                  ELSE CASE WHEN (0.842931845063349::DOUBLE) * x::DOUBLE + (0.5380203570294514::DOUBLE) * y::DOUBLE >= (6.577043859045359::DOUBLE)
                                    THEN 429
                                    ELSE 410
                                  END
                                END
                                ELSE CASE WHEN (0.9250091326622807::DOUBLE) * x::DOUBLE + (0.37994487033170377::DOUBLE) * y::DOUBLE >= (6.138555469492017::DOUBLE)
                                  THEN 412
                                  ELSE 377
                                END
                              END
                              ELSE CASE WHEN (0.9868609481327218::DOUBLE) * x::DOUBLE + (-0.16157186961406672::DOUBLE) * y::DOUBLE >= (3.7834651568015816::DOUBLE)
                                THEN CASE WHEN (0.6362419032791653::DOUBLE) * x::DOUBLE + (0.7714896243707399::DOUBLE) * y::DOUBLE >= (6.439330489392734::DOUBLE)
                                  THEN 397
                                  ELSE 377
                                END
                                ELSE 350
                              END
                            END
                          END
                          ELSE CASE WHEN (0.96365436353948::DOUBLE) * x::DOUBLE + (0.2671521432280112::DOUBLE) * y::DOUBLE >= (5.202807346889848::DOUBLE)
                            THEN CASE WHEN (0.40136505951930307::DOUBLE) * x::DOUBLE + (-0.9159181671945732::DOUBLE) * y::DOUBLE >= (-1.4849116966566307::DOUBLE)
                              THEN CASE WHEN (0.2740866196017799::DOUBLE) * x::DOUBLE + (0.9617050093221254::DOUBLE) * y::DOUBLE >= (4.6003376380453105::DOUBLE)
                                THEN CASE WHEN (0.8341725676490926::DOUBLE) * x::DOUBLE + (-0.5515035152940729::DOUBLE) * y::DOUBLE >= (1.9751269327643972::DOUBLE)
                                  THEN 395
                                  ELSE 369
                                END
                                ELSE CASE WHEN (0.9091012325508645::DOUBLE) * x::DOUBLE + (0.4165752620769731::DOUBLE) * y::DOUBLE >= (5.6707183884656045::DOUBLE)
                                  THEN 395
                                  ELSE 358
                                END
                              END
                              ELSE CASE WHEN (0.22548066359016478::DOUBLE) * x::DOUBLE + (0.974247643233967::DOUBLE) * y::DOUBLE >= (4.9220585346363::DOUBLE)
                                THEN CASE WHEN (0.6202620648621912::DOUBLE) * x::DOUBLE + (-0.7843946525142118::DOUBLE) * y::DOUBLE >= (-0.43293791792867786::DOUBLE)
                                  THEN 378
                                  ELSE 350
                                END
                                ELSE CASE WHEN (0.949009146794146::DOUBLE) * x::DOUBLE + (-0.3152485357635255::DOUBLE) * y::DOUBLE >= (3.034472854825604::DOUBLE)
                                  THEN CASE WHEN (0.28423984346137643::DOUBLE) * x::DOUBLE + (0.9587532067164377::DOUBLE) * y::DOUBLE >= (4.981608568705962::DOUBLE)
                                    THEN 378
                                    ELSE 369
                                  END
                                  ELSE CASE WHEN (0.9018084549056454::DOUBLE) * x::DOUBLE + (0.4321359863060384::DOUBLE) * y::DOUBLE >= (5.713136776508238::DOUBLE)
                                    THEN 378
                                    ELSE 339
                                  END
                                END
                              END
                            END
                            ELSE CASE WHEN (0.9969877523399902::DOUBLE) * x::DOUBLE + (-0.07755914958310481::DOUBLE) * y::DOUBLE >= (3.989990185736439::DOUBLE)
                              THEN CASE WHEN (0.40136505951930307::DOUBLE) * x::DOUBLE + (-0.9159181671945732::DOUBLE) * y::DOUBLE >= (-1.4849116966566307::DOUBLE)
                                THEN CASE WHEN (0.2740866196017799::DOUBLE) * x::DOUBLE + (0.9617050093221254::DOUBLE) * y::DOUBLE >= (4.6003376380453105::DOUBLE)
                                  THEN 369
                                  ELSE 358
                                END
                                ELSE CASE WHEN (0.949009146794146::DOUBLE) * x::DOUBLE + (-0.3152485357635255::DOUBLE) * y::DOUBLE >= (3.034472854825604::DOUBLE)
                                  THEN 369
                                  ELSE 339
                                END
                              END
                              ELSE CASE WHEN (0.49808446668771234::DOUBLE) * x::DOUBLE + (-0.8671285164520984::DOUBLE) * y::DOUBLE >= (-1.3953147042917728::DOUBLE)
                                THEN CASE WHEN (0.13301626352543866::DOUBLE) * x::DOUBLE + (-0.9911138550326754::DOUBLE) * y::DOUBLE >= (-2.9663750271824183::DOUBLE)
                                  THEN CASE WHEN (0.48796081081596937::DOUBLE) * x::DOUBLE + (0.8728655378165768::DOUBLE) * y::DOUBLE >= (5.135338376182293::DOUBLE)
                                    THEN 339
                                    ELSE 321
                                  END
                                  ELSE CASE WHEN (0.9821591472165327::DOUBLE) * x::DOUBLE + (0.1880516140289499::DOUBLE) * y::DOUBLE >= (4.762981572503109::DOUBLE)
                                    THEN 339
                                    ELSE 313
                                  END
                                END
                                ELSE 319
                              END
                            END
                          END
                        END
                      END
                    END
                    ELSE CASE WHEN (0.23884392291522177::DOUBLE) * x::DOUBLE + (-0.9710579696838225::DOUBLE) * y::DOUBLE >= (-0.9295562808487476::DOUBLE)
                      THEN CASE WHEN (0.12716150564434472::DOUBLE) * x::DOUBLE + (0.9918820249819348::DOUBLE) * y::DOUBLE >= (1.7010912806637248::DOUBLE)
                        THEN CASE WHEN (0.9736837436898121::DOUBLE) * x::DOUBLE + (0.2279034165478708::DOUBLE) * y::DOUBLE >= (5.088480183401778::DOUBLE)
                          THEN CASE WHEN (0.04339158901437196::DOUBLE) * x::DOUBLE + (-0.9990581414526424::DOUBLE) * y::DOUBLE >= (-1.6256204033086845::DOUBLE)
                            THEN CASE WHEN (0.20258229476927575::DOUBLE) * x::DOUBLE + (-0.9792652418247133::DOUBLE) * y::DOUBLE >= (-0.5953041289782298::DOUBLE)
                              THEN CASE WHEN (0.6048377331342727::DOUBLE) * x::DOUBLE + (0.7963487405508936::DOUBLE) * y::DOUBLE >= (4.258264358794727::DOUBLE)
                                THEN CASE WHEN (0.3022664983835791::DOUBLE) * x::DOUBLE + (-0.9532234596121362::DOUBLE) * y::DOUBLE >= (0.16100069820360585::DOUBLE)
                                  THEN 442
                                  ELSE 426
                                END
                                ELSE CASE WHEN (0.9948850162671288::DOUBLE) * x::DOUBLE + (-0.10101388224969376::DOUBLE) * y::DOUBLE >= (4.950340538147004::DOUBLE)
                                  THEN 442
                                  ELSE 398
                                END
                              END
                              ELSE CASE WHEN (0.912848095642388::DOUBLE) * x::DOUBLE + (-0.4082993439647751::DOUBLE) * y::DOUBLE >= (3.8143270743728332::DOUBLE)
                                THEN 426
                                ELSE 386
                              END
                            END
                            ELSE CASE WHEN (0.522869504003901::DOUBLE) * x::DOUBLE + (0.8524127414478944::DOUBLE) * y::DOUBLE >= (4.3310462517947474::DOUBLE)
                              THEN CASE WHEN (0.5145725550990784::DOUBLE) * x::DOUBLE + (-0.8574468412320416::DOUBLE) * y::DOUBLE >= (0.7933683051475897::DOUBLE)
                                THEN CASE WHEN (0.5879017150706682::DOUBLE) * x::DOUBLE + (0.8089323664046127::DOUBLE) * y::DOUBLE >= (4.784633302879329::DOUBLE)
                                  THEN 443
                                  ELSE 425
                                END
                                ELSE CASE WHEN (0.9812337387856087::DOUBLE) * x::DOUBLE + (-0.1928220678989201::DOUBLE) * y::DOUBLE >= (4.640106817710979::DOUBLE)
                                  THEN 443
                                  ELSE 411
                                END
                              END
                              ELSE CASE WHEN (0.9654834361588324::DOUBLE) * x::DOUBLE + (0.26046445919344546::DOUBLE) * y::DOUBLE >= (5.31119983079873::DOUBLE)
                                THEN 425
                                ELSE 386
                              END
                            END
                          END
                          ELSE CASE WHEN (0.22882092237468132::DOUBLE) * x::DOUBLE + (0.9734685333813313::DOUBLE) * y::DOUBLE >= (2.5905718432738816::DOUBLE)
                            THEN CASE WHEN (0.6739767615746836::DOUBLE) * x::DOUBLE + (-0.7387525464303336::DOUBLE) * y::DOUBLE >= (1.6686962309608293::DOUBLE)
                              THEN CASE WHEN (0.6304475181758326::DOUBLE) * x::DOUBLE + (0.7762318769710076::DOUBLE) * y::DOUBLE >= (4.261256916888456::DOUBLE)
                                THEN CASE WHEN (0.20258229476927575::DOUBLE) * x::DOUBLE + (-0.9792652418247133::DOUBLE) * y::DOUBLE >= (-0.5953041289782298::DOUBLE)
                                  THEN 398
                                  ELSE 386
                                END
                                ELSE CASE WHEN (0.8718122888259455::DOUBLE) * x::DOUBLE + (-0.48984010968076735::DOUBLE) * y::DOUBLE >= (3.393157964370698::DOUBLE)
                                  THEN 398
                                  ELSE 360
                                END
                              END
                              ELSE CASE WHEN (0.9976783877171727::DOUBLE) * x::DOUBLE + (0.06810164962805888::DOUBLE) * y::DOUBLE >= (4.115730119453438::DOUBLE)
                                THEN CASE WHEN (0.6528369527582576::DOUBLE) * x::DOUBLE + (0.7574984574989658::DOUBLE) * y::DOUBLE >= (4.344169625706021::DOUBLE)
                                  THEN CASE WHEN (0.802379813130672::DOUBLE) * x::DOUBLE + (-0.5968137360017678::DOUBLE) * y::DOUBLE >= (2.492998254979293::DOUBLE)
                                    THEN 386
                                    ELSE 354
                                  END
                                  ELSE CASE WHEN (0.9997790130762007::DOUBLE) * x::DOUBLE + (0.021022012567259673::DOUBLE) * y::DOUBLE >= (4.530847866279412::DOUBLE)
                                    THEN 386
                                    ELSE 333
                                  END
                                END
                                ELSE 300
                              END
                            END
                            ELSE CASE WHEN (0.5681740237568612::DOUBLE) * x::DOUBLE + (-0.822908426696396::DOUBLE) * y::DOUBLE >= (1.3585163898415273::DOUBLE)
                              THEN CASE WHEN (0.2283181472983721::DOUBLE) * x::DOUBLE + (0.9735865773593219::DOUBLE) * y::DOUBLE >= (2.296509540810801::DOUBLE)
                                THEN CASE WHEN (0.8718122888259455::DOUBLE) * x::DOUBLE + (-0.48984010968076735::DOUBLE) * y::DOUBLE >= (3.393157964370698::DOUBLE)
                                  THEN 398
                                  ELSE 360
                                END
                                ELSE CASE WHEN (0.8981463444487789::DOUBLE) * x::DOUBLE + (0.43969664992275653::DOUBLE) * y::DOUBLE >= (4.702242207757505::DOUBLE)
                                  THEN 398
                                  ELSE 349
                                END
                              END
                              ELSE CASE WHEN (0.988795361488059::DOUBLE) * x::DOUBLE + (0.14927736968374808::DOUBLE) * y::DOUBLE >= (4.486778047408813::DOUBLE)
                                THEN 360
                                ELSE CASE WHEN (0.11647491306598057::DOUBLE) * x::DOUBLE + (-0.9931936340041011::DOUBLE) * y::DOUBLE >= (-1.160505432295432::DOUBLE)
                                  THEN CASE WHEN (0.9281060399604318::DOUBLE) * x::DOUBLE + (0.3723159660677547::DOUBLE) * y::DOUBLE >= (4.228590698942195::DOUBLE)
                                    THEN 326
                                    ELSE 303
                                  END
                                  ELSE CASE WHEN (0.6651186981392232::DOUBLE) * x::DOUBLE + (-0.74673764963713::DOUBLE) * y::DOUBLE >= (1.3820727653500402::DOUBLE)
                                    THEN 326
                                    ELSE 300
                                  END
                                END
                              END
                            END
                          END
                        END
                        ELSE CASE WHEN (0.8317711341198493::DOUBLE) * x::DOUBLE + (0.5551187084263868::DOUBLE) * y::DOUBLE >= (4.037201875748165::DOUBLE)
                          THEN CASE WHEN (0.6169632901539518::DOUBLE) * x::DOUBLE + (-0.7869919304557136::DOUBLE) * y::DOUBLE >= (2.0912753860857882::DOUBLE)
                            THEN CASE WHEN (0.007750050516871061::DOUBLE) * x::DOUBLE + (0.9999699679075297::DOUBLE) * y::DOUBLE >= (0.5745776924158381::DOUBLE)
                              THEN CASE WHEN (0.33429076164709287::DOUBLE) * x::DOUBLE + (0.9424699924546175::DOUBLE) * y::DOUBLE >= (2.5646078164358412::DOUBLE)
                                THEN CASE WHEN (0.5550196459341611::DOUBLE) * x::DOUBLE + (-0.8318372392644598::DOUBLE) * y::DOUBLE >= (1.9371162146253438::DOUBLE)
                                  THEN 436
                                  ELSE 398
                                END
                                ELSE CASE WHEN (0.9923512416249639::DOUBLE) * x::DOUBLE + (0.12344639826820684::DOUBLE) * y::DOUBLE >= (5.023315986039853::DOUBLE)
                                  THEN 436
                                  ELSE 379
                                END
                              END
                              ELSE CASE WHEN (0.14230130436204785::DOUBLE) * x::DOUBLE + (-0.9898233876691637::DOUBLE) * y::DOUBLE >= (0.2104124139897312::DOUBLE)
                                THEN CASE WHEN (0.9916266188633367::DOUBLE) * x::DOUBLE + (0.12913809957431918::DOUBLE) * y::DOUBLE >= (4.992473729073942::DOUBLE)
                                  THEN 435
                                  ELSE 385
                                END
                                ELSE CASE WHEN (0.7937326072549765::DOUBLE) * x::DOUBLE + (-0.6082668396191074::DOUBLE) * y::DOUBLE >= (3.6390319703444183::DOUBLE)
                                  THEN 435
                                  ELSE 379
                                END
                              END
                            END
                            ELSE CASE WHEN (0.8981463444487789::DOUBLE) * x::DOUBLE + (0.43969664992275653::DOUBLE) * y::DOUBLE >= (4.702242207757505::DOUBLE)
                              THEN 398
                              ELSE CASE WHEN (0.9281060399604318::DOUBLE) * x::DOUBLE + (0.3723159660677547::DOUBLE) * y::DOUBLE >= (4.228590698942195::DOUBLE)
                                THEN CASE WHEN (0.5681740237568612::DOUBLE) * x::DOUBLE + (-0.822908426696396::DOUBLE) * y::DOUBLE >= (1.3585163898415273::DOUBLE)
                                  THEN 349
                                  ELSE 326
                                END
                                ELSE CASE WHEN (0.8760541748394857::DOUBLE) * x::DOUBLE + (-0.4822126945097027::DOUBLE) * y::DOUBLE >= (3.0155172489283304::DOUBLE)
                                  THEN 349
                                  ELSE 303
                                END
                              END
                            END
                          END
                          ELSE CASE WHEN (0.9483184033636868::DOUBLE) * x::DOUBLE + (-0.3173203520761755::DOUBLE) * y::DOUBLE >= (3.5406135703955344::DOUBLE)
                            THEN CASE WHEN (0.9827728434097929::DOUBLE) * x::DOUBLE + (-0.18481758102580675::DOUBLE) * y::DOUBLE >= (4.136614091275937::DOUBLE)
                              THEN CASE WHEN (0.7231127090130525::DOUBLE) * x::DOUBLE + (-0.6907300558567032::DOUBLE) * y::DOUBLE >= (2.84023392147273::DOUBLE)
                                THEN CASE WHEN (0.540025044846913::DOUBLE) * x::DOUBLE + (0.8416489475654856::DOUBLE) * y::DOUBLE >= (2.8313752678636956::DOUBLE)
                                  THEN CASE WHEN (0.14230130436204785::DOUBLE) * x::DOUBLE + (-0.9898233876691637::DOUBLE) * y::DOUBLE >= (0.2104124139897312::DOUBLE)
                                    THEN 385
                                    ELSE 379
                                  END
                                  ELSE CASE WHEN (0.9999972345164315::DOUBLE) * x::DOUBLE + (0.0023517992025055123::DOUBLE) * y::DOUBLE >= (4.555005136608869::DOUBLE)
                                    THEN 385
                                    ELSE 347
                                  END
                                END
                                ELSE CASE WHEN (0.8946673836365168::DOUBLE) * x::DOUBLE + (0.4467328873689397::DOUBLE) * y::DOUBLE >= (4.194953594587879::DOUBLE)
                                  THEN 379
                                  ELSE 327
                                END
                              END
                              ELSE CASE WHEN (0.2183116544402561::DOUBLE) * x::DOUBLE + (-0.9758791019053324::DOUBLE) * y::DOUBLE >= (0.26650147204257446::DOUBLE)
                                THEN CASE WHEN (0.7559554622008234::DOUBLE) * x::DOUBLE + (0.6546230512048438::DOUBLE) * y::DOUBLE >= (3.1956659911452::DOUBLE)
                                  THEN CASE WHEN (0.7231127090130525::DOUBLE) * x::DOUBLE + (-0.6907300558567032::DOUBLE) * y::DOUBLE >= (2.84023392147273::DOUBLE)
                                    THEN 347
                                    ELSE 327
                                  END
                                  ELSE CASE WHEN (0.996708653831857::DOUBLE) * x::DOUBLE + (0.08106700547502285::DOUBLE) * y::DOUBLE >= (4.0847836650530835::DOUBLE)
                                    THEN 347
                                    ELSE 302
                                  END
                                END
                                ELSE 320
                              END
                            END
                            ELSE CASE WHEN (0.80037427604286::DOUBLE) * x::DOUBLE + (0.5995006407409983::DOUBLE) * y::DOUBLE >= (3.5152561768355506::DOUBLE)
                              THEN CASE WHEN (0.3198262746616649::DOUBLE) * x::DOUBLE + (0.9474762023586878::DOUBLE) * y::DOUBLE >= (2.2964973835328433::DOUBLE)
                                THEN CASE WHEN (0.32017414855564774::DOUBLE) * x::DOUBLE + (-0.9473587042913924::DOUBLE) * y::DOUBLE >= (0.20828443290407428::DOUBLE)
                                  THEN 320
                                  ELSE 303
                                END
                                ELSE CASE WHEN (0.9731143308557176::DOUBLE) * x::DOUBLE + (-0.23032259785619993::DOUBLE) * y::DOUBLE >= (3.5543052952606273::DOUBLE)
                                  THEN 320
                                  ELSE 288
                                END
                              END
                              ELSE 287
                            END
                          END
                        END
                      END
                      ELSE CASE WHEN (0.9897426476946245::DOUBLE) * x::DOUBLE + (-0.14286179102347218::DOUBLE) * y::DOUBLE >= (3.8755606931317375::DOUBLE)
                        THEN CASE WHEN (0.7272035646380047::DOUBLE) * x::DOUBLE + (0.6864218641460798::DOUBLE) * y::DOUBLE >= (5.217677652153596::DOUBLE)
                          THEN CASE WHEN (0.8329341656226043::DOUBLE) * x::DOUBLE + (-0.553372095193258::DOUBLE) * y::DOUBLE >= (2.4637966901671158::DOUBLE)
                            THEN CASE WHEN (0.16789344774789014::DOUBLE) * x::DOUBLE + (-0.9858051481927484::DOUBLE) * y::DOUBLE >= (-1.573210274332176::DOUBLE)
                              THEN CASE WHEN (0.9812337387856087::DOUBLE) * x::DOUBLE + (-0.1928220678989201::DOUBLE) * y::DOUBLE >= (4.640106817710979::DOUBLE)
                                THEN CASE WHEN (0.505586299414567::DOUBLE) * x::DOUBLE + (0.8627760392154409::DOUBLE) * y::DOUBLE >= (4.73550742810967::DOUBLE)
                                  THEN 459
                                  ELSE 443
                                END
                                ELSE CASE WHEN (0.9283912961036752::DOUBLE) * x::DOUBLE + (0.3716040921719487::DOUBLE) * y::DOUBLE >= (5.740399358786245::DOUBLE)
                                  THEN 459
                                  ELSE 411
                                END
                              END
                              ELSE CASE WHEN (0.025601335397056786::DOUBLE) * x::DOUBLE + (0.9996722320970446::DOUBLE) * y::DOUBLE >= (3.0118842850130076::DOUBLE)
                                THEN CASE WHEN (0.5851548683165998::DOUBLE) * x::DOUBLE + (-0.8109215622274344::DOUBLE) * y::DOUBLE >= (0.5723618978306::DOUBLE)
                                  THEN 431
                                  ELSE 404
                                END
                                ELSE CASE WHEN (0.8520729255959708::DOUBLE) * x::DOUBLE + (0.5234230883963022::DOUBLE) * y::DOUBLE >= (5.750904773222957::DOUBLE)
                                  THEN CASE WHEN (0.5827939996833954::DOUBLE) * x::DOUBLE + (-0.8126199320303623::DOUBLE) * y::DOUBLE >= (0.986871396891059::DOUBLE)
                                    THEN 459
                                    ELSE 431
                                  END
                                  ELSE CASE WHEN (0.9478925601922055::DOUBLE) * x::DOUBLE + (-0.3185901667224932::DOUBLE) * y::DOUBLE >= (4.130028149086717::DOUBLE)
                                    THEN 459
                                    ELSE 403
                                  END
                                END
                              END
                            END
                            ELSE CASE WHEN (0.713864140006574::DOUBLE) * x::DOUBLE + (0.7002842205938062::DOUBLE) * y::DOUBLE >= (5.328984371440741::DOUBLE)
                              THEN CASE WHEN (0.2506050186294426::DOUBLE) * x::DOUBLE + (-0.9680894197530189::DOUBLE) * y::DOUBLE >= (-1.842227019174092::DOUBLE)
                                THEN CASE WHEN (0.7728868882511736::DOUBLE) * x::DOUBLE + (0.6345438187937994::DOUBLE) * y::DOUBLE >= (5.6016473748401445::DOUBLE)
                                  THEN 404
                                  ELSE 370
                                END
                                ELSE CASE WHEN (0.950364995400335::DOUBLE) * x::DOUBLE + (-0.3111372293984138::DOUBLE) * y::DOUBLE >= (3.486380657084866::DOUBLE)
                                  THEN 404
                                  ELSE 358
                                END
                              END
                              ELSE CASE WHEN (0.8986797436079437::DOUBLE) * x::DOUBLE + (-0.43860542453184576::DOUBLE) * y::DOUBLE >= (2.670620167752153::DOUBLE)
                                THEN 370
                                ELSE 335
                              END
                            END
                          END
                          ELSE CASE WHEN (0.3486688212299566::DOUBLE) * x::DOUBLE + (-0.9372459939109435::DOUBLE) * y::DOUBLE >= (-0.6830497690116837::DOUBLE)
                            THEN CASE WHEN (0.7418173434123694::DOUBLE) * x::DOUBLE + (0.6706019900154001::DOUBLE) * y::DOUBLE >= (4.897926813533405::DOUBLE)
                              THEN CASE WHEN (0.19444994458975842::DOUBLE) * x::DOUBLE + (-0.9809124420910563::DOUBLE) * y::DOUBLE >= (-1.1699012235118005::DOUBLE)
                                THEN CASE WHEN (0.522869504003901::DOUBLE) * x::DOUBLE + (0.8524127414478944::DOUBLE) * y::DOUBLE >= (4.3310462517947474::DOUBLE)
                                  THEN 411
                                  ELSE 386
                                END
                                ELSE CASE WHEN (0.9508604947873689::DOUBLE) * x::DOUBLE + (-0.30961963673630266::DOUBLE) * y::DOUBLE >= (3.891941183763403::DOUBLE)
                                  THEN 411
                                  ELSE 380
                                END
                              END
                              ELSE CASE WHEN (0.6528369527582576::DOUBLE) * x::DOUBLE + (0.7574984574989658::DOUBLE) * y::DOUBLE >= (4.344169625706021::DOUBLE)
                                THEN CASE WHEN (0.802379813130672::DOUBLE) * x::DOUBLE + (-0.5968137360017678::DOUBLE) * y::DOUBLE >= (2.492998254979293::DOUBLE)
                                  THEN 386
                                  ELSE 354
                                END
                                ELSE 333
                              END
                            END
                            ELSE CASE WHEN (0.13533660997826538::DOUBLE) * x::DOUBLE + (-0.9907996780376904::DOUBLE) * y::DOUBLE >= (-2.1972631194398584::DOUBLE)
                              THEN CASE WHEN (0.7310532263298376::DOUBLE) * x::DOUBLE + (0.6823204381174107::DOUBLE) * y::DOUBLE >= (5.093409651423197::DOUBLE)
                                THEN CASE WHEN (0.1673391627834326::DOUBLE) * x::DOUBLE + (-0.9858993886796664::DOUBLE) * y::DOUBLE >= (-1.7985957817361307::DOUBLE)
                                  THEN 380
                                  ELSE 370
                                END
                                ELSE CASE WHEN (0.9100825985382316::DOUBLE) * x::DOUBLE + (-0.4144269101275881::DOUBLE) * y::DOUBLE >= (3.060214893656612::DOUBLE)
                                  THEN 380
                                  ELSE 340
                                END
                              END
                              ELSE CASE WHEN (0.8986797436079437::DOUBLE) * x::DOUBLE + (-0.43860542453184576::DOUBLE) * y::DOUBLE >= (2.670620167752153::DOUBLE)
                                THEN 370
                                ELSE 335
                              END
                            END
                          END
                        END
                        ELSE CASE WHEN (0.5243242338791954::DOUBLE) * x::DOUBLE + (0.8515187007735032::DOUBLE) * y::DOUBLE >= (4.2230323269707215::DOUBLE)
                          THEN CASE WHEN (0.9587982009112972::DOUBLE) * x::DOUBLE + (-0.2840880320063831::DOUBLE) * y::DOUBLE >= (2.9432410805347455::DOUBLE)
                            THEN CASE WHEN (0.137495991092232::DOUBLE) * x::DOUBLE + (0.9905023232852939::DOUBLE) * y::DOUBLE >= (3.5703304000428844::DOUBLE)
                              THEN CASE WHEN (0.5202141646591991::DOUBLE) * x::DOUBLE + (-0.8540358440299399::DOUBLE) * y::DOUBLE >= (-0.5790256569502041::DOUBLE)
                                THEN CASE WHEN (0.713864140006574::DOUBLE) * x::DOUBLE + (0.7002842205938062::DOUBLE) * y::DOUBLE >= (5.328984371440741::DOUBLE)
                                  THEN 358
                                  ELSE 335
                                END
                                ELSE CASE WHEN (0.9969877523399902::DOUBLE) * x::DOUBLE + (-0.07755914958310481::DOUBLE) * y::DOUBLE >= (3.989990185736439::DOUBLE)
                                  THEN 358
                                  ELSE 321
                                END
                              END
                              ELSE CASE WHEN (0.6814252720778515::DOUBLE) * x::DOUBLE + (0.7318876953287478::DOUBLE) * y::DOUBLE >= (4.906923792131876::DOUBLE)
                                THEN CASE WHEN (0.13533660997826538::DOUBLE) * x::DOUBLE + (-0.9907996780376904::DOUBLE) * y::DOUBLE >= (-2.1972631194398584::DOUBLE)
                                  THEN 340
                                  ELSE 335
                                END
                                ELSE CASE WHEN (0.8495349139604585::DOUBLE) * x::DOUBLE + (-0.5275323970735791::DOUBLE) * y::DOUBLE >= (2.0974816758287447::DOUBLE)
                                  THEN 340
                                  ELSE 310
                                END
                              END
                            END
                            ELSE CASE WHEN (0.8536089338695019::DOUBLE) * x::DOUBLE + (0.5209143768587812::DOUBLE) * y::DOUBLE >= (5.026140953712914::DOUBLE)
                              THEN CASE WHEN (0.13301626352543866::DOUBLE) * x::DOUBLE + (-0.9911138550326754::DOUBLE) * y::DOUBLE >= (-2.9663750271824183::DOUBLE)
                                THEN 321
                                ELSE 313
                              END
                              ELSE CASE WHEN (0.41918042111450204::DOUBLE) * x::DOUBLE + (0.9079029543702724::DOUBLE) * y::DOUBLE >= (4.316010320244395::DOUBLE)
                                THEN CASE WHEN (0.4144625516325443::DOUBLE) * x::DOUBLE + (-0.9100663675217542::DOUBLE) * y::DOUBLE >= (-1.1011105872148386::DOUBLE)
                                  THEN 310
                                  ELSE 295
                                END
                                ELSE CASE WHEN (0.898052370859793::DOUBLE) * x::DOUBLE + (-0.43988855315080055::DOUBLE) * y::DOUBLE >= (2.1638590993572784::DOUBLE)
                                  THEN 310
                                  ELSE 284
                                END
                              END
                            END
                          END
                          ELSE CASE WHEN (0.8415155003343844::DOUBLE) * x::DOUBLE + (-0.5402329707607364::DOUBLE) * y::DOUBLE >= (2.030695009105031::DOUBLE)
                            THEN CASE WHEN (0.17517233425060857::DOUBLE) * x::DOUBLE + (0.9845377866355324::DOUBLE) * y::DOUBLE >= (2.947293388103935::DOUBLE)
                              THEN CASE WHEN (0.12533790867406272::DOUBLE) * x::DOUBLE + (-0.9921141106995768::DOUBLE) * y::DOUBLE >= (-1.9630032089267695::DOUBLE)
                                THEN CASE WHEN (0.5967096839891634::DOUBLE) * x::DOUBLE + (0.8024571970102534::DOUBLE) * y::DOUBLE >= (4.3887480647281825::DOUBLE)
                                  THEN 340
                                  ELSE 317
                                END
                                ELSE CASE WHEN (0.8495349139604585::DOUBLE) * x::DOUBLE + (-0.5275323970735791::DOUBLE) * y::DOUBLE >= (2.0974816758287447::DOUBLE)
                                  THEN 340
                                  ELSE 310
                                END
                              END
                              ELSE CASE WHEN (0.5453475796431702::DOUBLE) * x::DOUBLE + (0.8382100079200535::DOUBLE) * y::DOUBLE >= (3.8309696680486107::DOUBLE)
                                THEN CASE WHEN (0.48031298137893585::DOUBLE) * x::DOUBLE + (-0.8770971667488603::DOUBLE) * y::DOUBLE >= (0.1852155747632469::DOUBLE)
                                  THEN 333
                                  ELSE 317
                                END
                                ELSE CASE WHEN (0.9976783877171727::DOUBLE) * x::DOUBLE + (0.06810164962805888::DOUBLE) * y::DOUBLE >= (4.115730119453438::DOUBLE)
                                  THEN 333
                                  ELSE 300
                                END
                              END
                            END
                            ELSE CASE WHEN (0.003804101871626103::DOUBLE) * x::DOUBLE + (-0.999992764378298::DOUBLE) * y::DOUBLE >= (-2.3144558497903587::DOUBLE)
                              THEN CASE WHEN (0.6148982621646244::DOUBLE) * x::DOUBLE + (0.7886064463260017::DOUBLE) * y::DOUBLE >= (3.9581945453133995::DOUBLE)
                                THEN CASE WHEN (0.08266648179542077::DOUBLE) * x::DOUBLE + (-0.9965772688495195::DOUBLE) * y::DOUBLE >= (-1.7973767145799364::DOUBLE)
                                  THEN 300
                                  ELSE 294
                                END
                                ELSE CASE WHEN (0.875812731566747::DOUBLE) * x::DOUBLE + (-0.48265107399196056::DOUBLE) * y::DOUBLE >= (2.244915231585599::DOUBLE)
                                  THEN 300
                                  ELSE 266
                                END
                              END
                              ELSE CASE WHEN (0.7520408571763609::DOUBLE) * x::DOUBLE + (-0.6591164913256565::DOUBLE) * y::DOUBLE >= (1.0618848279423756::DOUBLE)
                                THEN CASE WHEN (0.48042996435648344::DOUBLE) * x::DOUBLE + (0.8770330947851558::DOUBLE) * y::DOUBLE >= (4.10522110088904::DOUBLE)
                                  THEN 310
                                  ELSE 294
                                END
                                ELSE CASE WHEN (0.9655829363114791::DOUBLE) * x::DOUBLE + (0.2600953538687346::DOUBLE) * y::DOUBLE >= (4.284106858378928::DOUBLE)
                                  THEN 310
                                  ELSE 265
                                END
                              END
                            END
                          END
                        END
                      END
                    END
                  END
                END
                ELSE CASE WHEN (0.08047101896635221::DOUBLE) * x::DOUBLE + (0.9967569488629195::DOUBLE) * y::DOUBLE >= (5.922284653070268::DOUBLE)
                  THEN CASE WHEN (0.9598268535792813::DOUBLE) * x::DOUBLE + (0.28059296346861035::DOUBLE) * y::DOUBLE >= (5.914188579262271::DOUBLE)
                    THEN CASE WHEN (0.16087694754331783::DOUBLE) * x::DOUBLE + (0.9869744716805722::DOUBLE) * y::DOUBLE >= (7.313077314036897::DOUBLE)
                      THEN CASE WHEN (0.9807365608146968::DOUBLE) * x::DOUBLE + (-0.19533509229362858::DOUBLE) * y::DOUBLE >= (3.4375698286249152::DOUBLE)
                        THEN CASE WHEN (0.2102013150562232::DOUBLE) * x::DOUBLE + (0.9776581238595803::DOUBLE) * y::DOUBLE >= (8.581507062424475::DOUBLE)
                          THEN CASE WHEN (0.9875751685970203::DOUBLE) * x::DOUBLE + (0.15714733968657216::DOUBLE) * y::DOUBLE >= (6.695126962241321::DOUBLE)
                            THEN CASE WHEN (0.9594697912338358::DOUBLE) * x::DOUBLE + (-0.2818114967663659::DOUBLE) * y::DOUBLE >= (3.455494860377898::DOUBLE)
                              THEN CASE WHEN (0.49706180051279836::DOUBLE) * x::DOUBLE + (-0.8677151413171117::DOUBLE) * y::DOUBLE >= (-3.6432977499064534::DOUBLE)
                                THEN CASE WHEN (0.2600347860396885::DOUBLE) * x::DOUBLE + (0.9655992491967326::DOUBLE) * y::DOUBLE >= (8.947246708271038::DOUBLE)
                                  THEN CASE WHEN (0.3939290074410568::DOUBLE) * x::DOUBLE + (-0.9191408690165527::DOUBLE) * y::DOUBLE >= (-4.648291677067367::DOUBLE)
                                    THEN 519
                                    ELSE 511
                                  END
                                  ELSE CASE WHEN (0.9126648891569126::DOUBLE) * x::DOUBLE + (0.40870869834174123::DOUBLE) * y::DOUBLE >= (8.627416093430035::DOUBLE)
                                    THEN 519
                                    ELSE 499
                                  END
                                END
                                ELSE CASE WHEN (0.9048004628409502::DOUBLE) * x::DOUBLE + (0.42583579281549655::DOUBLE) * y::DOUBLE >= (8.700090548801676::DOUBLE)
                                  THEN 511
                                  ELSE 486
                                END
                              END
                              ELSE CASE WHEN (0.1953981181825186::DOUBLE) * x::DOUBLE + (0.9807240057277739::DOUBLE) * y::DOUBLE >= (8.674112183685535::DOUBLE)
                                THEN CASE WHEN (0.5413194003040881::DOUBLE) * x::DOUBLE + (-0.8408170471954183::DOUBLE) * y::DOUBLE >= (-3.4539249899059326::DOUBLE)
                                  THEN CASE WHEN (0.9048004628409502::DOUBLE) * x::DOUBLE + (0.42583579281549655::DOUBLE) * y::DOUBLE >= (8.700090548801676::DOUBLE)
                                    THEN 511
                                    ELSE 486
                                  END
                                  ELSE CASE WHEN (0.992721464805451::DOUBLE) * x::DOUBLE + (-0.1204329411519934::DOUBLE) * y::DOUBLE >= (4.9010053081951375::DOUBLE)
                                    THEN 511
                                    ELSE 478
                                  END
                                END
                                ELSE CASE WHEN (0.7119192629010913::DOUBLE) * x::DOUBLE + (0.702261321098042::DOUBLE) * y::DOUBLE >= (9.425120148646702::DOUBLE)
                                  THEN 486
                                  ELSE 468
                                END
                              END
                            END
                            ELSE CASE WHEN (0.747929453049551::DOUBLE) * x::DOUBLE + (-0.6637782259618038::DOUBLE) * y::DOUBLE >= (-1.3161032533097141::DOUBLE)
                              THEN CASE WHEN (0.3478826318434955::DOUBLE) * x::DOUBLE + (0.9375380922723315::DOUBLE) * y::DOUBLE >= (9.078121497059845::DOUBLE)
                                THEN CASE WHEN (0.6400511112459271::DOUBLE) * x::DOUBLE + (-0.7683323336895657::DOUBLE) * y::DOUBLE >= (-2.3954079804566937::DOUBLE)
                                  THEN 468
                                  ELSE 446
                                END
                                ELSE CASE WHEN (0.9925311184190864::DOUBLE) * x::DOUBLE + (-0.12199171680797694::DOUBLE) * y::DOUBLE >= (4.4772777448567656::DOUBLE)
                                  THEN 468
                                  ELSE 437
                                END
                              END
                              ELSE CASE WHEN (0.9987896665571919::DOUBLE) * x::DOUBLE + (-0.04918538379003999::DOUBLE) * y::DOUBLE >= (4.7522211540396695::DOUBLE)
                                THEN 446
                                ELSE 402
                              END
                            END
                          END
                          ELSE CASE WHEN (0.8080668212000901::DOUBLE) * x::DOUBLE + (0.5890908355046627::DOUBLE) * y::DOUBLE >= (8.634781601420634::DOUBLE)
                            THEN CASE WHEN (0.3622730587748181::DOUBLE) * x::DOUBLE + (-0.9320720094960139::DOUBLE) * y::DOUBLE >= (-4.57778456641665::DOUBLE)
                              THEN CASE WHEN (0.24947413014409517::DOUBLE) * x::DOUBLE + (0.9683814632616874::DOUBLE) * y::DOUBLE >= (8.138648411633564::DOUBLE)
                                THEN CASE WHEN (0.7209975251361473::DOUBLE) * x::DOUBLE + (-0.6929376369829761::DOUBLE) * y::DOUBLE >= (-0.7477528475440947::DOUBLE)
                                  THEN 495
                                  ELSE 472
                                END
                                ELSE CASE WHEN (0.8314557674586489::DOUBLE) * x::DOUBLE + (0.5555909527338877::DOUBLE) * y::DOUBLE >= (8.553625853806508::DOUBLE)
                                  THEN 495
                                  ELSE 463
                                END
                              END
                              ELSE CASE WHEN (0.9700502973751867::DOUBLE) * x::DOUBLE + (-0.24290413862738516::DOUBLE) * y::DOUBLE >= (3.539496806856002::DOUBLE)
                                THEN CASE WHEN (0.10282433901305221::DOUBLE) * x::DOUBLE + (-0.9946995301630182::DOUBLE) * y::DOUBLE >= (-6.759253948104374::DOUBLE)
                                  THEN CASE WHEN (0.8431704778949606::DOUBLE) * x::DOUBLE + (0.5376463012114783::DOUBLE) * y::DOUBLE >= (8.841576166345444::DOUBLE)
                                    THEN 499
                                    ELSE 472
                                  END
                                  ELSE CASE WHEN (0.9594697912338358::DOUBLE) * x::DOUBLE + (-0.2818114967663659::DOUBLE) * y::DOUBLE >= (3.455494860377898::DOUBLE)
                                    THEN 499
                                    ELSE 468
                                  END
                                END
                                ELSE CASE WHEN (0.09808537402727682::DOUBLE) * x::DOUBLE + (-0.9951780038776628::DOUBLE) * y::DOUBLE >= (-6.893274393284819::DOUBLE)
                                  THEN CASE WHEN (0.8371900458457887::DOUBLE) * x::DOUBLE + (0.5469120835534044::DOUBLE) * y::DOUBLE >= (8.625213135130892::DOUBLE)
                                    THEN 468
                                    ELSE 438
                                  END
                                  ELSE CASE WHEN (0.9925311184190864::DOUBLE) * x::DOUBLE + (-0.12199171680797694::DOUBLE) * y::DOUBLE >= (4.4772777448567656::DOUBLE)
                                    THEN 468
                                    ELSE 437
                                  END
                                END
                              END
                            END
                            ELSE CASE WHEN (0.2029089488010423::DOUBLE) * x::DOUBLE + (-0.9791976095234587::DOUBLE) * y::DOUBLE >= (-5.929955124101489::DOUBLE)
                              THEN CASE WHEN (0.901982758449987::DOUBLE) * x::DOUBLE + (-0.43177205034479976::DOUBLE) * y::DOUBLE >= (1.5992133002920719::DOUBLE)
                                THEN CASE WHEN (0.9083252201121793::DOUBLE) * x::DOUBLE + (0.4182646225873772::DOUBLE) * y::DOUBLE >= (7.593684291465294::DOUBLE)
                                  THEN CASE WHEN (0.5033899210554249::DOUBLE) * x::DOUBLE + (-0.8640593656571365::DOUBLE) * y::DOUBLE >= (-3.186917586604376::DOUBLE)
                                    THEN 463
                                    ELSE 445
                                  END
                                  ELSE CASE WHEN (0.45814039109571::DOUBLE) * x::DOUBLE + (-0.8888798467997066::DOUBLE) * y::DOUBLE >= (-3.609558147496503::DOUBLE)
                                    THEN CASE WHEN (0.4462506187813359::DOUBLE) * x::DOUBLE + (0.8949080317201734::DOUBLE) * y::DOUBLE >= (8.383175211866616::DOUBLE)
                                      THEN 445
                                      ELSE 420
                                    END
                                    ELSE CASE WHEN (0.8814587878883717::DOUBLE) * x::DOUBLE + (0.4722609503805733::DOUBLE) * y::DOUBLE >= (7.804439201479379::DOUBLE)
                                      THEN 445
                                      ELSE 405
                                    END
                                  END
                                END
                                ELSE CASE WHEN (0.044185316434732606::DOUBLE) * x::DOUBLE + (0.9990233519851087::DOUBLE) * y::DOUBLE >= (7.1992049629494135::DOUBLE)
                                  THEN 408
                                  ELSE 405
                                END
                              END
                              ELSE CASE WHEN (0.9096702220871173::DOUBLE) * x::DOUBLE + (0.4153312979393375::DOUBLE) * y::DOUBLE >= (7.679484161135287::DOUBLE)
                                THEN CASE WHEN (0.9999964996808346::DOUBLE) * x::DOUBLE + (-0.002645869626110863::DOUBLE) * y::DOUBLE >= (5.043706335789732::DOUBLE)
                                  THEN CASE WHEN (0.09808537402727682::DOUBLE) * x::DOUBLE + (-0.9951780038776628::DOUBLE) * y::DOUBLE >= (-6.893274393284819::DOUBLE)
                                    THEN 438
                                    ELSE 437
                                  END
                                  ELSE CASE WHEN (0.8434945360052571::DOUBLE) * x::DOUBLE + (-0.5371377548909367::DOUBLE) * y::DOUBLE >= (0.28228957863053017::DOUBLE)
                                    THEN 438
                                    ELSE 393
                                  END
                                END
                                ELSE CASE WHEN (0.2732428577729697::DOUBLE) * x::DOUBLE + (-0.9619450819439023::DOUBLE) * y::DOUBLE >= (-5.751171617507341::DOUBLE)
                                  THEN 408
                                  ELSE 393
                                END
                              END
                            END
                          END
                        END
                        ELSE CASE WHEN (0.09635819238189601::DOUBLE) * x::DOUBLE + (-0.9953467228864992::DOUBLE) * y::DOUBLE >= (-6.7015316813285395::DOUBLE)
                          THEN CASE WHEN (0.8870835148272098::DOUBLE) * x::DOUBLE + (0.4616089662493607::DOUBLE) * y::DOUBLE >= (7.305114939912377::DOUBLE)
                            THEN CASE WHEN (0.8701382230432675::DOUBLE) * x::DOUBLE + (-0.4928077442564236::DOUBLE) * y::DOUBLE >= (0.7752142930056616::DOUBLE)
                              THEN CASE WHEN (0.044185316434732606::DOUBLE) * x::DOUBLE + (0.9990233519851087::DOUBLE) * y::DOUBLE >= (7.1992049629494135::DOUBLE)
                                THEN 408
                                ELSE 405
                              END
                              ELSE CASE WHEN (0.8878562993460184::DOUBLE) * x::DOUBLE + (0.46012084468277825::DOUBLE) * y::DOUBLE >= (7.523753675095705::DOUBLE)
                                THEN 408
                                ELSE 371
                              END
                            END
                            ELSE CASE WHEN (0.42872981545358385::DOUBLE) * x::DOUBLE + (-0.9034327564025648::DOUBLE) * y::DOUBLE >= (-4.587367602977324::DOUBLE)
                              THEN CASE WHEN (0.7579422523207363::DOUBLE) * x::DOUBLE + (-0.6523216554330917::DOUBLE) * y::DOUBLE >= (-1.0544878631714583::DOUBLE)
                                THEN CASE WHEN (0.18572457696748523::DOUBLE) * x::DOUBLE + (0.9826018428184676::DOUBLE) * y::DOUBLE >= (7.51673387850552::DOUBLE)
                                  THEN 371
                                  ELSE 364
                                END
                                ELSE CASE WHEN (0.9423819060579787::DOUBLE) * x::DOUBLE + (0.3345390009169795::DOUBLE) * y::DOUBLE >= (6.485491627700275::DOUBLE)
                                  THEN 371
                                  ELSE 336
                                END
                              END
                              ELSE CASE WHEN (0.9221255410719652::DOUBLE) * x::DOUBLE + (-0.38689079402686144::DOUBLE) * y::DOUBLE >= (1.245943959669296::DOUBLE)
                                THEN 371
                                ELSE 323
                              END
                            END
                          END
                          ELSE CASE WHEN (0.9982463023892183::DOUBLE) * x::DOUBLE + (-0.059197295261298605::DOUBLE) * y::DOUBLE >= (4.0803064757520335::DOUBLE)
                            THEN CASE WHEN (0.2102013150562232::DOUBLE) * x::DOUBLE + (0.9776581238595803::DOUBLE) * y::DOUBLE >= (8.581507062424475::DOUBLE)
                              THEN CASE WHEN (0.9981934153394435::DOUBLE) * x::DOUBLE + (0.060082489736836144::DOUBLE) * y::DOUBLE >= (5.141752479418546::DOUBLE)
                                THEN 402
                                ELSE 353
                              END
                              ELSE CASE WHEN (0.32354641556684405::DOUBLE) * x::DOUBLE + (-0.946212300159878::DOUBLE) * y::DOUBLE >= (-5.7359980901409235::DOUBLE)
                                THEN CASE WHEN (0.7993846100986752::DOUBLE) * x::DOUBLE + (0.6008196444336595::DOUBLE) * y::DOUBLE >= (8.269359806212966::DOUBLE)
                                  THEN CASE WHEN (0.2732428577729697::DOUBLE) * x::DOUBLE + (-0.9619450819439023::DOUBLE) * y::DOUBLE >= (-5.751171617507341::DOUBLE)
                                    THEN 408
                                    ELSE 393
                                  END
                                  ELSE CASE WHEN (0.9012494537437442::DOUBLE) * x::DOUBLE + (-0.43330061403903275::DOUBLE) * y::DOUBLE >= (1.161497356184097::DOUBLE)
                                    THEN 408
                                    ELSE 368
                                  END
                                END
                                ELSE CASE WHEN (0.8631167534621454::DOUBLE) * x::DOUBLE + (-0.5050044256172079::DOUBLE) * y::DOUBLE >= (0.1180362999409228::DOUBLE)
                                  THEN 393
                                  ELSE 353
                                END
                              END
                            END
                            ELSE CASE WHEN (0.9140431182992628::DOUBLE) * x::DOUBLE + (-0.40561703353010187::DOUBLE) * y::DOUBLE >= (0.7111085965753219::DOUBLE)
                              THEN CASE WHEN (0.6791386015641683::DOUBLE) * x::DOUBLE + (0.7340100543354061::DOUBLE) * y::DOUBLE >= (8.234758844469948::DOUBLE)
                                THEN CASE WHEN (0.3697304391140069::DOUBLE) * x::DOUBLE + (0.929139065152555::DOUBLE) * y::DOUBLE >= (8.733915395563875::DOUBLE)
                                  THEN CASE WHEN (0.32354641556684405::DOUBLE) * x::DOUBLE + (-0.946212300159878::DOUBLE) * y::DOUBLE >= (-5.7359980901409235::DOUBLE)
                                    THEN 368
                                    ELSE 353
                                  END
                                  ELSE CASE WHEN (0.9204174561648041::DOUBLE) * x::DOUBLE + (-0.3909369596074424::DOUBLE) * y::DOUBLE >= (1.1795391077380466::DOUBLE)
                                    THEN 368
                                    ELSE 343
                                  END
                                END
                                ELSE CASE WHEN (0.9701789892770115::DOUBLE) * x::DOUBLE + (0.24238962181874965::DOUBLE) * y::DOUBLE >= (5.957144265267326::DOUBLE)
                                  THEN 368
                                  ELSE 323
                                END
                              END
                              ELSE CASE WHEN (0.16527390983541007::DOUBLE) * x::DOUBLE + (-0.9862477045487694::DOUBLE) * y::DOUBLE >= (-6.666199658596309::DOUBLE)
                                THEN 323
                                ELSE CASE WHEN (0.4545113561197602::DOUBLE) * x::DOUBLE + (-0.8907409427876191::DOUBLE) * y::DOUBLE >= (-5.120637453579727::DOUBLE)
                                  THEN CASE WHEN (0.9067245050924586::DOUBLE) * x::DOUBLE + (0.42172345425033675::DOUBLE) * y::DOUBLE >= (7.072448005051936::DOUBLE)
                                    THEN 353
                                    ELSE 311
                                  END
                                  ELSE CASE WHEN (0.998803579195288::DOUBLE) * x::DOUBLE + (-0.048902046855751106::DOUBLE) * y::DOUBLE >= (3.7535211192282114::DOUBLE)
                                    THEN 353
                                    ELSE 305
                                  END
                                END
                              END
                            END
                          END
                        END
                      END
                      ELSE CASE WHEN (0.7553275637665604::DOUBLE) * x::DOUBLE + (-0.6553474432806408::DOUBLE) * y::DOUBLE >= (-0.2735858395471955::DOUBLE)
                        THEN CASE WHEN (0.3040745125985246::DOUBLE) * x::DOUBLE + (0.9526482513435742::DOUBLE) * y::DOUBLE >= (7.037843338774751::DOUBLE)
                          THEN CASE WHEN (0.8810132666748063::DOUBLE) * x::DOUBLE + (0.4730915597883635::DOUBLE) * y::DOUBLE >= (7.431165572445494::DOUBLE)
                            THEN CASE WHEN (0.10910782755747395::DOUBLE) * x::DOUBLE + (-0.9940299200555729::DOUBLE) * y::DOUBLE >= (-5.754303958042844::DOUBLE)
                              THEN CASE WHEN (0.9025828880821523::DOUBLE) * x::DOUBLE + (-0.43051612065203904::DOUBLE) * y::DOUBLE >= (2.134947661529304::DOUBLE)
                                THEN CASE WHEN (0.6147708904107957::DOUBLE) * x::DOUBLE + (0.7887057450681575::DOUBLE) * y::DOUBLE >= (8.272520726105132::DOUBLE)
                                  THEN 469
                                  ELSE 457
                                END
                                ELSE CASE WHEN (0.9656197877767684::DOUBLE) * x::DOUBLE + (0.2599585071774896::DOUBLE) * y::DOUBLE >= (6.824887929531277::DOUBLE)
                                  THEN 469
                                  ELSE 423
                                END
                              END
                              ELSE CASE WHEN (0.9083252201121793::DOUBLE) * x::DOUBLE + (0.4182646225873772::DOUBLE) * y::DOUBLE >= (7.593684291465294::DOUBLE)
                                THEN CASE WHEN (0.2570294909306363::DOUBLE) * x::DOUBLE + (-0.9664035600058279::DOUBLE) * y::DOUBLE >= (-4.859779504381572::DOUBLE)
                                  THEN 469
                                  ELSE 463
                                END
                                ELSE CASE WHEN (0.9293114828857483::DOUBLE) * x::DOUBLE + (-0.36929685589873573::DOUBLE) * y::DOUBLE >= (2.6183075356287278::DOUBLE)
                                  THEN 469
                                  ELSE 420
                                END
                              END
                            END
                            ELSE CASE WHEN (0.746020072764921::DOUBLE) * x::DOUBLE + (-0.6659234573371191::DOUBLE) * y::DOUBLE >= (-0.2287261431217713::DOUBLE)
                              THEN CASE WHEN (0.9025828880821523::DOUBLE) * x::DOUBLE + (-0.43051612065203904::DOUBLE) * y::DOUBLE >= (2.134947661529304::DOUBLE)
                                THEN CASE WHEN (0.997615532921861::DOUBLE) * x::DOUBLE + (-0.06901629135958572::DOUBLE) * y::DOUBLE >= (4.788188585714327::DOUBLE)
                                  THEN CASE WHEN (0.23123568866696073::DOUBLE) * x::DOUBLE + (0.9728977625047331::DOUBLE) * y::DOUBLE >= (7.012345273302788::DOUBLE)
                                    THEN 457
                                    ELSE 447
                                  END
                                  ELSE CASE WHEN (0.8546789228184858::DOUBLE) * x::DOUBLE + (0.5191569501507544::DOUBLE) * y::DOUBLE >= (7.553800938848185::DOUBLE)
                                    THEN 457
                                    ELSE 415
                                  END
                                END
                                ELSE CASE WHEN (0.2762914165534142::DOUBLE) * x::DOUBLE + (0.9610739061793884::DOUBLE) * y::DOUBLE >= (7.176759574847966::DOUBLE)
                                  THEN 423
                                  ELSE 415
                                END
                              END
                              ELSE CASE WHEN (0.7229628948084855::DOUBLE) * x::DOUBLE + (0.6908868595726327::DOUBLE) * y::DOUBLE >= (7.5457469364856005::DOUBLE)
                                THEN CASE WHEN (0.7890785329407044::DOUBLE) * x::DOUBLE + (0.6142923317543085::DOUBLE) * y::DOUBLE >= (7.68664382651375::DOUBLE)
                                  THEN 423
                                  ELSE 394
                                END
                                ELSE 382
                              END
                            END
                          END
                          ELSE CASE WHEN (0.9996998343892156::DOUBLE) * x::DOUBLE + (-0.024499818819225472::DOUBLE) * y::DOUBLE >= (4.738347134007053::DOUBLE)
                            THEN CASE WHEN (0.923887912624364::DOUBLE) * x::DOUBLE + (0.3826632003558686::DOUBLE) * y::DOUBLE >= (6.750417526494816::DOUBLE)
                              THEN CASE WHEN (0.19159290500310955::DOUBLE) * x::DOUBLE + (0.98147448196704::DOUBLE) * y::DOUBLE >= (6.55285574743592::DOUBLE)
                                THEN CASE WHEN (0.5612365523126166::DOUBLE) * x::DOUBLE + (-0.8276554430125181::DOUBLE) * y::DOUBLE >= (-1.8798087235658079::DOUBLE)
                                  THEN 424
                                  ELSE 415
                                END
                                ELSE CASE WHEN (0.9283552028475192::DOUBLE) * x::DOUBLE + (0.3716942525059295::DOUBLE) * y::DOUBLE >= (6.798570561556954::DOUBLE)
                                  THEN 424
                                  ELSE 409
                                END
                              END
                              ELSE CASE WHEN (0.35609921659506255::DOUBLE) * x::DOUBLE + (-0.9344481515527667::DOUBLE) * y::DOUBLE >= (-3.5740522754185373::DOUBLE)
                                THEN CASE WHEN (0.9843885351851996::DOUBLE) * x::DOUBLE + (-0.17600912418376827::DOUBLE) * y::DOUBLE >= (3.8547903931655054::DOUBLE)
                                  THEN 409
                                  ELSE 391
                                END
                                ELSE CASE WHEN (0.8096283229481624::DOUBLE) * x::DOUBLE + (-0.586942909217026::DOUBLE) * y::DOUBLE >= (0.6474323800935804::DOUBLE)
                                  THEN 409
                                  ELSE 389
                                END
                              END
                            END
                            ELSE CASE WHEN (0.35609921659506255::DOUBLE) * x::DOUBLE + (-0.9344481515527667::DOUBLE) * y::DOUBLE >= (-3.5740522754185373::DOUBLE)
                              THEN CASE WHEN (0.6325009871008086::DOUBLE) * x::DOUBLE + (-0.7745595531116396::DOUBLE) * y::DOUBLE >= (-1.3120556328124544::DOUBLE)
                                THEN CASE WHEN (0.5354217710022628::DOUBLE) * x::DOUBLE + (0.8445848253057833::DOUBLE) * y::DOUBLE >= (7.238397763850619::DOUBLE)
                                  THEN 391
                                  ELSE 383
                                END
                                ELSE CASE WHEN (0.9994839997885218::DOUBLE) * x::DOUBLE + (0.03212061902794439::DOUBLE) * y::DOUBLE >= (4.916900213600597::DOUBLE)
                                  THEN 391
                                  ELSE 374
                                END
                              END
                              ELSE CASE WHEN (0.7697496915641855::DOUBLE) * x::DOUBLE + (0.6383458406983172::DOUBLE) * y::DOUBLE >= (7.241667031143859::DOUBLE)
                                THEN CASE WHEN (0.7862795498816936::DOUBLE) * x::DOUBLE + (0.6178709164848604::DOUBLE) * y::DOUBLE >= (7.216818659339975::DOUBLE)
                                  THEN CASE WHEN (0.5233563039953649::DOUBLE) * x::DOUBLE + (-0.8521139472325936::DOUBLE) * y::DOUBLE >= (-2.4300055330857324::DOUBLE)
                                    THEN 389
                                    ELSE 382
                                  END
                                  ELSE CASE WHEN (0.998724785516865::DOUBLE) * x::DOUBLE + (0.05048566919722821::DOUBLE) * y::DOUBLE >= (4.962256175566086::DOUBLE)
                                    THEN 389
                                    ELSE 367
                                  END
                                END
                                ELSE CASE WHEN (0.521497724350113::DOUBLE) * x::DOUBLE + (0.8532526727163845::DOUBLE) * y::DOUBLE >= (7.141445886010203::DOUBLE)
                                  THEN CASE WHEN (0.5519412322679799::DOUBLE) * x::DOUBLE + (-0.8338830110528117::DOUBLE) * y::DOUBLE >= (-2.170250324206579::DOUBLE)
                                    THEN 374
                                    ELSE 367
                                  END
                                  ELSE CASE WHEN (0.9294195989356488::DOUBLE) * x::DOUBLE + (0.3690246727717504::DOUBLE) * y::DOUBLE >= (6.277193351341342::DOUBLE)
                                    THEN 374
                                    ELSE 357
                                  END
                                END
                              END
                            END
                          END
                        END
                        ELSE CASE WHEN (0.6928494507514454::DOUBLE) * x::DOUBLE + (-0.7210822689495426::DOUBLE) * y::DOUBLE >= (-1.2997664601234051::DOUBLE)
                          THEN CASE WHEN (0.7229628948084855::DOUBLE) * x::DOUBLE + (0.6908868595726327::DOUBLE) * y::DOUBLE >= (7.5457469364856005::DOUBLE)
                            THEN CASE WHEN (0.7890785329407044::DOUBLE) * x::DOUBLE + (0.6142923317543085::DOUBLE) * y::DOUBLE >= (7.68664382651375::DOUBLE)
                              THEN CASE WHEN (0.7892193324294721::DOUBLE) * x::DOUBLE + (0.6141114274458491::DOUBLE) * y::DOUBLE >= (7.846330642805368::DOUBLE)
                                THEN CASE WHEN (0.10910782755747395::DOUBLE) * x::DOUBLE + (-0.9940299200555729::DOUBLE) * y::DOUBLE >= (-5.754303958042844::DOUBLE)
                                  THEN 423
                                  ELSE 420
                                END
                                ELSE CASE WHEN (0.9567374827013473::DOUBLE) * x::DOUBLE + (-0.2909525548853098::DOUBLE) * y::DOUBLE >= (2.948567914930338::DOUBLE)
                                  THEN 423
                                  ELSE 390
                                END
                              END
                              ELSE CASE WHEN (0.6132215656495433::DOUBLE) * x::DOUBLE + (0.7899109515776591::DOUBLE) * y::DOUBLE >= (7.774820327045617::DOUBLE)
                                THEN CASE WHEN (0.1944847694545908::DOUBLE) * x::DOUBLE + (-0.9809055379852816::DOUBLE) * y::DOUBLE >= (-5.070629469184478::DOUBLE)
                                  THEN 394
                                  ELSE 390
                                END
                                ELSE CASE WHEN (0.9315630317936429::DOUBLE) * x::DOUBLE + (-0.36357986439768136::DOUBLE) * y::DOUBLE >= (2.241870026296583::DOUBLE)
                                  THEN 394
                                  ELSE 373
                                END
                              END
                            END
                            ELSE CASE WHEN (0.0662835613190182::DOUBLE) * x::DOUBLE + (-0.997800826567541::DOUBLE) * y::DOUBLE >= (-5.555182428655475::DOUBLE)
                              THEN CASE WHEN (0.7488688975746125::DOUBLE) * x::DOUBLE + (0.6627181710541703::DOUBLE) * y::DOUBLE >= (7.216466104763714::DOUBLE)
                                THEN CASE WHEN (0.025797746225621327::DOUBLE) * x::DOUBLE + (-0.9996671827611819::DOUBLE) * y::DOUBLE >= (-5.672018552810076::DOUBLE)
                                  THEN CASE WHEN (0.7862795498816936::DOUBLE) * x::DOUBLE + (0.6178709164848604::DOUBLE) * y::DOUBLE >= (7.216818659339975::DOUBLE)
                                    THEN 382
                                    ELSE 367
                                  END
                                  ELSE CASE WHEN (0.9595477654231472::DOUBLE) * x::DOUBLE + (-0.2815458859075101::DOUBLE) * y::DOUBLE >= (2.8077750875031553::DOUBLE)
                                    THEN 382
                                    ELSE 365
                                  END
                                END
                                ELSE CASE WHEN (0.9596553333173786::DOUBLE) * x::DOUBLE + (-0.28117901990637756::DOUBLE) * y::DOUBLE >= (2.7020933573251154::DOUBLE)
                                  THEN 367
                                  ELSE 352
                                END
                              END
                              ELSE CASE WHEN (0.8572160767847333::DOUBLE) * x::DOUBLE + (-0.5149568891682003::DOUBLE) * y::DOUBLE >= (0.7937987071681882::DOUBLE)
                                THEN CASE WHEN (0.36896697937538914::DOUBLE) * x::DOUBLE + (0.9294425039401851::DOUBLE) * y::DOUBLE >= (7.24640628492024::DOUBLE)
                                  THEN CASE WHEN (0.3438583200319417::DOUBLE) * x::DOUBLE + (-0.9390215416830493::DOUBLE) * y::DOUBLE >= (-3.974564339821021::DOUBLE)
                                    THEN 382
                                    ELSE 373
                                  END
                                  ELSE CASE WHEN (0.9595477654231472::DOUBLE) * x::DOUBLE + (-0.2815458859075101::DOUBLE) * y::DOUBLE >= (2.8077750875031553::DOUBLE)
                                    THEN 382
                                    ELSE 365
                                  END
                                END
                                ELSE CASE WHEN (0.9284070742239734::DOUBLE) * x::DOUBLE + (0.37156467072487065::DOUBLE) * y::DOUBLE >= (6.433982885658553::DOUBLE)
                                  THEN 373
                                  ELSE 351
                                END
                              END
                            END
                          END
                          ELSE CASE WHEN (0.9985206997514652::DOUBLE) * x::DOUBLE + (0.05437289920396586::DOUBLE) * y::DOUBLE >= (4.96127268899015::DOUBLE)
                            THEN CASE WHEN (0.6751045071938463::DOUBLE) * x::DOUBLE + (-0.7377221051090674::DOUBLE) * y::DOUBLE >= (-1.5866754600322839::DOUBLE)
                              THEN CASE WHEN (0.2924089104757769::DOUBLE) * x::DOUBLE + (0.9562933802313853::DOUBLE) * y::DOUBLE >= (7.684683543032804::DOUBLE)
                                THEN CASE WHEN (0.45814039109571::DOUBLE) * x::DOUBLE + (-0.8888798467997066::DOUBLE) * y::DOUBLE >= (-3.609558147496503::DOUBLE)
                                  THEN 420
                                  ELSE 405
                                END
                                ELSE CASE WHEN (0.7892193324294721::DOUBLE) * x::DOUBLE + (0.6141114274458491::DOUBLE) * y::DOUBLE >= (7.846330642805368::DOUBLE)
                                  THEN 420
                                  ELSE 390
                                END
                              END
                              ELSE CASE WHEN (0.8870835148272098::DOUBLE) * x::DOUBLE + (0.4616089662493607::DOUBLE) * y::DOUBLE >= (7.305114939912377::DOUBLE)
                                THEN 405
                                ELSE 364
                              END
                            END
                            ELSE CASE WHEN (0.9467399792867978::DOUBLE) * x::DOUBLE + (-0.32199908636521585::DOUBLE) * y::DOUBLE >= (2.0123542703455186::DOUBLE)
                              THEN CASE WHEN (0.12506479327874148::DOUBLE) * x::DOUBLE + (0.9921485763141251::DOUBLE) * y::DOUBLE >= (6.624095485616598::DOUBLE)
                                THEN CASE WHEN (0.31234169840222253::DOUBLE) * x::DOUBLE + (0.949969822383435::DOUBLE) * y::DOUBLE >= (7.503972631901579::DOUBLE)
                                  THEN 364
                                  ELSE 356
                                END
                                ELSE 351
                              END
                              ELSE CASE WHEN (0.24463520216583187::DOUBLE) * x::DOUBLE + (0.969615190609802::DOUBLE) * y::DOUBLE >= (7.433647531650302::DOUBLE)
                                THEN CASE WHEN (0.7579422523207363::DOUBLE) * x::DOUBLE + (-0.6523216554330917::DOUBLE) * y::DOUBLE >= (-1.0544878631714583::DOUBLE)
                                  THEN 364
                                  ELSE 336
                                END
                                ELSE CASE WHEN (0.9115614874165231::DOUBLE) * x::DOUBLE + (0.4111637808209473::DOUBLE) * y::DOUBLE >= (6.6081350448021805::DOUBLE)
                                  THEN 364
                                  ELSE 325
                                END
                              END
                            END
                          END
                        END
                      END
                    END
                    ELSE CASE WHEN (0.837588815988965::DOUBLE) * x::DOUBLE + (-0.5463011763946731::DOUBLE) * y::DOUBLE >= (-0.20152589553028166::DOUBLE)
                      THEN CASE WHEN (0.9424683400277024::DOUBLE) * x::DOUBLE + (-0.3342954203177589::DOUBLE) * y::DOUBLE >= (1.8346441887851452::DOUBLE)
                        THEN CASE WHEN (0.9460368476096588::DOUBLE) * x::DOUBLE + (0.32405907326408784::DOUBLE) * y::DOUBLE >= (5.846733407576924::DOUBLE)
                          THEN CASE WHEN (0.3247073064986609::DOUBLE) * x::DOUBLE + (-0.9458145511179158::DOUBLE) * y::DOUBLE >= (-4.148224956517641::DOUBLE)
                            THEN CASE WHEN (0.34705112338379945::DOUBLE) * x::DOUBLE + (-0.9378462122107455::DOUBLE) * y::DOUBLE >= (-3.8298356954752535::DOUBLE)
                              THEN CASE WHEN (0.49256994525715136::DOUBLE) * x::DOUBLE + (0.8702728589525053::DOUBLE) * y::DOUBLE >= (7.093529837693077::DOUBLE)
                                THEN CASE WHEN (0.13861569656338388::DOUBLE) * x::DOUBLE + (-0.9903462468582631::DOUBLE) * y::DOUBLE >= (-4.965186657182302::DOUBLE)
                                  THEN CASE WHEN (0.521497724350113::DOUBLE) * x::DOUBLE + (0.8532526727163845::DOUBLE) * y::DOUBLE >= (7.141445886010203::DOUBLE)
                                    THEN 367
                                    ELSE 357
                                  END
                                  ELSE CASE WHEN (0.9596553333173786::DOUBLE) * x::DOUBLE + (-0.28117901990637756::DOUBLE) * y::DOUBLE >= (2.7020933573251154::DOUBLE)
                                    THEN 367
                                    ELSE 352
                                  END
                                END
                                ELSE CASE WHEN (0.8373057118767767::DOUBLE) * x::DOUBLE + (-0.5467349859470529::DOUBLE) * y::DOUBLE >= (0.6398563469241787::DOUBLE)
                                  THEN 357
                                  ELSE 346
                                END
                              END
                              ELSE CASE WHEN (0.5204367657079525::DOUBLE) * x::DOUBLE + (0.8539002124952574::DOUBLE) * y::DOUBLE >= (7.265823042454205::DOUBLE)
                                THEN CASE WHEN (0.0662835613190182::DOUBLE) * x::DOUBLE + (-0.997800826567541::DOUBLE) * y::DOUBLE >= (-5.555182428655475::DOUBLE)
                                  THEN 352
                                  ELSE 351
                                END
                                ELSE CASE WHEN (0.9991465579367759::DOUBLE) * x::DOUBLE + (-0.04130563839347719::DOUBLE) * y::DOUBLE >= (4.106363910126575::DOUBLE)
                                  THEN 352
                                  ELSE 338
                                END
                              END
                            END
                            ELSE CASE WHEN (0.12506479327874148::DOUBLE) * x::DOUBLE + (0.9921485763141251::DOUBLE) * y::DOUBLE >= (6.624095485616598::DOUBLE)
                              THEN CASE WHEN (0.33356933594840554::DOUBLE) * x::DOUBLE + (-0.9427255688242149::DOUBLE) * y::DOUBLE >= (-4.514581340324823::DOUBLE)
                                THEN CASE WHEN (0.8849713454456182::DOUBLE) * x::DOUBLE + (0.4656454850421855::DOUBLE) * y::DOUBLE >= (6.710108217298438::DOUBLE)
                                  THEN 356
                                  ELSE 332
                                END
                                ELSE CASE WHEN (0.9467399792867978::DOUBLE) * x::DOUBLE + (-0.32199908636521585::DOUBLE) * y::DOUBLE >= (2.0123542703455186::DOUBLE)
                                  THEN 356
                                  ELSE 325
                                END
                              END
                              ELSE CASE WHEN (0.09442683458649628::DOUBLE) * x::DOUBLE + (-0.9955318040675418::DOUBLE) * y::DOUBLE >= (-5.609207202344644::DOUBLE)
                                THEN CASE WHEN (0.9779078661153228::DOUBLE) * x::DOUBLE + (0.20903637336544087::DOUBLE) * y::DOUBLE >= (5.45915584453031::DOUBLE)
                                  THEN 351
                                  ELSE 334
                                END
                                ELSE CASE WHEN (0.7865903574768105::DOUBLE) * x::DOUBLE + (-0.6174751893999496::DOUBLE) * y::DOUBLE >= (-0.3550862689626979::DOUBLE)
                                  THEN 351
                                  ELSE 332
                                END
                              END
                            END
                          END
                          ELSE CASE WHEN (0.043341665778561966::DOUBLE) * x::DOUBLE + (0.9990603084937062::DOUBLE) * y::DOUBLE >= (5.9656572110779775::DOUBLE)
                            THEN CASE WHEN (0.5876838883503631::DOUBLE) * x::DOUBLE + (-0.8090906298885174::DOUBLE) * y::DOUBLE >= (-2.283840880574887::DOUBLE)
                              THEN CASE WHEN (0.26463010987518837::DOUBLE) * x::DOUBLE + (0.9643499908992822::DOUBLE) * y::DOUBLE >= (6.722918116045485::DOUBLE)
                                THEN 334
                                ELSE 329
                              END
                              ELSE CASE WHEN (0.5288133359087742::DOUBLE) * x::DOUBLE + (0.8487381550072047::DOUBLE) * y::DOUBLE >= (7.276051239707112::DOUBLE)
                                THEN CASE WHEN (0.09442683458649628::DOUBLE) * x::DOUBLE + (-0.9955318040675418::DOUBLE) * y::DOUBLE >= (-5.609207202344644::DOUBLE)
                                  THEN 334
                                  ELSE 332
                                END
                                ELSE CASE WHEN (0.9633564511606872::DOUBLE) * x::DOUBLE + (0.26822443588734873::DOUBLE) * y::DOUBLE >= (5.558432048084178::DOUBLE)
                                  THEN 334
                                  ELSE 322
                                END
                              END
                            END
                            ELSE CASE WHEN (0.9950167564151656::DOUBLE) * x::DOUBLE + (0.09970784549393735::DOUBLE) * y::DOUBLE >= (4.62614210055767::DOUBLE)
                              THEN CASE WHEN (0.9996646884159652::DOUBLE) * x::DOUBLE + (0.025894222023673568::DOUBLE) * y::DOUBLE >= (4.239086691073692::DOUBLE)
                                THEN CASE WHEN (0.12456781429623541::DOUBLE) * x::DOUBLE + (-0.9922110963103862::DOUBLE) * y::DOUBLE >= (-5.073235223811032::DOUBLE)
                                  THEN CASE WHEN (0.9692108173668165::DOUBLE) * x::DOUBLE + (0.24623239327746343::DOUBLE) * y::DOUBLE >= (5.497097085569639::DOUBLE)
                                    THEN 346
                                    ELSE 330
                                  END
                                  ELSE CASE WHEN (0.8317337873233581::DOUBLE) * x::DOUBLE + (-0.5551746635291842::DOUBLE) * y::DOUBLE >= (0.39053055461520136::DOUBLE)
                                    THEN 346
                                    ELSE 329
                                  END
                                END
                                ELSE CASE WHEN (0.6874812518284111::DOUBLE) * x::DOUBLE + (-0.7262021263976309::DOUBLE) * y::DOUBLE >= (-1.271376499860891::DOUBLE)
                                  THEN 330
                                  ELSE 318
                                END
                              END
                              ELSE CASE WHEN (0.608227212959541::DOUBLE) * x::DOUBLE + (-0.7937629730690826::DOUBLE) * y::DOUBLE >= (-2.04578706728268::DOUBLE)
                                THEN CASE WHEN (0.10581964901324596::DOUBLE) * x::DOUBLE + (0.9943853387307726::DOUBLE) * y::DOUBLE >= (6.019936311897586::DOUBLE)
                                  THEN 318
                                  ELSE 315
                                END
                                ELSE CASE WHEN (0.9668499153887777::DOUBLE) * x::DOUBLE + (0.25534533697076445::DOUBLE) * y::DOUBLE >= (5.28936574204499::DOUBLE)
                                  THEN 318
                                  ELSE 307
                                END
                              END
                            END
                          END
                        END
                        ELSE CASE WHEN (0.6507525113025667::DOUBLE) * x::DOUBLE + (0.7592899110573003::DOUBLE) * y::DOUBLE >= (6.9772958318067175::DOUBLE)
                          THEN CASE WHEN (0.7376847036138746::DOUBLE) * x::DOUBLE + (-0.6751453754963519::DOUBLE) * y::DOUBLE >= (-1.3313323578174443::DOUBLE)
                            THEN CASE WHEN (0.5288133359087742::DOUBLE) * x::DOUBLE + (0.8487381550072047::DOUBLE) * y::DOUBLE >= (7.276051239707112::DOUBLE)
                              THEN CASE WHEN (0.47607606694308635::DOUBLE) * x::DOUBLE + (0.8794041042001124::DOUBLE) * y::DOUBLE >= (7.370336853241364::DOUBLE)
                                THEN CASE WHEN (0.33356933594840554::DOUBLE) * x::DOUBLE + (-0.9427255688242149::DOUBLE) * y::DOUBLE >= (-4.514581340324823::DOUBLE)
                                  THEN 332
                                  ELSE 325
                                END
                                ELSE CASE WHEN (0.9369713151003541::DOUBLE) * x::DOUBLE + (0.34940628883738317::DOUBLE) * y::DOUBLE >= (5.929188880806201::DOUBLE)
                                  THEN 332
                                  ELSE 309
                                END
                              END
                              ELSE CASE WHEN (0.043341665778561966::DOUBLE) * x::DOUBLE + (0.9990603084937062::DOUBLE) * y::DOUBLE >= (5.9656572110779775::DOUBLE)
                                THEN CASE WHEN (0.9286660879268522::DOUBLE) * x::DOUBLE + (0.37091683317778423::DOUBLE) * y::DOUBLE >= (5.7742223923292535::DOUBLE)
                                  THEN CASE WHEN (0.5961770247655587::DOUBLE) * x::DOUBLE + (-0.8028530096734311::DOUBLE) * y::DOUBLE >= (-2.4106231993309795::DOUBLE)
                                    THEN 322
                                    ELSE 309
                                  END
                                  ELSE CASE WHEN (0.972287185449547::DOUBLE) * x::DOUBLE + (-0.23378971108797394::DOUBLE) * y::DOUBLE >= (2.389360885463951::DOUBLE)
                                    THEN 322
                                    ELSE 292
                                  END
                                END
                                ELSE 318
                              END
                            END
                            ELSE CASE WHEN (0.462840819728479::DOUBLE) * x::DOUBLE + (0.8864414112579971::DOUBLE) * y::DOUBLE >= (7.413133405148278::DOUBLE)
                              THEN CASE WHEN (0.8406913248193433::DOUBLE) * x::DOUBLE + (-0.5415146317261402::DOUBLE) * y::DOUBLE >= (-0.1493562489071012::DOUBLE)
                                THEN CASE WHEN (0.24463520216583187::DOUBLE) * x::DOUBLE + (0.969615190609802::DOUBLE) * y::DOUBLE >= (7.433647531650302::DOUBLE)
                                  THEN 336
                                  ELSE 325
                                END
                                ELSE CASE WHEN (0.7676541388236828::DOUBLE) * x::DOUBLE + (0.6408643562774186::DOUBLE) * y::DOUBLE >= (7.394733926067754::DOUBLE)
                                  THEN 336
                                  ELSE 304
                                END
                              END
                              ELSE CASE WHEN (0.08763013612270094::DOUBLE) * x::DOUBLE + (-0.9961530802256834::DOUBLE) * y::DOUBLE >= (-5.747728070878204::DOUBLE)
                                THEN 292
                                ELSE CASE WHEN (0.944446981338359::DOUBLE) * x::DOUBLE + (0.32866380914372284::DOUBLE) * y::DOUBLE >= (5.761135078485157::DOUBLE)
                                  THEN 325
                                  ELSE 289
                                END
                              END
                            END
                          END
                          ELSE CASE WHEN (0.8855158878498263::DOUBLE) * x::DOUBLE + (0.4646090963008945::DOUBLE) * y::DOUBLE >= (5.933523867329416::DOUBLE)
                            THEN CASE WHEN (0.3986335427311062::DOUBLE) * x::DOUBLE + (-0.9171102979520224::DOUBLE) * y::DOUBLE >= (-3.7559581276249574::DOUBLE)
                              THEN CASE WHEN (0.9796443081203915::DOUBLE) * x::DOUBLE + (0.20074120047294655::DOUBLE) * y::DOUBLE >= (4.9013316977929::DOUBLE)
                                THEN CASE WHEN (0.9668499153887777::DOUBLE) * x::DOUBLE + (0.25534533697076445::DOUBLE) * y::DOUBLE >= (5.28936574204499::DOUBLE)
                                  THEN CASE WHEN (0.043341665778561966::DOUBLE) * x::DOUBLE + (0.9990603084937062::DOUBLE) * y::DOUBLE >= (5.9656572110779775::DOUBLE)
                                    THEN 322
                                    ELSE 318
                                  END
                                  ELSE CASE WHEN (0.5486875389017517::DOUBLE) * x::DOUBLE + (0.8360275023310769::DOUBLE) * y::DOUBLE >= (7.010477220139684::DOUBLE)
                                    THEN 322
                                    ELSE 307
                                  END
                                END
                                ELSE 298
                              END
                              ELSE CASE WHEN (0.04157318985356734::DOUBLE) * x::DOUBLE + (0.9991354612290564::DOUBLE) * y::DOUBLE >= (6.025451306097212::DOUBLE)
                                THEN CASE WHEN (0.972287185449547::DOUBLE) * x::DOUBLE + (-0.23378971108797394::DOUBLE) * y::DOUBLE >= (2.389360885463951::DOUBLE)
                                  THEN 322
                                  ELSE 292
                                END
                                ELSE CASE WHEN (0.8463538885272116::DOUBLE) * x::DOUBLE + (-0.5326209678325371::DOUBLE) * y::DOUBLE >= (0.16949914699131163::DOUBLE)
                                  THEN CASE WHEN (0.5486875389017517::DOUBLE) * x::DOUBLE + (0.8360275023310769::DOUBLE) * y::DOUBLE >= (7.010477220139684::DOUBLE)
                                    THEN 322
                                    ELSE 307
                                  END
                                  ELSE CASE WHEN (0.9666611380977189::DOUBLE) * x::DOUBLE + (0.256059063677939::DOUBLE) * y::DOUBLE >= (5.242852782484995::DOUBLE)
                                    THEN 322
                                    ELSE 291
                                  END
                                END
                              END
                            END
                            ELSE CASE WHEN (0.9870710969563827::DOUBLE) * x::DOUBLE + (-0.160283029523787::DOUBLE) * y::DOUBLE >= (2.6261794039616158::DOUBLE)
                              THEN CASE WHEN (0.6825014387219803::DOUBLE) * x::DOUBLE + (0.7308842494830675::DOUBLE) * y::DOUBLE >= (6.689980258805075::DOUBLE)
                                THEN CASE WHEN (0.3986335427311062::DOUBLE) * x::DOUBLE + (-0.9171102979520224::DOUBLE) * y::DOUBLE >= (-3.7559581276249574::DOUBLE)
                                  THEN 298
                                  ELSE 291
                                END
                                ELSE CASE WHEN (0.9938331881382664::DOUBLE) * x::DOUBLE + (-0.11088550020146605::DOUBLE) * y::DOUBLE >= (3.0409421392489633::DOUBLE)
                                  THEN 298
                                  ELSE 283
                                END
                              END
                              ELSE CASE WHEN (0.03341474672091386::DOUBLE) * x::DOUBLE + (0.9994415714295544::DOUBLE) * y::DOUBLE >= (5.835659289153651::DOUBLE)
                                THEN CASE WHEN (0.5743739002481691::DOUBLE) * x::DOUBLE + (-0.8185930751684296::DOUBLE) * y::DOUBLE >= (-2.6720057346470725::DOUBLE)
                                  THEN 283
                                  ELSE 270
                                END
                                ELSE CASE WHEN (0.8878386317730407::DOUBLE) * x::DOUBLE + (0.46015493470283997::DOUBLE) * y::DOUBLE >= (5.742710729500391::DOUBLE)
                                  THEN 283
                                  ELSE 268
                                END
                              END
                            END
                          END
                        END
                      END
                      ELSE CASE WHEN (0.6539238042603632::DOUBLE) * x::DOUBLE + (0.7565604128036664::DOUBLE) * y::DOUBLE >= (7.1237395106021175::DOUBLE)
                        THEN CASE WHEN (0.16527390983541007::DOUBLE) * x::DOUBLE + (-0.9862477045487694::DOUBLE) * y::DOUBLE >= (-6.666199658596309::DOUBLE)
                          THEN CASE WHEN (0.8721268010012102::DOUBLE) * x::DOUBLE + (0.4892799229228555::DOUBLE) * y::DOUBLE >= (6.542758176475283::DOUBLE)
                            THEN CASE WHEN (0.7336728866641773::DOUBLE) * x::DOUBLE + (-0.6795028295554429::DOUBLE) * y::DOUBLE >= (-2.1402744046923123::DOUBLE)
                              THEN CASE WHEN (0.12198715969079127::DOUBLE) * x::DOUBLE + (-0.9925316785224406::DOUBLE) * y::DOUBLE >= (-6.232943028414999::DOUBLE)
                                THEN CASE WHEN (0.7676541388236828::DOUBLE) * x::DOUBLE + (0.6408643562774186::DOUBLE) * y::DOUBLE >= (7.394733926067754::DOUBLE)
                                  THEN 336
                                  ELSE 304
                                END
                                ELSE CASE WHEN (0.6605033977456786::DOUBLE) * x::DOUBLE + (0.750823056096717::DOUBLE) * y::DOUBLE >= (7.921619410979988::DOUBLE)
                                  THEN CASE WHEN (0.42872981545358385::DOUBLE) * x::DOUBLE + (-0.9034327564025648::DOUBLE) * y::DOUBLE >= (-4.587367602977324::DOUBLE)
                                    THEN 336
                                    ELSE 323
                                  END
                                  ELSE CASE WHEN (0.9671235436857959::DOUBLE) * x::DOUBLE + (-0.2543070019653972::DOUBLE) * y::DOUBLE >= (2.129356641477348::DOUBLE)
                                    THEN 336
                                    ELSE 301
                                  END
                                END
                              END
                              ELSE CASE WHEN (0.060996188627908794::DOUBLE) * x::DOUBLE + (0.9981379989625023::DOUBLE) * y::DOUBLE >= (7.6031906335657755::DOUBLE)
                                THEN CASE WHEN (0.8396339309960504::DOUBLE) * x::DOUBLE + (-0.543152705894134::DOUBLE) * y::DOUBLE >= (-0.8393653558000467::DOUBLE)
                                  THEN 323
                                  ELSE 275
                                END
                                ELSE CASE WHEN (0.9999531403030933::DOUBLE) * x::DOUBLE + (-0.009680764328406113::DOUBLE) * y::DOUBLE >= (3.706883994522104::DOUBLE)
                                  THEN 323
                                  ELSE 273
                                END
                              END
                            END
                            ELSE CASE WHEN (0.5443798721309016::DOUBLE) * x::DOUBLE + (-0.8388388133716413::DOUBLE) * y::DOUBLE >= (-3.8946500405316384::DOUBLE)
                              THEN CASE WHEN (0.2970839004259808::DOUBLE) * x::DOUBLE + (0.9548513790678033::DOUBLE) * y::DOUBLE >= (7.347284892093182::DOUBLE)
                                THEN CASE WHEN (0.8398183615614013::DOUBLE) * x::DOUBLE + (-0.5428674972627515::DOUBLE) * y::DOUBLE >= (-0.5314236282282274::DOUBLE)
                                  THEN 304
                                  ELSE 269
                                END
                                ELSE CASE WHEN (0.8018740902842397::DOUBLE) * x::DOUBLE + (-0.5974930487719695::DOUBLE) * y::DOUBLE >= (-0.9530411709618916::DOUBLE)
                                  THEN CASE WHEN (0.462840819728479::DOUBLE) * x::DOUBLE + (0.8864414112579971::DOUBLE) * y::DOUBLE >= (7.413133405148278::DOUBLE)
                                    THEN 304
                                    ELSE 289
                                  END
                                  ELSE CASE WHEN (0.9879537232141509::DOUBLE) * x::DOUBLE + (0.15474960674359384::DOUBLE) * y::DOUBLE >= (4.587447292021264::DOUBLE)
                                    THEN 304
                                    ELSE 260
                                  END
                                END
                              END
                              ELSE CASE WHEN (0.023780203345363685::DOUBLE) * x::DOUBLE + (-0.9997172109796116::DOUBLE) * y::DOUBLE >= (-7.1652251438025285::DOUBLE)
                                THEN CASE WHEN (0.8986517982480497::DOUBLE) * x::DOUBLE + (-0.438662678496298::DOUBLE) * y::DOUBLE >= (-0.0850861583726843::DOUBLE)
                                  THEN CASE WHEN (0.044134721425382835::DOUBLE) * x::DOUBLE + (0.9990255884434112::DOUBLE) * y::DOUBLE >= (7.156841608106764::DOUBLE)
                                    THEN 273
                                    ELSE 269
                                  END
                                  ELSE CASE WHEN (0.8854106733854019::DOUBLE) * x::DOUBLE + (0.46480957332568923::DOUBLE) * y::DOUBLE >= (6.210202262880763::DOUBLE)
                                    THEN 273
                                    ELSE 229
                                  END
                                END
                                ELSE CASE WHEN (0.8866895430629254::DOUBLE) * x::DOUBLE + (-0.46236528224214707::DOUBLE) * y::DOUBLE >= (-0.5018100942684236::DOUBLE)
                                  THEN 273
                                  ELSE 225
                                END
                              END
                            END
                          END
                          ELSE CASE WHEN (0.8866895430629254::DOUBLE) * x::DOUBLE + (-0.46236528224214707::DOUBLE) * y::DOUBLE >= (-0.5018100942684236::DOUBLE)
                            THEN CASE WHEN (0.4545113561197602::DOUBLE) * x::DOUBLE + (-0.8907409427876191::DOUBLE) * y::DOUBLE >= (-5.120637453579727::DOUBLE)
                              THEN CASE WHEN (0.060996188627908794::DOUBLE) * x::DOUBLE + (0.9981379989625023::DOUBLE) * y::DOUBLE >= (7.6031906335657755::DOUBLE)
                                THEN CASE WHEN (0.9901936009633544::DOUBLE) * x::DOUBLE + (0.1397019420452895::DOUBLE) * y::DOUBLE >= (4.778575338819898::DOUBLE)
                                  THEN 311
                                  ELSE 275
                                END
                                ELSE 273
                              END
                              ELSE CASE WHEN (0.005888924860716398::DOUBLE) * x::DOUBLE + (0.999982660131657::DOUBLE) * y::DOUBLE >= (7.739154467329896::DOUBLE)
                                THEN CASE WHEN (0.9999479565363135::DOUBLE) * x::DOUBLE + (-0.01020216736044923::DOUBLE) * y::DOUBLE >= (3.6141755033018526::DOUBLE)
                                  THEN 305
                                  ELSE 276
                                END
                                ELSE CASE WHEN (0.7424629833439083::DOUBLE) * x::DOUBLE + (0.6698870937434631::DOUBLE) * y::DOUBLE >= (7.911872883944842::DOUBLE)
                                  THEN 305
                                  ELSE 275
                                END
                              END
                            END
                            ELSE CASE WHEN (0.9857074510569384::DOUBLE) * x::DOUBLE + (0.16846608243451677::DOUBLE) * y::DOUBLE >= (4.503070545207479::DOUBLE)
                              THEN CASE WHEN (0.7607803876418203::DOUBLE) * x::DOUBLE + (-0.6490094003784241::DOUBLE) * y::DOUBLE >= (-2.4376355237021454::DOUBLE)
                                THEN CASE WHEN (0.005888924860716398::DOUBLE) * x::DOUBLE + (0.999982660131657::DOUBLE) * y::DOUBLE >= (7.739154467329896::DOUBLE)
                                  THEN 276
                                  ELSE 275
                                END
                                ELSE CASE WHEN (0.995943713828215::DOUBLE) * x::DOUBLE + (0.08997843567245752::DOUBLE) * y::DOUBLE >= (4.062012676918075::DOUBLE)
                                  THEN 276
                                  ELSE 248
                                END
                              END
                              ELSE CASE WHEN (0.5265099580818334::DOUBLE) * x::DOUBLE + (-0.8501689620544061::DOUBLE) * y::DOUBLE >= (-4.970919509167771::DOUBLE)
                                THEN CASE WHEN (0.4329385895609194::DOUBLE) * x::DOUBLE + (0.9014234175286339::DOUBLE) * y::DOUBLE >= (8.258329407178612::DOUBLE)
                                  THEN 248
                                  ELSE 225
                                END
                                ELSE CASE WHEN (0.9999355348094897::DOUBLE) * x::DOUBLE + (0.011354568475282115::DOUBLE) * y::DOUBLE >= (3.1016723448059067::DOUBLE)
                                  THEN 248
                                  ELSE 212
                                END
                              END
                            END
                          END
                        END
                        ELSE CASE WHEN (0.1986231740301241::DOUBLE) * x::DOUBLE + (0.9800759331491612::DOUBLE) * y::DOUBLE >= (6.525729545516128::DOUBLE)
                          THEN CASE WHEN (0.6385850777454809::DOUBLE) * x::DOUBLE + (-0.769551231875304::DOUBLE) * y::DOUBLE >= (-2.7349185883616434::DOUBLE)
                            THEN CASE WHEN (0.9851094218056161::DOUBLE) * x::DOUBLE + (-0.17192855222389544::DOUBLE) * y::DOUBLE >= (2.3317794806495935::DOUBLE)
                              THEN CASE WHEN (0.338152443662233::DOUBLE) * x::DOUBLE + (-0.9410913477687808::DOUBLE) * y::DOUBLE >= (-4.723431511959406::DOUBLE)
                                THEN CASE WHEN (0.6737816907582495::DOUBLE) * x::DOUBLE + (0.7389304657401498::DOUBLE) * y::DOUBLE >= (6.981409163724141::DOUBLE)
                                  THEN CASE WHEN (0.08763013612270094::DOUBLE) * x::DOUBLE + (-0.9961530802256834::DOUBLE) * y::DOUBLE >= (-5.747728070878204::DOUBLE)
                                    THEN 292
                                    ELSE 289
                                  END
                                  ELSE CASE WHEN (0.8745919652647598::DOUBLE) * x::DOUBLE + (-0.484859664536374::DOUBLE) * y::DOUBLE >= (0.26293153321033813::DOUBLE)
                                    THEN 292
                                    ELSE 277
                                  END
                                END
                                ELSE CASE WHEN (0.8018740902842397::DOUBLE) * x::DOUBLE + (-0.5974930487719695::DOUBLE) * y::DOUBLE >= (-0.9530411709618916::DOUBLE)
                                  THEN 289
                                  ELSE 260
                                END
                              END
                              ELSE CASE WHEN (0.9264888044044485::DOUBLE) * x::DOUBLE + (0.3763223290122653::DOUBLE) * y::DOUBLE >= (5.220101241164895::DOUBLE)
                                THEN CASE WHEN (0.1906077513442838::DOUBLE) * x::DOUBLE + (0.98166627991771::DOUBLE) * y::DOUBLE >= (6.807022393232644::DOUBLE)
                                  THEN 260
                                  ELSE 254
                                END
                                ELSE 226
                              END
                            END
                            ELSE CASE WHEN (0.18933571190533283::DOUBLE) * x::DOUBLE + (0.9819124137097467::DOUBLE) * y::DOUBLE >= (6.636926262444827::DOUBLE)
                              THEN CASE WHEN (0.2935550526033149::DOUBLE) * x::DOUBLE + (0.9559421693235765::DOUBLE) * y::DOUBLE >= (7.306293205896173::DOUBLE)
                                THEN CASE WHEN (0.5443798721309016::DOUBLE) * x::DOUBLE + (-0.8388388133716413::DOUBLE) * y::DOUBLE >= (-3.8946500405316384::DOUBLE)
                                  THEN 260
                                  ELSE 229
                                END
                                ELSE CASE WHEN (0.880631049922036::DOUBLE) * x::DOUBLE + (-0.4738026529191373::DOUBLE) * y::DOUBLE >= (-0.3948367349339028::DOUBLE)
                                  THEN CASE WHEN (0.91615116083933::DOUBLE) * x::DOUBLE + (0.40083294586741247::DOUBLE) * y::DOUBLE >= (5.546797008051962::DOUBLE)
                                    THEN 260
                                    ELSE 239
                                  END
                                  ELSE CASE WHEN (0.9999999397052101::DOUBLE) * x::DOUBLE + (0.00034726009839250666::DOUBLE) * y::DOUBLE >= (3.140348652700794::DOUBLE)
                                    THEN 260
                                    ELSE 217
                                  END
                                END
                              END
                              ELSE 226
                            END
                          END
                          ELSE CASE WHEN (0.24512641777221703::DOUBLE) * x::DOUBLE + (-0.969491123894469::DOUBLE) * y::DOUBLE >= (-4.761779402510716::DOUBLE)
                            THEN CASE WHEN (0.9988253699639632::DOUBLE) * x::DOUBLE + (-0.048454930774401335::DOUBLE) * y::DOUBLE >= (3.1047729614862707::DOUBLE)
                              THEN CASE WHEN (0.9995971197247895::DOUBLE) * x::DOUBLE + (0.028383062518073193::DOUBLE) * y::DOUBLE >= (3.5794888448951436::DOUBLE)
                                THEN CASE WHEN (0.03341474672091386::DOUBLE) * x::DOUBLE + (0.9994415714295544::DOUBLE) * y::DOUBLE >= (5.835659289153651::DOUBLE)
                                  THEN 270
                                  ELSE 268
                                END
                                ELSE CASE WHEN (0.506718624318301::DOUBLE) * x::DOUBLE + (0.8621114984553732::DOUBLE) * y::DOUBLE >= (6.667429353638196::DOUBLE)
                                  THEN 270
                                  ELSE 258
                                END
                              END
                              ELSE CASE WHEN (0.5147906433430397::DOUBLE) * x::DOUBLE + (0.8573159239897853::DOUBLE) * y::DOUBLE >= (6.581310017640591::DOUBLE)
                                THEN CASE WHEN (0.2761585154497595::DOUBLE) * x::DOUBLE + (-0.9611121029019378::DOUBLE) * y::DOUBLE >= (-4.584366559582003::DOUBLE)
                                  THEN 258
                                  ELSE 252
                                END
                                ELSE CASE WHEN (0.9918002946390864::DOUBLE) * x::DOUBLE + (-0.12779740041887253::DOUBLE) * y::DOUBLE >= (2.517497802241567::DOUBLE)
                                  THEN 258
                                  ELSE 243
                                END
                              END
                            END
                            ELSE CASE WHEN (0.9264888044044485::DOUBLE) * x::DOUBLE + (0.3763223290122653::DOUBLE) * y::DOUBLE >= (5.220101241164895::DOUBLE)
                              THEN CASE WHEN (0.8855158878498263::DOUBLE) * x::DOUBLE + (0.4646090963008945::DOUBLE) * y::DOUBLE >= (5.933523867329416::DOUBLE)
                                THEN 292
                                ELSE CASE WHEN (0.10395032377492466::DOUBLE) * x::DOUBLE + (0.9945824903883478::DOUBLE) * y::DOUBLE >= (6.281330476161053::DOUBLE)
                                  THEN CASE WHEN (0.547523920126524::DOUBLE) * x::DOUBLE + (-0.8367900315427304::DOUBLE) * y::DOUBLE >= (-3.127383984040731::DOUBLE)
                                    THEN 270
                                    ELSE 254
                                  END
                                  ELSE CASE WHEN (0.9988253699639632::DOUBLE) * x::DOUBLE + (-0.048454930774401335::DOUBLE) * y::DOUBLE >= (3.1047729614862707::DOUBLE)
                                    THEN 270
                                    ELSE 252
                                  END
                                END
                              END
                              ELSE CASE WHEN (0.3887105057753889::DOUBLE) * x::DOUBLE + (-0.921359941987843::DOUBLE) * y::DOUBLE >= (-4.221556015339273::DOUBLE)
                                THEN CASE WHEN (0.9368997591088586::DOUBLE) * x::DOUBLE + (0.3495981140992649::DOUBLE) * y::DOUBLE >= (5.039401937209444::DOUBLE)
                                  THEN 252
                                  ELSE 240
                                END
                                ELSE CASE WHEN (0.8681395807365383::DOUBLE) * x::DOUBLE + (-0.4963201268925002::DOUBLE) * y::DOUBLE >= (-0.18580379432899585::DOUBLE)
                                  THEN 252
                                  ELSE 226
                                END
                              END
                            END
                          END
                        END
                      END
                    END
                  END
                  ELSE CASE WHEN (0.7845851254682064::DOUBLE) * x::DOUBLE + (-0.6200211132647331::DOUBLE) * y::DOUBLE >= (0.06432223348443467::DOUBLE)
                    THEN CASE WHEN (0.6538226404046624::DOUBLE) * x::DOUBLE + (0.7566478407385271::DOUBLE) * y::DOUBLE >= (6.4327171673028225::DOUBLE)
                      THEN CASE WHEN (0.6193385152548387::DOUBLE) * x::DOUBLE + (0.785124068871877::DOUBLE) * y::DOUBLE >= (6.977403122292099::DOUBLE)
                        THEN CASE WHEN (0.8918811500471394::DOUBLE) * x::DOUBLE + (-0.4522698466519651::DOUBLE) * y::DOUBLE >= (1.7677819259774301::DOUBLE)
                          THEN CASE WHEN (0.710612505118433::DOUBLE) * x::DOUBLE + (0.703583589610577::DOUBLE) * y::DOUBLE >= (7.147074951603544::DOUBLE)
                            THEN CASE WHEN (0.5354217710022628::DOUBLE) * x::DOUBLE + (0.8445848253057833::DOUBLE) * y::DOUBLE >= (7.238397763850619::DOUBLE)
                              THEN CASE WHEN (0.3031292715539656::DOUBLE) * x::DOUBLE + (-0.9529494450007105::DOUBLE) * y::DOUBLE >= (-3.7941413716647494::DOUBLE)
                                THEN CASE WHEN (0.8075282904243498::DOUBLE) * x::DOUBLE + (-0.5898288397190553::DOUBLE) * y::DOUBLE >= (0.7777871933535323::DOUBLE)
                                  THEN CASE WHEN (0.14562062079460397::DOUBLE) * x::DOUBLE + (0.989340504982685::DOUBLE) * y::DOUBLE >= (6.149781189307491::DOUBLE)
                                    THEN 409
                                    ELSE 406
                                  END
                                  ELSE CASE WHEN (0.679483881251522::DOUBLE) * x::DOUBLE + (0.7336904354830908::DOUBLE) * y::DOUBLE >= (7.400514793179829::DOUBLE)
                                    THEN 409
                                    ELSE 396
                                  END
                                END
                                ELSE CASE WHEN (0.9843885351851996::DOUBLE) * x::DOUBLE + (-0.17600912418376827::DOUBLE) * y::DOUBLE >= (3.8547903931655054::DOUBLE)
                                  THEN 409
                                  ELSE 391
                                END
                              END
                              ELSE CASE WHEN (0.9979160001675773::DOUBLE) * x::DOUBLE + (-0.06452640242214072::DOUBLE) * y::DOUBLE >= (4.454158041523379::DOUBLE)
                                THEN CASE WHEN (0.12436023795789476::DOUBLE) * x::DOUBLE + (0.9922371345676676::DOUBLE) * y::DOUBLE >= (5.948360559655557::DOUBLE)
                                  THEN CASE WHEN (0.8075282904243498::DOUBLE) * x::DOUBLE + (-0.5898288397190553::DOUBLE) * y::DOUBLE >= (0.7777871933535323::DOUBLE)
                                    THEN 406
                                    ELSE 396
                                  END
                                  ELSE CASE WHEN (0.7836395562187713::DOUBLE) * x::DOUBLE + (0.621215780489555::DOUBLE) * y::DOUBLE >= (7.178149951480705::DOUBLE)
                                    THEN 406
                                    ELSE 392
                                  END
                                END
                                ELSE CASE WHEN (0.009205573008791766::DOUBLE) * x::DOUBLE + (-0.9999576278150889::DOUBLE) * y::DOUBLE >= (-5.324292120537174::DOUBLE)
                                  THEN CASE WHEN (0.9436996644648382::DOUBLE) * x::DOUBLE + (0.33080348137368754::DOUBLE) * y::DOUBLE >= (6.2888892287312625::DOUBLE)
                                    THEN 392
                                    ELSE 384
                                  END
                                  ELSE CASE WHEN (0.6136488519524897::DOUBLE) * x::DOUBLE + (-0.7895790565215057::DOUBLE) * y::DOUBLE >= (-1.3042996403311573::DOUBLE)
                                    THEN 392
                                    ELSE 383
                                  END
                                END
                              END
                            END
                            ELSE CASE WHEN (0.9446685231921895::DOUBLE) * x::DOUBLE + (-0.32802649479864837::DOUBLE) * y::DOUBLE >= (2.756877558791962::DOUBLE)
                              THEN CASE WHEN (0.2175336425690402::DOUBLE) * x::DOUBLE + (-0.9760528235452449::DOUBLE) * y::DOUBLE >= (-4.038778509472834::DOUBLE)
                                THEN CASE WHEN (0.8991052488337254::DOUBLE) * x::DOUBLE + (0.43773251138068864::DOUBLE) * y::DOUBLE >= (6.619937744308463::DOUBLE)
                                  THEN 400
                                  ELSE 387
                                END
                                ELSE CASE WHEN (0.9436996644648382::DOUBLE) * x::DOUBLE + (0.33080348137368754::DOUBLE) * y::DOUBLE >= (6.2888892287312625::DOUBLE)
                                  THEN CASE WHEN (0.3934999609139112::DOUBLE) * x::DOUBLE + (-0.91932463295658::DOUBLE) * y::DOUBLE >= (-2.904370988874355::DOUBLE)
                                    THEN 400
                                    ELSE 392
                                  END
                                  ELSE CASE WHEN (0.8986361822432103::DOUBLE) * x::DOUBLE + (-0.4386946682640989::DOUBLE) * y::DOUBLE >= (2.0487139455073984::DOUBLE)
                                    THEN 400
                                    ELSE 384
                                  END
                                END
                              END
                              ELSE CASE WHEN (0.08612732883281073::DOUBLE) * x::DOUBLE + (0.9962841377981106::DOUBLE) * y::DOUBLE >= (5.651121545817069::DOUBLE)
                                THEN CASE WHEN (0.7601428911224068::DOUBLE) * x::DOUBLE + (-0.6497559427016183::DOUBLE) * y::DOUBLE >= (0.11700839279294906::DOUBLE)
                                  THEN 384
                                  ELSE 375
                                END
                                ELSE CASE WHEN (0.7873693596332161::DOUBLE) * x::DOUBLE + (0.6164815419059837::DOUBLE) * y::DOUBLE >= (6.916277953054003::DOUBLE)
                                  THEN 384
                                  ELSE 372
                                END
                              END
                            END
                          END
                          ELSE CASE WHEN (0.9294195989356488::DOUBLE) * x::DOUBLE + (0.3690246727717504::DOUBLE) * y::DOUBLE >= (6.277193351341342::DOUBLE)
                            THEN CASE WHEN (0.5172156445412993::DOUBLE) * x::DOUBLE + (0.855855114515143::DOUBLE) * y::DOUBLE >= (7.114111547490378::DOUBLE)
                              THEN CASE WHEN (0.6325009871008086::DOUBLE) * x::DOUBLE + (-0.7745595531116396::DOUBLE) * y::DOUBLE >= (-1.3120556328124544::DOUBLE)
                                THEN CASE WHEN (0.5354217710022628::DOUBLE) * x::DOUBLE + (0.8445848253057833::DOUBLE) * y::DOUBLE >= (7.238397763850619::DOUBLE)
                                  THEN 391
                                  ELSE 383
                                END
                                ELSE 374
                              END
                              ELSE CASE WHEN (0.6228019981467099::DOUBLE) * x::DOUBLE + (-0.7823794930239837::DOUBLE) * y::DOUBLE >= (-1.3670846905180527::DOUBLE)
                                THEN CASE WHEN (0.710612505118433::DOUBLE) * x::DOUBLE + (0.703583589610577::DOUBLE) * y::DOUBLE >= (7.147074951603544::DOUBLE)
                                  THEN 383
                                  ELSE 375
                                END
                                ELSE CASE WHEN (0.9998541100927522::DOUBLE) * x::DOUBLE + (-0.017080940566332692::DOUBLE) * y::DOUBLE >= (4.563206978408361::DOUBLE)
                                  THEN 383
                                  ELSE 366
                                END
                              END
                            END
                            ELSE CASE WHEN (0.904070033403188::DOUBLE) * x::DOUBLE + (-0.42738434073133563::DOUBLE) * y::DOUBLE >= (1.728905686696951::DOUBLE)
                              THEN CASE WHEN (0.3957945271913603::DOUBLE) * x::DOUBLE + (0.9183390943683969::DOUBLE) * y::DOUBLE >= (6.742949822830298::DOUBLE)
                                THEN CASE WHEN (0.6228019981467099::DOUBLE) * x::DOUBLE + (-0.7823794930239837::DOUBLE) * y::DOUBLE >= (-1.3670846905180527::DOUBLE)
                                  THEN 375
                                  ELSE 366
                                END
                                ELSE CASE WHEN (0.7088400043635495::DOUBLE) * x::DOUBLE + (-0.7053692991716347::DOUBLE) * y::DOUBLE >= (-0.46452323496519865::DOUBLE)
                                  THEN CASE WHEN (0.08612732883281073::DOUBLE) * x::DOUBLE + (0.9962841377981106::DOUBLE) * y::DOUBLE >= (5.651121545817069::DOUBLE)
                                    THEN 375
                                    ELSE 372
                                  END
                                  ELSE CASE WHEN (0.9490547131695285::DOUBLE) * x::DOUBLE + (0.31511133177133455::DOUBLE) * y::DOUBLE >= (6.022099110046062::DOUBLE)
                                    THEN 375
                                    ELSE 359
                                  END
                                END
                              END
                              ELSE CASE WHEN (0.783762583198034::DOUBLE) * x::DOUBLE + (0.6210605551624937::DOUBLE) * y::DOUBLE >= (6.841615476336787::DOUBLE)
                                THEN CASE WHEN (0.2168048096407375::DOUBLE) * x::DOUBLE + (-0.9762149735158969::DOUBLE) * y::DOUBLE >= (-4.316660206706042::DOUBLE)
                                  THEN 359
                                  ELSE 357
                                END
                                ELSE CASE WHEN (0.8277007753918::DOUBLE) * x::DOUBLE + (-0.5611696948480139::DOUBLE) * y::DOUBLE >= (0.6425877741125552::DOUBLE)
                                  THEN 359
                                  ELSE 345
                                END
                              END
                            END
                          END
                        END
                        ELSE CASE WHEN (0.40712973347075304::DOUBLE) * x::DOUBLE + (-0.91337034116728::DOUBLE) * y::DOUBLE >= (-2.906129204816784::DOUBLE)
                          THEN CASE WHEN (0.9998057534205703::DOUBLE) * x::DOUBLE + (0.019709272617877967::DOUBLE) * y::DOUBLE >= (4.460179881731813::DOUBLE)
                            THEN CASE WHEN (0.5665498060763675::DOUBLE) * x::DOUBLE + (0.8240274978632876::DOUBLE) * y::DOUBLE >= (6.748063274275475::DOUBLE)
                              THEN CASE WHEN (0.9999609733352117::DOUBLE) * x::DOUBLE + (-0.008834693344778169::DOUBLE) * y::DOUBLE >= (4.5534131781128115::DOUBLE)
                                THEN CASE WHEN (0.1658608866083569::DOUBLE) * x::DOUBLE + (-0.9861491602660776::DOUBLE) * y::DOUBLE >= (-4.235022680107305::DOUBLE)
                                  THEN CASE WHEN (0.6041706949826583::DOUBLE) * x::DOUBLE + (0.7968549248917093::DOUBLE) * y::DOUBLE >= (6.879120149294178::DOUBLE)
                                    THEN 387
                                    ELSE 376
                                  END
                                  ELSE CASE WHEN (0.9446685231921895::DOUBLE) * x::DOUBLE + (-0.32802649479864837::DOUBLE) * y::DOUBLE >= (2.756877558791962::DOUBLE)
                                    THEN 387
                                    ELSE 372
                                  END
                                END
                                ELSE CASE WHEN (0.12040667385969245::DOUBLE) * x::DOUBLE + (-0.9927246510941721::DOUBLE) * y::DOUBLE >= (-4.489270784855915::DOUBLE)
                                  THEN CASE WHEN (0.44968082892300826::DOUBLE) * x::DOUBLE + (0.8931893148146793::DOUBLE) * y::DOUBLE >= (6.594396993288525::DOUBLE)
                                    THEN 372
                                    ELSE 363
                                  END
                                  ELSE CASE WHEN (0.9937865588695118::DOUBLE) * x::DOUBLE + (0.11130262984446668::DOUBLE) * y::DOUBLE >= (5.115859053180144::DOUBLE)
                                    THEN 372
                                    ELSE 361
                                  END
                                END
                              END
                              ELSE CASE WHEN (0.7121847078608139::DOUBLE) * x::DOUBLE + (-0.7019921238085275::DOUBLE) * y::DOUBLE >= (-0.33173293879903776::DOUBLE)
                                THEN CASE WHEN (0.9137723231240747::DOUBLE) * x::DOUBLE + (-0.4062267119385819::DOUBLE) * y::DOUBLE >= (2.071968851415225::DOUBLE)
                                  THEN CASE WHEN (0.06209856063934886::DOUBLE) * x::DOUBLE + (0.9980700219756733::DOUBLE) * y::DOUBLE >= (5.135688384309478::DOUBLE)
                                    THEN CASE WHEN (0.9999609733352117::DOUBLE) * x::DOUBLE + (-0.008834693344778169::DOUBLE) * y::DOUBLE >= (4.5534131781128115::DOUBLE)
                                      THEN 376
                                      ELSE 363
                                    END
                                    ELSE CASE WHEN (0.5717680395574223::DOUBLE) * x::DOUBLE + (0.8204153271000376::DOUBLE) * y::DOUBLE >= (6.615061311225542::DOUBLE)
                                      THEN 376
                                      ELSE 362
                                    END
                                  END
                                  ELSE CASE WHEN (0.8909479118222199::DOUBLE) * x::DOUBLE + (0.45410551463247634::DOUBLE) * y::DOUBLE >= (6.160481477817312::DOUBLE)
                                    THEN 363
                                    ELSE 344
                                  END
                                END
                                ELSE CASE WHEN (0.5626823238080578::DOUBLE) * x::DOUBLE + (0.8266732138360138::DOUBLE) * y::DOUBLE >= (6.555223039107117::DOUBLE)
                                  THEN 355
                                  ELSE 344
                                END
                              END
                            END
                            ELSE CASE WHEN (0.9964775032618778::DOUBLE) * x::DOUBLE + (0.08386051211967487::DOUBLE) * y::DOUBLE >= (4.604923658961378::DOUBLE)
                              THEN CASE WHEN (0.024466784091175982::DOUBLE) * x::DOUBLE + (-0.9997006434309401::DOUBLE) * y::DOUBLE >= (-4.851501642574301::DOUBLE)
                                THEN 344
                                ELSE 342
                              END
                              ELSE CASE WHEN (0.6945182377788456::DOUBLE) * x::DOUBLE + (-0.719475098521531::DOUBLE) * y::DOUBLE >= (-0.6457614390146764::DOUBLE)
                                THEN 344
                                ELSE 324
                              END
                            END
                          END
                          ELSE CASE WHEN (0.4460853469938818::DOUBLE) * x::DOUBLE + (0.8949904263160294::DOUBLE) * y::DOUBLE >= (6.531956617356737::DOUBLE)
                            THEN CASE WHEN (0.9278888314645883::DOUBLE) * x::DOUBLE + (-0.37285696512641514::DOUBLE) * y::DOUBLE >= (2.179152559133022::DOUBLE)
                              THEN CASE WHEN (0.04262825996559586::DOUBLE) * x::DOUBLE + (-0.9990910025880053::DOUBLE) * y::DOUBLE >= (-5.0425859979853485::DOUBLE)
                                THEN CASE WHEN (0.9937865588695118::DOUBLE) * x::DOUBLE + (0.11130262984446668::DOUBLE) * y::DOUBLE >= (5.115859053180144::DOUBLE)
                                  THEN 372
                                  ELSE 361
                                END
                                ELSE CASE WHEN (0.7088400043635495::DOUBLE) * x::DOUBLE + (-0.7053692991716347::DOUBLE) * y::DOUBLE >= (-0.46452323496519865::DOUBLE)
                                  THEN 372
                                  ELSE 359
                                END
                              END
                              ELSE CASE WHEN (0.8107297547655001::DOUBLE) * x::DOUBLE + (0.5854205879005896::DOUBLE) * y::DOUBLE >= (6.524645787924003::DOUBLE)
                                THEN CASE WHEN (0.42273740924759357::DOUBLE) * x::DOUBLE + (0.9062522181063242::DOUBLE) * y::DOUBLE >= (6.68961402493629::DOUBLE)
                                  THEN CASE WHEN (0.8277007753918::DOUBLE) * x::DOUBLE + (-0.5611696948480139::DOUBLE) * y::DOUBLE >= (0.6425877741125552::DOUBLE)
                                    THEN 359
                                    ELSE 345
                                  END
                                  ELSE CASE WHEN (0.6447045754476726::DOUBLE) * x::DOUBLE + (-0.764431821941523::DOUBLE) * y::DOUBLE >= (-1.240245527972614::DOUBLE)
                                    THEN CASE WHEN (0.8247606413332895::DOUBLE) * x::DOUBLE + (0.5654819930886402::DOUBLE) * y::DOUBLE >= (6.63416502476341::DOUBLE)
                                      THEN 359
                                      ELSE 348
                                    END
                                    ELSE CASE WHEN (0.9996024002462649::DOUBLE) * x::DOUBLE + (-0.028196478891983595::DOUBLE) * y::DOUBLE >= (4.239872814958382::DOUBLE)
                                      THEN 359
                                      ELSE 341
                                    END
                                  END
                                END
                                ELSE CASE WHEN (0.9915545860980355::DOUBLE) * x::DOUBLE + (-0.12969002578438263::DOUBLE) * y::DOUBLE >= (3.559720483900667::DOUBLE)
                                  THEN 348
                                  ELSE 331
                                END
                              END
                            END
                            ELSE CASE WHEN (0.36580845957445957::DOUBLE) * x::DOUBLE + (0.930690158379125::DOUBLE) * y::DOUBLE >= (6.30555060903753::DOUBLE)
                              THEN CASE WHEN (0.4918370182665517::DOUBLE) * x::DOUBLE + (-0.8706872845417394::DOUBLE) * y::DOUBLE >= (-2.40463073821561::DOUBLE)
                                THEN 342
                                ELSE 331
                              END
                              ELSE CASE WHEN (0.9964775032618778::DOUBLE) * x::DOUBLE + (0.08386051211967487::DOUBLE) * y::DOUBLE >= (4.604923658961378::DOUBLE)
                                THEN 342
                                ELSE 324
                              END
                            END
                          END
                        END
                      END
                      ELSE CASE WHEN (0.3298285689494204::DOUBLE) * x::DOUBLE + (0.9440408439812217::DOUBLE) * y::DOUBLE >= (5.258887329617429::DOUBLE)
                        THEN CASE WHEN (0.9827206858135998::DOUBLE) * x::DOUBLE + (-0.1850947154136171::DOUBLE) * y::DOUBLE >= (3.2154037632997277::DOUBLE)
                          THEN CASE WHEN (0.2449608994110299::DOUBLE) * x::DOUBLE + (0.9695329585732191::DOUBLE) * y::DOUBLE >= (5.489789281734452::DOUBLE)
                            THEN CASE WHEN (0.08549587293169891::DOUBLE) * x::DOUBLE + (0.9963385246549724::DOUBLE) * y::DOUBLE >= (5.052337952137086::DOUBLE)
                              THEN CASE WHEN (0.9137723231240747::DOUBLE) * x::DOUBLE + (-0.4062267119385819::DOUBLE) * y::DOUBLE >= (2.071968851415225::DOUBLE)
                                THEN 362
                                ELSE 344
                              END
                              ELSE CASE WHEN (0.7782193600283889::DOUBLE) * x::DOUBLE + (0.6279925379150654::DOUBLE) * y::DOUBLE >= (6.339426101572499::DOUBLE)
                                THEN 362
                                ELSE 337
                              END
                            END
                            ELSE CASE WHEN (0.5700859500568436::DOUBLE) * x::DOUBLE + (0.8215850592286753::DOUBLE) * y::DOUBLE >= (5.965899841467551::DOUBLE)
                              THEN CASE WHEN (0.5028778285973854::DOUBLE) * x::DOUBLE + (-0.8643575009827695::DOUBLE) * y::DOUBLE >= (-1.653729450746161::DOUBLE)
                                THEN 350
                                ELSE 337
                              END
                              ELSE CASE WHEN (0.96365436353948::DOUBLE) * x::DOUBLE + (0.2671521432280112::DOUBLE) * y::DOUBLE >= (5.202807346889848::DOUBLE)
                                THEN 350
                                ELSE 319
                              END
                            END
                          END
                          ELSE CASE WHEN (0.49112600736812717::DOUBLE) * x::DOUBLE + (0.8710885402108343::DOUBLE) * y::DOUBLE >= (5.889537313897317::DOUBLE)
                            THEN CASE WHEN (0.7563304604427509::DOUBLE) * x::DOUBLE + (0.6541897542811693::DOUBLE) * y::DOUBLE >= (6.230009650359536::DOUBLE)
                              THEN CASE WHEN (0.5048101760510625::DOUBLE) * x::DOUBLE + (0.8632303783783882::DOUBLE) * y::DOUBLE >= (6.308659487873017::DOUBLE)
                                THEN CASE WHEN (0.6945182377788456::DOUBLE) * x::DOUBLE + (-0.719475098521531::DOUBLE) * y::DOUBLE >= (-0.6457614390146764::DOUBLE)
                                  THEN 344
                                  ELSE 324
                                END
                                ELSE CASE WHEN (0.9989282392385652::DOUBLE) * x::DOUBLE + (0.046285773751120356::DOUBLE) * y::DOUBLE >= (4.357519259702693::DOUBLE)
                                  THEN 344
                                  ELSE 312
                                END
                              END
                              ELSE CASE WHEN (0.9999999904616854::DOUBLE) * x::DOUBLE + (0.00013811817114030395::DOUBLE) * y::DOUBLE >= (3.8784840492485713::DOUBLE)
                                THEN CASE WHEN (0.0808340071508614::DOUBLE) * x::DOUBLE + (-0.9967275772687011::DOUBLE) * y::DOUBLE >= (-4.383169047269113::DOUBLE)
                                  THEN 314
                                  ELSE 312
                                END
                                ELSE CASE WHEN (0.6991815555244726::DOUBLE) * x::DOUBLE + (-0.7149441603470713::DOUBLE) * y::DOUBLE >= (-0.6575428978216298::DOUBLE)
                                  THEN 314
                                  ELSE 297
                                END
                              END
                            END
                            ELSE CASE WHEN (0.003331564391691604::DOUBLE) * x::DOUBLE + (-0.9999944503239525::DOUBLE) * y::DOUBLE >= (-4.354442787478934::DOUBLE)
                              THEN CASE WHEN (0.9998126954927276::DOUBLE) * x::DOUBLE + (0.019353912564811802::DOUBLE) * y::DOUBLE >= (3.8943949740365134::DOUBLE)
                                THEN 319
                                ELSE 282
                              END
                              ELSE CASE WHEN (0.9832770726712288::DOUBLE) * x::DOUBLE + (0.18211589265931466::DOUBLE) * y::DOUBLE >= (4.5677160071599845::DOUBLE)
                                THEN CASE WHEN (0.06837012540882519::DOUBLE) * x::DOUBLE + (-0.99766002523484::DOUBLE) * y::DOUBLE >= (-4.123319711130122::DOUBLE)
                                  THEN 319
                                  ELSE 314
                                END
                                ELSE CASE WHEN (0.8080115550138248::DOUBLE) * x::DOUBLE + (-0.5891666376876246::DOUBLE) * y::DOUBLE >= (0.5060120649840179::DOUBLE)
                                  THEN 319
                                  ELSE 281
                                END
                              END
                            END
                          END
                        END
                        ELSE CASE WHEN (0.20130777158574234::DOUBLE) * x::DOUBLE + (0.9795280399759788::DOUBLE) * y::DOUBLE >= (4.403613617081268::DOUBLE)
                          THEN CASE WHEN (0.9364624639825092::DOUBLE) * x::DOUBLE + (0.35076780575162186::DOUBLE) * y::DOUBLE >= (4.715021715666199::DOUBLE)
                            THEN CASE WHEN (0.7160373087190347::DOUBLE) * x::DOUBLE + (-0.698062011946218::DOUBLE) * y::DOUBLE >= (0.1055308572899567::DOUBLE)
                              THEN CASE WHEN (0.09229124796014368::DOUBLE) * x::DOUBLE + (0.995732055098137::DOUBLE) * y::DOUBLE >= (4.319971117132868::DOUBLE)
                                THEN CASE WHEN (0.49808446668771234::DOUBLE) * x::DOUBLE + (-0.8671285164520984::DOUBLE) * y::DOUBLE >= (-1.3953147042917728::DOUBLE)
                                  THEN 339
                                  ELSE 319
                                END
                                ELSE CASE WHEN (0.9821591472165327::DOUBLE) * x::DOUBLE + (0.1880516140289499::DOUBLE) * y::DOUBLE >= (4.762981572503109::DOUBLE)
                                  THEN 339
                                  ELSE 313
                                END
                              END
                              ELSE CASE WHEN (0.5308856812385033::DOUBLE) * x::DOUBLE + (-0.8474434455796623::DOUBLE) * y::DOUBLE >= (-1.4909602008945118::DOUBLE)
                                THEN CASE WHEN (0.6756105653510013::DOUBLE) * x::DOUBLE + (0.7372586818655311::DOUBLE) * y::DOUBLE >= (5.636335069872068::DOUBLE)
                                  THEN 319
                                  ELSE 296
                                END
                                ELSE CASE WHEN (0.9998126954927276::DOUBLE) * x::DOUBLE + (0.019353912564811802::DOUBLE) * y::DOUBLE >= (3.8943949740365134::DOUBLE)
                                  THEN 319
                                  ELSE 282
                                END
                              END
                            END
                            ELSE CASE WHEN (0.5097718943937587::DOUBLE) * x::DOUBLE + (-0.8603096045530344::DOUBLE) * y::DOUBLE >= (-1.6867083533655478::DOUBLE)
                              THEN CASE WHEN (0.42172480661916784::DOUBLE) * x::DOUBLE + (0.9067238760957084::DOUBLE) * y::DOUBLE >= (5.103185604355777::DOUBLE)
                                THEN 282
                                ELSE 262
                              END
                              ELSE CASE WHEN (0.9332348798397088::DOUBLE) * x::DOUBLE + (0.3592668354448605::DOUBLE) * y::DOUBLE >= (4.678708871118954::DOUBLE)
                                THEN 282
                                ELSE 249
                              END
                            END
                          END
                          ELSE CASE WHEN (0.6287284451558489::DOUBLE) * x::DOUBLE + (0.7776249367477285::DOUBLE) * y::DOUBLE >= (4.887179513556612::DOUBLE)
                            THEN CASE WHEN (0.13301626352543866::DOUBLE) * x::DOUBLE + (-0.9911138550326754::DOUBLE) * y::DOUBLE >= (-2.9663750271824183::DOUBLE)
                              THEN CASE WHEN (0.21298357747355517::DOUBLE) * x::DOUBLE + (-0.9770557792299096::DOUBLE) * y::DOUBLE >= (-2.4818023543812573::DOUBLE)
                                THEN CASE WHEN (0.8536089338695019::DOUBLE) * x::DOUBLE + (0.5209143768587812::DOUBLE) * y::DOUBLE >= (5.026140953712914::DOUBLE)
                                  THEN 321
                                  ELSE 295
                                END
                                ELSE CASE WHEN (0.8794078820692237::DOUBLE) * x::DOUBLE + (-0.4760690884257477::DOUBLE) * y::DOUBLE >= (1.7604136124027576::DOUBLE)
                                  THEN 321
                                  ELSE 286
                                END
                              END
                              ELSE CASE WHEN (0.7272395822962476::DOUBLE) * x::DOUBLE + (-0.6863837046008444::DOUBLE) * y::DOUBLE >= (0.06661151410078014::DOUBLE)
                                THEN CASE WHEN (0.8385185387266632::DOUBLE) * x::DOUBLE + (0.5448730679816186::DOUBLE) * y::DOUBLE >= (5.191533159158065::DOUBLE)
                                  THEN 313
                                  ELSE 286
                                END
                                ELSE 262
                              END
                            END
                            ELSE CASE WHEN (0.4547501137449851::DOUBLE) * x::DOUBLE + (-0.8906190734814313::DOUBLE) * y::DOUBLE >= (-1.1300611345837972::DOUBLE)
                              THEN CASE WHEN (0.41918042111450204::DOUBLE) * x::DOUBLE + (0.9079029543702724::DOUBLE) * y::DOUBLE >= (4.316010320244395::DOUBLE)
                                THEN 295
                                ELSE 284
                              END
                              ELSE CASE WHEN (0.9655240526848914::DOUBLE) * x::DOUBLE + (-0.2603138561178468::DOUBLE) * y::DOUBLE >= (2.6539769064212395::DOUBLE)
                                THEN 295
                                ELSE 264
                              END
                            END
                          END
                        END
                      END
                    END
                    ELSE CASE WHEN (0.9878736743756248::DOUBLE) * x::DOUBLE + (0.15525979349336338::DOUBLE) * y::DOUBLE >= (4.471027794991462::DOUBLE)
                      THEN CASE WHEN (0.9987857629146527::DOUBLE) * x::DOUBLE + (-0.04926458970696186::DOUBLE) * y::DOUBLE >= (3.6445912697919938::DOUBLE)
                        THEN CASE WHEN (0.9872350312564181::DOUBLE) * x::DOUBLE + (-0.15927018886200664::DOUBLE) * y::DOUBLE >= (3.210925240643975::DOUBLE)
                          THEN CASE WHEN (0.30035730232927255::DOUBLE) * x::DOUBLE + (0.9538267614915623::DOUBLE) * y::DOUBLE >= (6.480254461879306::DOUBLE)
                            THEN CASE WHEN (0.7662742656978342::DOUBLE) * x::DOUBLE + (-0.6425136183220128::DOUBLE) * y::DOUBLE >= (-0.2674478472591715::DOUBLE)
                              THEN CASE WHEN (0.0009054262340693274::DOUBLE) * x::DOUBLE + (0.9999995901015833::DOUBLE) * y::DOUBLE >= (5.514621442217137::DOUBLE)
                                THEN CASE WHEN (0.8373057118767767::DOUBLE) * x::DOUBLE + (-0.5467349859470529::DOUBLE) * y::DOUBLE >= (0.6398563469241787::DOUBLE)
                                  THEN 357
                                  ELSE 346
                                END
                                ELSE CASE WHEN (0.783762583198034::DOUBLE) * x::DOUBLE + (0.6210605551624937::DOUBLE) * y::DOUBLE >= (6.841615476336787::DOUBLE)
                                  THEN 357
                                  ELSE 345
                                END
                              END
                              ELSE CASE WHEN (0.9692108173668165::DOUBLE) * x::DOUBLE + (0.24623239327746343::DOUBLE) * y::DOUBLE >= (5.497097085569639::DOUBLE)
                                THEN 346
                                ELSE 330
                              END
                            END
                            ELSE CASE WHEN (0.8107297547655001::DOUBLE) * x::DOUBLE + (0.5854205879005896::DOUBLE) * y::DOUBLE >= (6.524645787924003::DOUBLE)
                              THEN CASE WHEN (0.8456060374234233::DOUBLE) * x::DOUBLE + (-0.5338074835303976::DOUBLE) * y::DOUBLE >= (0.6932794042403301::DOUBLE)
                                THEN CASE WHEN (0.42273740924759357::DOUBLE) * x::DOUBLE + (0.9062522181063242::DOUBLE) * y::DOUBLE >= (6.68961402493629::DOUBLE)
                                  THEN 345
                                  ELSE 341
                                END
                                ELSE CASE WHEN (0.9989195250008019::DOUBLE) * x::DOUBLE + (0.04647346094463028::DOUBLE) * y::DOUBLE >= (4.479856048801563::DOUBLE)
                                  THEN 345
                                  ELSE 328
                                END
                              END
                              ELSE CASE WHEN (0.36580845957445957::DOUBLE) * x::DOUBLE + (0.930690158379125::DOUBLE) * y::DOUBLE >= (6.30555060903753::DOUBLE)
                                THEN CASE WHEN (0.2912924090334283::DOUBLE) * x::DOUBLE + (-0.9566340640179515::DOUBLE) * y::DOUBLE >= (-3.8882605340277845::DOUBLE)
                                  THEN 331
                                  ELSE 328
                                END
                                ELSE 324
                              END
                            END
                          END
                          ELSE CASE WHEN (0.619295982802646::DOUBLE) * x::DOUBLE + (0.7851576183700346::DOUBLE) * y::DOUBLE >= (6.71927351580777::DOUBLE)
                            THEN CASE WHEN (0.9946665287306997::DOUBLE) * x::DOUBLE + (-0.10314308810007565::DOUBLE) * y::DOUBLE >= (3.427692737318398::DOUBLE)
                              THEN CASE WHEN (0.695051467215467::DOUBLE) * x::DOUBLE + (-0.7189599835328992::DOUBLE) * y::DOUBLE >= (-1.1086502058639067::DOUBLE)
                                THEN CASE WHEN (0.30035730232927255::DOUBLE) * x::DOUBLE + (0.9538267614915623::DOUBLE) * y::DOUBLE >= (6.480254461879306::DOUBLE)
                                  THEN 330
                                  ELSE 328
                                END
                                ELSE CASE WHEN (0.9950167564151656::DOUBLE) * x::DOUBLE + (0.09970784549393735::DOUBLE) * y::DOUBLE >= (4.62614210055767::DOUBLE)
                                  THEN 330
                                  ELSE 315
                                END
                              END
                              ELSE CASE WHEN (0.7801882735450248::DOUBLE) * x::DOUBLE + (0.6255447688397956::DOUBLE) * y::DOUBLE >= (6.515046779467317::DOUBLE)
                                THEN CASE WHEN (0.608227212959541::DOUBLE) * x::DOUBLE + (-0.7937629730690826::DOUBLE) * y::DOUBLE >= (-2.04578706728268::DOUBLE)
                                  THEN 315
                                  ELSE 307
                                END
                                ELSE 306
                              END
                            END
                            ELSE CASE WHEN (0.6356800898860228::DOUBLE) * x::DOUBLE + (0.7719526043239299::DOUBLE) * y::DOUBLE >= (6.535773314209004::DOUBLE)
                              THEN CASE WHEN (0.6175677023442031::DOUBLE) * x::DOUBLE + (-0.786517725815065::DOUBLE) * y::DOUBLE >= (-1.7719268796658945::DOUBLE)
                                THEN CASE WHEN (0.35813832855229966::DOUBLE) * x::DOUBLE + (-0.9336685373416869::DOUBLE) * y::DOUBLE >= (-3.3626433998239618::DOUBLE)
                                  THEN 324
                                  ELSE 316
                                END
                                ELSE 306
                              END
                              ELSE CASE WHEN (0.25355800761972797::DOUBLE) * x::DOUBLE + (-0.9673201831720011::DOUBLE) * y::DOUBLE >= (-3.824081617111596::DOUBLE)
                                THEN CASE WHEN (0.5048101760510625::DOUBLE) * x::DOUBLE + (0.8632303783783882::DOUBLE) * y::DOUBLE >= (6.308659487873017::DOUBLE)
                                  THEN 324
                                  ELSE 312
                                END
                                ELSE CASE WHEN (0.9141480080433652::DOUBLE) * x::DOUBLE + (-0.4053805858577192::DOUBLE) * y::DOUBLE >= (1.5977407744627672::DOUBLE)
                                  THEN 324
                                  ELSE 308
                                END
                              END
                            END
                          END
                        END
                        ELSE CASE WHEN (0.4827708079988938::DOUBLE) * x::DOUBLE + (-0.875746736759033::DOUBLE) * y::DOUBLE >= (-2.8899290824672295::DOUBLE)
                          THEN CASE WHEN (0.2249412309533449::DOUBLE) * x::DOUBLE + (0.9743723326414775::DOUBLE) * y::DOUBLE >= (5.891345612179258::DOUBLE)
                            THEN CASE WHEN (0.6356800898860228::DOUBLE) * x::DOUBLE + (0.7719526043239299::DOUBLE) * y::DOUBLE >= (6.535773314209004::DOUBLE)
                              THEN CASE WHEN (0.5659047060939442::DOUBLE) * x::DOUBLE + (0.8244706566159445::DOUBLE) * y::DOUBLE >= (6.593355373770786::DOUBLE)
                                THEN CASE WHEN (0.6175677023442031::DOUBLE) * x::DOUBLE + (-0.786517725815065::DOUBLE) * y::DOUBLE >= (-1.7719268796658945::DOUBLE)
                                  THEN 316
                                  ELSE 306
                                END
                                ELSE CASE WHEN (0.9972815327637657::DOUBLE) * x::DOUBLE + (-0.07368544230954945::DOUBLE) * y::DOUBLE >= (3.5009727530489307::DOUBLE)
                                  THEN 316
                                  ELSE 299
                                END
                              END
                              ELSE CASE WHEN (0.9436369629938147::DOUBLE) * x::DOUBLE + (0.3309822987288144::DOUBLE) * y::DOUBLE >= (5.246918480266868::DOUBLE)
                                THEN CASE WHEN (0.6239046053633803::DOUBLE) * x::DOUBLE + (-0.7815005076174709::DOUBLE) * y::DOUBLE >= (-1.6750136794003936::DOUBLE)
                                  THEN 308
                                  ELSE 299
                                END
                                ELSE 285
                              END
                            END
                            ELSE CASE WHEN (0.17391424783643403::DOUBLE) * x::DOUBLE + (-0.984760800600576::DOUBLE) * y::DOUBLE >= (-4.225756451608669::DOUBLE)
                              THEN CASE WHEN (0.41194537313177565::DOUBLE) * x::DOUBLE + (0.9112085433946074::DOUBLE) * y::DOUBLE >= (6.125908908254396::DOUBLE)
                                THEN CASE WHEN (0.25355800761972797::DOUBLE) * x::DOUBLE + (-0.9673201831720011::DOUBLE) * y::DOUBLE >= (-3.824081617111596::DOUBLE)
                                  THEN 312
                                  ELSE 308
                                END
                                ELSE CASE WHEN (0.9999999904616854::DOUBLE) * x::DOUBLE + (0.00013811817114030395::DOUBLE) * y::DOUBLE >= (3.8784840492485713::DOUBLE)
                                  THEN 312
                                  ELSE 297
                                END
                              END
                              ELSE CASE WHEN (0.4514859313067683::DOUBLE) * x::DOUBLE + (-0.8922782379011943::DOUBLE) * y::DOUBLE >= (-2.9343014777600236::DOUBLE)
                                THEN CASE WHEN (0.933342870007111::DOUBLE) * x::DOUBLE + (0.35898619333741644::DOUBLE) * y::DOUBLE >= (5.3957140982376135::DOUBLE)
                                  THEN 308
                                  ELSE 293
                                END
                                ELSE 285
                              END
                            END
                          END
                          ELSE CASE WHEN (0.9997385913987149::DOUBLE) * x::DOUBLE + (0.022863701977446586::DOUBLE) * y::DOUBLE >= (3.91747243224645::DOUBLE)
                            THEN CASE WHEN (0.4465349668879988::DOUBLE) * x::DOUBLE + (-0.8947661836180074::DOUBLE) * y::DOUBLE >= (-3.251758374084658::DOUBLE)
                              THEN CASE WHEN (0.0739109123909778::DOUBLE) * x::DOUBLE + (0.9972648479864981::DOUBLE) * y::DOUBLE >= (5.83257282997142::DOUBLE)
                                THEN CASE WHEN (0.608227212959541::DOUBLE) * x::DOUBLE + (-0.7937629730690826::DOUBLE) * y::DOUBLE >= (-2.04578706728268::DOUBLE)
                                  THEN 315
                                  ELSE 307
                                END
                                ELSE CASE WHEN (0.7801882735450248::DOUBLE) * x::DOUBLE + (0.6255447688397956::DOUBLE) * y::DOUBLE >= (6.515046779467317::DOUBLE)
                                  THEN 315
                                  ELSE 306
                                END
                              END
                              ELSE CASE WHEN (0.9796443081203915::DOUBLE) * x::DOUBLE + (0.20074120047294655::DOUBLE) * y::DOUBLE >= (4.9013316977929::DOUBLE)
                                THEN 307
                                ELSE 298
                              END
                            END
                            ELSE CASE WHEN (0.84274965646::DOUBLE) * x::DOUBLE + (-0.5383056906039094::DOUBLE) * y::DOUBLE >= (0.12472786609861997::DOUBLE)
                              THEN CASE WHEN (0.28276955025446954::DOUBLE) * x::DOUBLE + (0.9591878759913957::DOUBLE) * y::DOUBLE >= (6.159422092799227::DOUBLE)
                                THEN CASE WHEN (0.3383385150304331::DOUBLE) * x::DOUBLE + (0.9410244679321582::DOUBLE) * y::DOUBLE >= (6.48373380909306::DOUBLE)
                                  THEN 298
                                  ELSE 290
                                END
                                ELSE 285
                              END
                              ELSE CASE WHEN (0.10462465474826624::DOUBLE) * x::DOUBLE + (0.9945117805329438::DOUBLE) * y::DOUBLE >= (5.937243892544673::DOUBLE)
                                THEN CASE WHEN (0.9938331881382664::DOUBLE) * x::DOUBLE + (-0.11088550020146605::DOUBLE) * y::DOUBLE >= (3.0409421392489633::DOUBLE)
                                  THEN 298
                                  ELSE 283
                                END
                                ELSE CASE WHEN (0.8034626937553251::DOUBLE) * x::DOUBLE + (0.5953551039030711::DOUBLE) * y::DOUBLE >= (6.282515448994177::DOUBLE)
                                  THEN 298
                                  ELSE 280
                                END
                              END
                            END
                          END
                        END
                      END
                      ELSE CASE WHEN (0.44768514217101724::DOUBLE) * x::DOUBLE + (-0.8941912622472421::DOUBLE) * y::DOUBLE >= (-3.21885673157081::DOUBLE)
                        THEN CASE WHEN (0.5354004168210399::DOUBLE) * x::DOUBLE + (0.8445983623402644::DOUBLE) * y::DOUBLE >= (6.011344335477466::DOUBLE)
                          THEN CASE WHEN (0.24170118029204077::DOUBLE) * x::DOUBLE + (-0.9703507301205242::DOUBLE) * y::DOUBLE >= (-4.196005388573118::DOUBLE)
                            THEN CASE WHEN (0.9506966089381189::DOUBLE) * x::DOUBLE + (-0.3101224883067355::DOUBLE) * y::DOUBLE >= (1.7007857554541002::DOUBLE)
                              THEN CASE WHEN (0.0995701140240036::DOUBLE) * x::DOUBLE + (0.9950305484723808::DOUBLE) * y::DOUBLE >= (5.3468209426477955::DOUBLE)
                                THEN CASE WHEN (0.6432073592468059::DOUBLE) * x::DOUBLE + (0.765692035358048::DOUBLE) * y::DOUBLE >= (6.280182241227389::DOUBLE)
                                  THEN CASE WHEN (0.4514859313067683::DOUBLE) * x::DOUBLE + (-0.8922782379011943::DOUBLE) * y::DOUBLE >= (-2.9343014777600236::DOUBLE)
                                    THEN 293
                                    ELSE 285
                                  END
                                  ELSE CASE WHEN (0.9589045238826706::DOUBLE) * x::DOUBLE + (-0.2837289447295588::DOUBLE) * y::DOUBLE >= (2.043189857180054::DOUBLE)
                                    THEN 293
                                    ELSE 278
                                  END
                                END
                                ELSE CASE WHEN (0.8058806834666388::DOUBLE) * x::DOUBLE + (0.5920779712295866::DOUBLE) * y::DOUBLE >= (5.879668746151347::DOUBLE)
                                  THEN CASE WHEN (0.17391424783643403::DOUBLE) * x::DOUBLE + (-0.984760800600576::DOUBLE) * y::DOUBLE >= (-4.225756451608669::DOUBLE)
                                    THEN 297
                                    ELSE 293
                                  END
                                  ELSE CASE WHEN (0.9548808869646138::DOUBLE) * x::DOUBLE + (-0.29698904308016516::DOUBLE) * y::DOUBLE >= (2.0351581336943956::DOUBLE)
                                    THEN 297
                                    ELSE 274
                                  END
                                END
                              END
                              ELSE CASE WHEN (0.9341280525113145::DOUBLE) * x::DOUBLE + (0.35693806397107447::DOUBLE) * y::DOUBLE >= (4.939011928521289::DOUBLE)
                                THEN CASE WHEN (0.4597065557004432::DOUBLE) * x::DOUBLE + (-0.8880708770396849::DOUBLE) * y::DOUBLE >= (-2.89051740472791::DOUBLE)
                                  THEN 274
                                  ELSE 261
                                END
                                ELSE CASE WHEN (0.8037155087582489::DOUBLE) * x::DOUBLE + (-0.5950137653714149::DOUBLE) * y::DOUBLE >= (-0.263221186982872::DOUBLE)
                                  THEN 274
                                  ELSE 250
                                END
                              END
                            END
                            ELSE CASE WHEN (0.8187622433845898::DOUBLE) * x::DOUBLE + (0.5741327275185016::DOUBLE) * y::DOUBLE >= (5.876212248840594::DOUBLE)
                              THEN CASE WHEN (0.9815511902754542::DOUBLE) * x::DOUBLE + (0.19119953156019823::DOUBLE) * y::DOUBLE >= (4.572765448690848::DOUBLE)
                                THEN CASE WHEN (0.28276955025446954::DOUBLE) * x::DOUBLE + (0.9591878759913957::DOUBLE) * y::DOUBLE >= (6.159422092799227::DOUBLE)
                                  THEN 290
                                  ELSE 285
                                END
                                ELSE CASE WHEN (0.007922319241301328::DOUBLE) * x::DOUBLE + (-0.9999686179365025::DOUBLE) * y::DOUBLE >= (-5.311826023222232::DOUBLE)
                                  THEN CASE WHEN (0.9596567678950989::DOUBLE) * x::DOUBLE + (-0.2811741236905208::DOUBLE) * y::DOUBLE >= (1.9515862846425345::DOUBLE)
                                    THEN 285
                                    ELSE 272
                                  END
                                  ELSE CASE WHEN (0.6631681498494583::DOUBLE) * x::DOUBLE + (-0.7484704436550893::DOUBLE) * y::DOUBLE >= (-1.6108849707171178::DOUBLE)
                                    THEN 285
                                    ELSE 271
                                  END
                                END
                              END
                              ELSE CASE WHEN (0.30549876075447985::DOUBLE) * x::DOUBLE + (0.9521924738084613::DOUBLE) * y::DOUBLE >= (5.994330067683363::DOUBLE)
                                THEN CASE WHEN (0.32373270517627967::DOUBLE) * x::DOUBLE + (-0.9461485800862611::DOUBLE) * y::DOUBLE >= (-3.8959581980519644::DOUBLE)
                                  THEN CASE WHEN (0.7279389587442512::DOUBLE) * x::DOUBLE + (0.685641941790564::DOUBLE) * y::DOUBLE >= (6.094702252709848::DOUBLE)
                                    THEN 272
                                    ELSE 261
                                  END
                                  ELSE CASE WHEN (0.9140611811756328::DOUBLE) * x::DOUBLE + (-0.4055763270554715::DOUBLE) * y::DOUBLE >= (0.9649816004771781::DOUBLE)
                                    THEN 272
                                    ELSE 255
                                  END
                                END
                                ELSE CASE WHEN (0.9341280525113145::DOUBLE) * x::DOUBLE + (0.35693806397107447::DOUBLE) * y::DOUBLE >= (4.939011928521289::DOUBLE)
                                  THEN 261
                                  ELSE 250
                                END
                              END
                            END
                          END
                          ELSE CASE WHEN (0.5383860741735048::DOUBLE) * x::DOUBLE + (0.8426983061191244::DOUBLE) * y::DOUBLE >= (5.685790557099471::DOUBLE)
                            THEN CASE WHEN (0.6964686785396426::DOUBLE) * x::DOUBLE + (-0.717587193178114::DOUBLE) * y::DOUBLE >= (-1.164479046744204::DOUBLE)
                              THEN CASE WHEN (0.6803799704314059::DOUBLE) * x::DOUBLE + (0.732859533495853::DOUBLE) * y::DOUBLE >= (5.873423389633055::DOUBLE)
                                THEN CASE WHEN (0.18279599594830584::DOUBLE) * x::DOUBLE + (-0.9831508652619225::DOUBLE) * y::DOUBLE >= (-3.991815061984828::DOUBLE)
                                  THEN CASE WHEN (0.49112600736812717::DOUBLE) * x::DOUBLE + (0.8710885402108343::DOUBLE) * y::DOUBLE >= (5.889537313897317::DOUBLE)
                                    THEN 297
                                    ELSE 281
                                  END
                                  ELSE CASE WHEN (0.9548808869646138::DOUBLE) * x::DOUBLE + (-0.29698904308016516::DOUBLE) * y::DOUBLE >= (2.0351581336943956::DOUBLE)
                                    THEN 297
                                    ELSE 274
                                  END
                                END
                                ELSE CASE WHEN (0.7743071297427424::DOUBLE) * x::DOUBLE + (-0.6328099784528969::DOUBLE) * y::DOUBLE >= (-0.23922905291833363::DOUBLE)
                                  THEN 281
                                  ELSE 257
                                END
                              END
                              ELSE CASE WHEN (0.18408542764262792::DOUBLE) * x::DOUBLE + (0.9829102478505505::DOUBLE) * y::DOUBLE >= (5.508267947581007::DOUBLE)
                                THEN CASE WHEN (0.8037155087582489::DOUBLE) * x::DOUBLE + (-0.5950137653714149::DOUBLE) * y::DOUBLE >= (-0.263221186982872::DOUBLE)
                                  THEN 274
                                  ELSE 250
                                END
                                ELSE CASE WHEN (0.9934999061320897::DOUBLE) * x::DOUBLE + (0.11383293247355505::DOUBLE) * y::DOUBLE >= (3.900567581056625::DOUBLE)
                                  THEN 274
                                  ELSE 247
                                END
                              END
                            END
                            ELSE CASE WHEN (0.003331564391691604::DOUBLE) * x::DOUBLE + (-0.9999944503239525::DOUBLE) * y::DOUBLE >= (-4.354442787478934::DOUBLE)
                              THEN CASE WHEN (0.3759476774172172::DOUBLE) * x::DOUBLE + (-0.9266408926032782::DOUBLE) * y::DOUBLE >= (-2.685168822758526::DOUBLE)
                                THEN CASE WHEN (0.9332348798397088::DOUBLE) * x::DOUBLE + (0.3592668354448605::DOUBLE) * y::DOUBLE >= (4.678708871118954::DOUBLE)
                                  THEN 282
                                  ELSE 249
                                END
                                ELSE CASE WHEN (0.9701485458396802::DOUBLE) * x::DOUBLE + (-0.24251144097785107::DOUBLE) * y::DOUBLE >= (2.23625438030839::DOUBLE)
                                  THEN 282
                                  ELSE 242
                                END
                              END
                              ELSE CASE WHEN (0.4522703528531605::DOUBLE) * x::DOUBLE + (0.8918808933540833::DOUBLE) * y::DOUBLE >= (5.503130990758667::DOUBLE)
                                THEN CASE WHEN (0.7743071297427424::DOUBLE) * x::DOUBLE + (-0.6328099784528969::DOUBLE) * y::DOUBLE >= (-0.23922905291833363::DOUBLE)
                                  THEN 281
                                  ELSE 257
                                END
                                ELSE CASE WHEN (0.9076280574166355::DOUBLE) * x::DOUBLE + (0.4197753082186999::DOUBLE) * y::DOUBLE >= (4.91530995977371::DOUBLE)
                                  THEN 281
                                  ELSE 242
                                END
                              END
                            END
                          END
                        END
                        ELSE CASE WHEN (0.8653781368849973::DOUBLE) * x::DOUBLE + (0.5011194270844535::DOUBLE) * y::DOUBLE >= (5.556711636629453::DOUBLE)
                          THEN CASE WHEN (0.8660181126887686::DOUBLE) * x::DOUBLE + (0.5000126283355083::DOUBLE) * y::DOUBLE >= (5.711489791953763::DOUBLE)
                            THEN CASE WHEN (0.09811606506110075::DOUBLE) * x::DOUBLE + (-0.9951749784720905::DOUBLE) * y::DOUBLE >= (-5.135376885909187::DOUBLE)
                              THEN CASE WHEN (0.570525411196743::DOUBLE) * x::DOUBLE + (-0.8212799493344441::DOUBLE) * y::DOUBLE >= (-2.5613962405762543::DOUBLE)
                                THEN CASE WHEN (0.5861507651527168::DOUBLE) * x::DOUBLE + (0.8102019998191098::DOUBLE) * y::DOUBLE >= (6.497238591472611::DOUBLE)
                                  THEN CASE WHEN (0.84274965646::DOUBLE) * x::DOUBLE + (-0.5383056906039094::DOUBLE) * y::DOUBLE >= (0.12472786609861997::DOUBLE)
                                    THEN 290
                                    ELSE 280
                                  END
                                  ELSE CASE WHEN (0.9815511902754542::DOUBLE) * x::DOUBLE + (0.19119953156019823::DOUBLE) * y::DOUBLE >= (4.572765448690848::DOUBLE)
                                    THEN 290
                                    ELSE 271
                                  END
                                END
                                ELSE 258
                              END
                              ELSE CASE WHEN (0.9995971197247895::DOUBLE) * x::DOUBLE + (0.028383062518073193::DOUBLE) * y::DOUBLE >= (3.5794888448951436::DOUBLE)
                                THEN CASE WHEN (0.7098493834697712::DOUBLE) * x::DOUBLE + (-0.7043534998760108::DOUBLE) * y::DOUBLE >= (-1.4074023310029564::DOUBLE)
                                  THEN CASE WHEN (0.10462465474826624::DOUBLE) * x::DOUBLE + (0.9945117805329438::DOUBLE) * y::DOUBLE >= (5.937243892544673::DOUBLE)
                                    THEN 283
                                    ELSE 280
                                  END
                                  ELSE CASE WHEN (0.8878386317730407::DOUBLE) * x::DOUBLE + (0.46015493470283997::DOUBLE) * y::DOUBLE >= (5.742710729500391::DOUBLE)
                                    THEN 283
                                    ELSE 268
                                  END
                                END
                                ELSE 258
                              END
                            END
                            ELSE CASE WHEN (0.3056520916209198::DOUBLE) * x::DOUBLE + (-0.952143265946757::DOUBLE) * y::DOUBLE >= (-4.166589933668052::DOUBLE)
                              THEN CASE WHEN (0.9786852574829142::DOUBLE) * x::DOUBLE + (0.2053659338488297::DOUBLE) * y::DOUBLE >= (4.448198312463556::DOUBLE)
                                THEN CASE WHEN (0.007922319241301328::DOUBLE) * x::DOUBLE + (-0.9999686179365025::DOUBLE) * y::DOUBLE >= (-5.311826023222232::DOUBLE)
                                  THEN 272
                                  ELSE 271
                                END
                                ELSE CASE WHEN (0.9140611811756328::DOUBLE) * x::DOUBLE + (-0.4055763270554715::DOUBLE) * y::DOUBLE >= (0.9649816004771781::DOUBLE)
                                  THEN 272
                                  ELSE 255
                                END
                              END
                              ELSE CASE WHEN (0.6827188188569006::DOUBLE) * x::DOUBLE + (-0.7306811988676312::DOUBLE) * y::DOUBLE >= (-1.8717402374469736::DOUBLE)
                                THEN CASE WHEN (0.6416358199450987::DOUBLE) * x::DOUBLE + (0.7670094357720647::DOUBLE) * y::DOUBLE >= (6.394209713852687::DOUBLE)
                                  THEN CASE WHEN (0.570525411196743::DOUBLE) * x::DOUBLE + (-0.8212799493344441::DOUBLE) * y::DOUBLE >= (-2.5613962405762543::DOUBLE)
                                    THEN 271
                                    ELSE 258
                                  END
                                  ELSE CASE WHEN (0.8930984901851889::DOUBLE) * x::DOUBLE + (-0.44986118617739873::DOUBLE) * y::DOUBLE >= (0.5753864402755808::DOUBLE)
                                    THEN 271
                                    ELSE 251
                                  END
                                END
                                ELSE CASE WHEN (0.9918002946390864::DOUBLE) * x::DOUBLE + (-0.12779740041887253::DOUBLE) * y::DOUBLE >= (2.517497802241567::DOUBLE)
                                  THEN 258
                                  ELSE 243
                                END
                              END
                            END
                          END
                          ELSE CASE WHEN (0.45912327091568067::DOUBLE) * x::DOUBLE + (0.8883725694232609::DOUBLE) * y::DOUBLE >= (6.226626257191887::DOUBLE)
                            THEN CASE WHEN (0.7190024608484169::DOUBLE) * x::DOUBLE + (-0.6950075260699847::DOUBLE) * y::DOUBLE >= (-1.5925313492186848::DOUBLE)
                              THEN CASE WHEN (0.13464106130906742::DOUBLE) * x::DOUBLE + (0.9908944366629414::DOUBLE) * y::DOUBLE >= (5.913452791137302::DOUBLE)
                                THEN CASE WHEN (0.22991387574417155::DOUBLE) * x::DOUBLE + (-0.9732109790483735::DOUBLE) * y::DOUBLE >= (-4.669939934067231::DOUBLE)
                                  THEN 246
                                  ELSE 243
                                END
                                ELSE CASE WHEN (0.9402671375677695::DOUBLE) * x::DOUBLE + (0.3404375273234626::DOUBLE) * y::DOUBLE >= (4.84088306555414::DOUBLE)
                                  THEN CASE WHEN (0.7503251295432831::DOUBLE) * x::DOUBLE + (-0.6610689827664398::DOUBLE) * y::DOUBLE >= (-1.1290309448599825::DOUBLE)
                                    THEN 255
                                    ELSE 246
                                  END
                                  ELSE CASE WHEN (0.9104023879788407::DOUBLE) * x::DOUBLE + (-0.41372393206391195::DOUBLE) * y::DOUBLE >= (0.7087136915904559::DOUBLE)
                                    THEN 255
                                    ELSE 241
                                  END
                                END
                              END
                              ELSE CASE WHEN (0.7806575959667182::DOUBLE) * x::DOUBLE + (0.6249589729409954::DOUBLE) * y::DOUBLE >= (5.915043583766916::DOUBLE)
                                THEN 243
                                ELSE 228
                              END
                            END
                            ELSE CASE WHEN (0.3077402045523098::DOUBLE) * x::DOUBLE + (0.9514704233459401::DOUBLE) * y::DOUBLE >= (5.963253427103243::DOUBLE)
                              THEN CASE WHEN (0.5638414548154919::DOUBLE) * x::DOUBLE + (-0.8258830509409608::DOUBLE) * y::DOUBLE >= (-2.536053984150608::DOUBLE)
                                THEN CASE WHEN (0.30549876075447985::DOUBLE) * x::DOUBLE + (0.9521924738084613::DOUBLE) * y::DOUBLE >= (5.994330067683363::DOUBLE)
                                  THEN 255
                                  ELSE 250
                                END
                                ELSE CASE WHEN (0.9992277346709854::DOUBLE) * x::DOUBLE + (0.03929292893499789::DOUBLE) * y::DOUBLE >= (3.4175374883774006::DOUBLE)
                                  THEN 255
                                  ELSE 237
                                END
                              END
                              ELSE CASE WHEN (0.9334178088999646::DOUBLE) * x::DOUBLE + (-0.3587912959206079::DOUBLE) * y::DOUBLE >= (1.085614058155125::DOUBLE)
                                THEN 250
                                ELSE 227
                              END
                            END
                          END
                        END
                      END
                    END
                  END
                END
              END
              ELSE CASE WHEN (0.507435005060074::DOUBLE) * x::DOUBLE + (0.8616900345482027::DOUBLE) * y::DOUBLE >= (4.492098657876405::DOUBLE)
                THEN CASE WHEN (0.9907743418780447::DOUBLE) * x::DOUBLE + (-0.13552196676600972::DOUBLE) * y::DOUBLE >= (1.330041270127746::DOUBLE)
                  THEN CASE WHEN (0.3968089999284235::DOUBLE) * x::DOUBLE + (0.9179012025135408::DOUBLE) * y::DOUBLE >= (5.830034560674692::DOUBLE)
                    THEN CASE WHEN (0.366540277550063::DOUBLE) * x::DOUBLE + (0.9304021845059925::DOUBLE) * y::DOUBLE >= (6.307257454898049::DOUBLE)
                      THEN CASE WHEN (0.8058113568558268::DOUBLE) * x::DOUBLE + (-0.5921723204964678::DOUBLE) * y::DOUBLE >= (-1.5690207417216366::DOUBLE)
                        THEN CASE WHEN (0.82239224791625::DOUBLE) * x::DOUBLE + (-0.5689209000970671::DOUBLE) * y::DOUBLE >= (-1.065975338180642::DOUBLE)
                          THEN CASE WHEN (0.22706853552290387::DOUBLE) * x::DOUBLE + (0.973878781047972::DOUBLE) * y::DOUBLE >= (6.28565646183417::DOUBLE)
                            THEN CASE WHEN (0.9994729571933023::DOUBLE) * x::DOUBLE + (-0.03246240655397217::DOUBLE) * y::DOUBLE >= (2.74293802502069::DOUBLE)
                              THEN CASE WHEN (0.18933571190533283::DOUBLE) * x::DOUBLE + (0.9819124137097467::DOUBLE) * y::DOUBLE >= (6.636926262444827::DOUBLE)
                                THEN 239
                                ELSE CASE WHEN (0.28425168516717986::DOUBLE) * x::DOUBLE + (0.9587496959476014::DOUBLE) * y::DOUBLE >= (6.4610795069746105::DOUBLE)
                                  THEN CASE WHEN (0.3887105057753889::DOUBLE) * x::DOUBLE + (-0.921359941987843::DOUBLE) * y::DOUBLE >= (-4.221556015339273::DOUBLE)
                                    THEN 240
                                    ELSE 226
                                  END
                                  ELSE CASE WHEN (0.924153036292852::DOUBLE) * x::DOUBLE + (0.3820224672852406::DOUBLE) * y::DOUBLE >= (5.009500016428323::DOUBLE)
                                    THEN 240
                                    ELSE 223
                                  END
                                END
                              END
                              ELSE CASE WHEN (0.1639214479702979::DOUBLE) * x::DOUBLE + (0.9864733949252361::DOUBLE) * y::DOUBLE >= (6.212431786592806::DOUBLE)
                                THEN CASE WHEN (0.41132867390165523::DOUBLE) * x::DOUBLE + (-0.9114870937244838::DOUBLE) * y::DOUBLE >= (-4.142169674831805::DOUBLE)
                                  THEN 223
                                  ELSE 214
                                END
                                ELSE CASE WHEN (0.9724786726826901::DOUBLE) * x::DOUBLE + (0.23299191225730065::DOUBLE) * y::DOUBLE >= (4.118689067056869::DOUBLE)
                                  THEN 223
                                  ELSE 208
                                END
                              END
                            END
                            ELSE CASE WHEN (0.997527146957651::DOUBLE) * x::DOUBLE + (0.07028222451323637::DOUBLE) * y::DOUBLE >= (3.372467451690518::DOUBLE)
                              THEN CASE WHEN (0.43320654094042577::DOUBLE) * x::DOUBLE + (-0.901294675944794::DOUBLE) * y::DOUBLE >= (-3.76843873674034::DOUBLE)
                                THEN CASE WHEN (0.7806575959667182::DOUBLE) * x::DOUBLE + (0.6249589729409954::DOUBLE) * y::DOUBLE >= (5.915043583766916::DOUBLE)
                                  THEN 243
                                  ELSE 228
                                END
                                ELSE CASE WHEN (0.924153036292852::DOUBLE) * x::DOUBLE + (0.3820224672852406::DOUBLE) * y::DOUBLE >= (5.009500016428323::DOUBLE)
                                  THEN CASE WHEN (0.24512641777221703::DOUBLE) * x::DOUBLE + (-0.969491123894469::DOUBLE) * y::DOUBLE >= (-4.761779402510716::DOUBLE)
                                    THEN 243
                                    ELSE 240
                                  END
                                  ELSE CASE WHEN (0.9314854973543792::DOUBLE) * x::DOUBLE + (-0.3637784603552894::DOUBLE) * y::DOUBLE >= (0.7901038934540754::DOUBLE)
                                    THEN 243
                                    ELSE 223
                                  END
                                END
                              END
                              ELSE CASE WHEN (0.9724786726826901::DOUBLE) * x::DOUBLE + (0.23299191225730065::DOUBLE) * y::DOUBLE >= (4.118689067056869::DOUBLE)
                                THEN CASE WHEN (0.13777359443150847::DOUBLE) * x::DOUBLE + (0.9904637482903764::DOUBLE) * y::DOUBLE >= (5.97366781706557::DOUBLE)
                                  THEN 223
                                  ELSE 222
                                END
                                ELSE 208
                              END
                            END
                          END
                          ELSE CASE WHEN (0.9940533454449406::DOUBLE) * x::DOUBLE + (0.10889419823719572::DOUBLE) * y::DOUBLE >= (3.4251354920343395::DOUBLE)
                            THEN CASE WHEN (0.880631049922036::DOUBLE) * x::DOUBLE + (-0.4738026529191373::DOUBLE) * y::DOUBLE >= (-0.3948367349339028::DOUBLE)
                              THEN CASE WHEN (0.9994729571933023::DOUBLE) * x::DOUBLE + (-0.03246240655397217::DOUBLE) * y::DOUBLE >= (2.74293802502069::DOUBLE)
                                THEN CASE WHEN (0.18933571190533283::DOUBLE) * x::DOUBLE + (0.9819124137097467::DOUBLE) * y::DOUBLE >= (6.636926262444827::DOUBLE)
                                  THEN 239
                                  ELSE 226
                                END
                                ELSE CASE WHEN (0.6152094817394201::DOUBLE) * x::DOUBLE + (0.7883636810368132::DOUBLE) * y::DOUBLE >= (6.693021532515335::DOUBLE)
                                  THEN 239
                                  ELSE 214
                                END
                              END
                              ELSE CASE WHEN (0.9519466698882183::DOUBLE) * x::DOUBLE + (-0.3062638367302474::DOUBLE) * y::DOUBLE >= (0.7577981155059921::DOUBLE)
                                THEN CASE WHEN (0.10518243975599657::DOUBLE) * x::DOUBLE + (0.9944529422586954::DOUBLE) * y::DOUBLE >= (6.496361426803329::DOUBLE)
                                  THEN 217
                                  ELSE 214
                                END
                                ELSE CASE WHEN (0.5238349697744349::DOUBLE) * x::DOUBLE + (0.8518197722766342::DOUBLE) * y::DOUBLE >= (6.780097899409064::DOUBLE)
                                  THEN 217
                                  ELSE 198
                                END
                              END
                            END
                            ELSE CASE WHEN (0.8316740664910683::DOUBLE) * x::DOUBLE + (0.5552641237521203::DOUBLE) * y::DOUBLE >= (5.5264302178892795::DOUBLE)
                              THEN CASE WHEN (0.10833630638447753::DOUBLE) * x::DOUBLE + (-0.9941143016368734::DOUBLE) * y::DOUBLE >= (-5.926681093467718::DOUBLE)
                                THEN CASE WHEN (0.9519466698882183::DOUBLE) * x::DOUBLE + (-0.3062638367302474::DOUBLE) * y::DOUBLE >= (0.7577981155059921::DOUBLE)
                                  THEN 214
                                  ELSE 198
                                END
                                ELSE 195
                              END
                              ELSE CASE WHEN (0.9029228590848103::DOUBLE) * x::DOUBLE + (-0.4298026413856851::DOUBLE) * y::DOUBLE >= (-0.34177385292693563::DOUBLE)
                                THEN CASE WHEN (0.24875432061350827::DOUBLE) * x::DOUBLE + (0.968566615146378::DOUBLE) * y::DOUBLE >= (6.3970501970771::DOUBLE)
                                  THEN 198
                                  ELSE 193
                                END
                                ELSE CASE WHEN (0.9624941533545158::DOUBLE) * x::DOUBLE + (0.2713024230602698::DOUBLE) * y::DOUBLE >= (3.991877254670385::DOUBLE)
                                  THEN 198
                                  ELSE 174
                                END
                              END
                            END
                          END
                        END
                        ELSE CASE WHEN (0.14872707099878524::DOUBLE) * x::DOUBLE + (-0.9888782828802148::DOUBLE) * y::DOUBLE >= (-6.337624751684039::DOUBLE)
                          THEN CASE WHEN (0.5918292257571833::DOUBLE) * x::DOUBLE + (0.8060633768753253::DOUBLE) * y::DOUBLE >= (6.581231551071015::DOUBLE)
                            THEN CASE WHEN (0.8189318884916564::DOUBLE) * x::DOUBLE + (0.5738907230575254::DOUBLE) * y::DOUBLE >= (5.835077020947937::DOUBLE)
                              THEN CASE WHEN (0.09077236075141011::DOUBLE) * x::DOUBLE + (0.99587166769801::DOUBLE) * y::DOUBLE >= (6.824548639877108::DOUBLE)
                                THEN CASE WHEN (0.6248494304736154::DOUBLE) * x::DOUBLE + (-0.7807452780752493::DOUBLE) * y::DOUBLE >= (-3.4556993981158506::DOUBLE)
                                  THEN CASE WHEN (0.2935550526033149::DOUBLE) * x::DOUBLE + (0.9559421693235765::DOUBLE) * y::DOUBLE >= (7.306293205896173::DOUBLE)
                                    THEN 229
                                    ELSE 217
                                  END
                                  ELSE CASE WHEN (0.9029370593054196::DOUBLE) * x::DOUBLE + (0.4297728085080318::DOUBLE) * y::DOUBLE >= (5.524302291356408::DOUBLE)
                                    THEN 229
                                    ELSE 197
                                  END
                                END
                                ELSE CASE WHEN (0.9940533454449406::DOUBLE) * x::DOUBLE + (0.10889419823719572::DOUBLE) * y::DOUBLE >= (3.4251354920343395::DOUBLE)
                                  THEN 217
                                  ELSE 195
                                END
                              END
                              ELSE CASE WHEN (0.9414510473054424::DOUBLE) * x::DOUBLE + (-0.3371497078858082::DOUBLE) * y::DOUBLE >= (0.10193769888818993::DOUBLE)
                                THEN CASE WHEN (0.10833630638447753::DOUBLE) * x::DOUBLE + (-0.9941143016368734::DOUBLE) * y::DOUBLE >= (-5.926681093467718::DOUBLE)
                                  THEN 198
                                  ELSE 195
                                END
                                ELSE 173
                              END
                            END
                            ELSE CASE WHEN (0.43694371546774863::DOUBLE) * x::DOUBLE + (-0.8994888490210644::DOUBLE) * y::DOUBLE >= (-4.566790297697223::DOUBLE)
                              THEN CASE WHEN (0.5105041464014903::DOUBLE) * x::DOUBLE + (0.8598752912526827::DOUBLE) * y::DOUBLE >= (6.43050782928921::DOUBLE)
                                THEN CASE WHEN (0.8060233680586665::DOUBLE) * x::DOUBLE + (-0.5918837133621465::DOUBLE) * y::DOUBLE >= (-1.5914250638586513::DOUBLE)
                                  THEN 198
                                  ELSE 183
                                END
                                ELSE CASE WHEN (0.9624941533545158::DOUBLE) * x::DOUBLE + (0.2713024230602698::DOUBLE) * y::DOUBLE >= (3.991877254670385::DOUBLE)
                                  THEN 198
                                  ELSE 174
                                END
                              END
                              ELSE CASE WHEN (0.6150446905900052::DOUBLE) * x::DOUBLE + (0.7884922501692992::DOUBLE) * y::DOUBLE >= (6.419205632686747::DOUBLE)
                                THEN CASE WHEN (0.40570832943726226::DOUBLE) * x::DOUBLE + (-0.9140025992442395::DOUBLE) * y::DOUBLE >= (-4.877260717757007::DOUBLE)
                                  THEN 183
                                  ELSE 173
                                END
                                ELSE CASE WHEN (0.9457285764576148::DOUBLE) * x::DOUBLE + (-0.32495762750157664::DOUBLE) * y::DOUBLE >= (0.10282604885337188::DOUBLE)
                                  THEN 183
                                  ELSE 162
                                END
                              END
                            END
                          END
                          ELSE CASE WHEN (0.023780203345363685::DOUBLE) * x::DOUBLE + (-0.9997172109796116::DOUBLE) * y::DOUBLE >= (-7.1652251438025285::DOUBLE)
                            THEN CASE WHEN (0.738514655909946::DOUBLE) * x::DOUBLE + (0.6742374233207572::DOUBLE) * y::DOUBLE >= (6.536339599419889::DOUBLE)
                              THEN CASE WHEN (0.19135902350447812::DOUBLE) * x::DOUBLE + (-0.981520108873686::DOUBLE) * y::DOUBLE >= (-6.3927171812619115::DOUBLE)
                                THEN CASE WHEN (0.9029370593054196::DOUBLE) * x::DOUBLE + (0.4297728085080318::DOUBLE) * y::DOUBLE >= (5.524302291356408::DOUBLE)
                                  THEN 229
                                  ELSE 197
                                END
                                ELSE CASE WHEN (0.9031613741425298::DOUBLE) * x::DOUBLE + (-0.42930121390112264::DOUBLE) * y::DOUBLE >= (-0.5328621827059585::DOUBLE)
                                  THEN 229
                                  ELSE 190
                                END
                              END
                              ELSE CASE WHEN (0.9392916710580441::DOUBLE) * x::DOUBLE + (-0.34311974102488896::DOUBLE) * y::DOUBLE >= (-0.08379294950100569::DOUBLE)
                                THEN 197
                                ELSE 169
                              END
                            END
                            ELSE CASE WHEN (0.9700677444484711::DOUBLE) * x::DOUBLE + (0.2428344522110804::DOUBLE) * y::DOUBLE >= (4.438898781389186::DOUBLE)
                              THEN CASE WHEN (0.4238839381241017::DOUBLE) * x::DOUBLE + (0.9057165158041466::DOUBLE) * y::DOUBLE >= (7.961694273150643::DOUBLE)
                                THEN CASE WHEN (0.5265099580818334::DOUBLE) * x::DOUBLE + (-0.8501689620544061::DOUBLE) * y::DOUBLE >= (-4.970919509167771::DOUBLE)
                                  THEN 225
                                  ELSE 212
                                END
                                ELSE CASE WHEN (0.8973481111366589::DOUBLE) * x::DOUBLE + (0.4413234272497555::DOUBLE) * y::DOUBLE >= (5.749563902494406::DOUBLE)
                                  THEN 225
                                  ELSE 190
                                END
                              END
                              ELSE CASE WHEN (0.2016323006513917::DOUBLE) * x::DOUBLE + (-0.9794612883284498::DOUBLE) * y::DOUBLE >= (-6.834084418909693::DOUBLE)
                                THEN 190
                                ELSE 185
                              END
                            END
                          END
                        END
                      END
                      ELSE CASE WHEN (0.7704916812459555::DOUBLE) * x::DOUBLE + (-0.6374500522635331::DOUBLE) * y::DOUBLE >= (-1.3181357521770591::DOUBLE)
                        THEN CASE WHEN (0.9938372831167448::DOUBLE) * x::DOUBLE + (0.11084879199669775::DOUBLE) * y::DOUBLE >= (3.579130030693531::DOUBLE)
                          THEN CASE WHEN (0.3077402045523098::DOUBLE) * x::DOUBLE + (0.9514704233459401::DOUBLE) * y::DOUBLE >= (5.963253427103243::DOUBLE)
                            THEN CASE WHEN (0.997527146957651::DOUBLE) * x::DOUBLE + (0.07028222451323637::DOUBLE) * y::DOUBLE >= (3.372467451690518::DOUBLE)
                              THEN CASE WHEN (0.23920389268226203::DOUBLE) * x::DOUBLE + (-0.9709693598284412::DOUBLE) * y::DOUBLE >= (-4.552116136803121::DOUBLE)
                                THEN CASE WHEN (0.45912327091568067::DOUBLE) * x::DOUBLE + (0.8883725694232609::DOUBLE) * y::DOUBLE >= (6.226626257191887::DOUBLE)
                                  THEN 241
                                  ELSE 237
                                END
                                ELSE CASE WHEN (0.7190024608484169::DOUBLE) * x::DOUBLE + (-0.6950075260699847::DOUBLE) * y::DOUBLE >= (-1.5925313492186848::DOUBLE)
                                  THEN 241
                                  ELSE 228
                                END
                              END
                              ELSE CASE WHEN (0.6588700146851765::DOUBLE) * x::DOUBLE + (-0.7522568070471382::DOUBLE) * y::DOUBLE >= (-2.106828243574423::DOUBLE)
                                THEN 237
                                ELSE 222
                              END
                            END
                            ELSE CASE WHEN (0.1572924012638371::DOUBLE) * x::DOUBLE + (-0.9875520748318318::DOUBLE) * y::DOUBLE >= (-4.573420883110273::DOUBLE)
                              THEN CASE WHEN (0.6575314910775617::DOUBLE) * x::DOUBLE + (-0.7534270623234331::DOUBLE) * y::DOUBLE >= (-1.6728502273980888::DOUBLE)
                                THEN CASE WHEN (0.18408542764262792::DOUBLE) * x::DOUBLE + (0.9829102478505505::DOUBLE) * y::DOUBLE >= (5.508267947581007::DOUBLE)
                                  THEN 250
                                  ELSE 247
                                END
                                ELSE CASE WHEN (0.9087083995597001::DOUBLE) * x::DOUBLE + (0.417431484880631::DOUBLE) * y::DOUBLE >= (4.990490003559556::DOUBLE)
                                  THEN 250
                                  ELSE 235
                                END
                              END
                              ELSE CASE WHEN (0.9334178088999646::DOUBLE) * x::DOUBLE + (-0.3587912959206079::DOUBLE) * y::DOUBLE >= (1.085614058155125::DOUBLE)
                                THEN 250
                                ELSE 227
                              END
                            END
                          END
                          ELSE CASE WHEN (0.6757360224176628::DOUBLE) * x::DOUBLE + (0.7371436956300691::DOUBLE) * y::DOUBLE >= (5.825495995668996::DOUBLE)
                            THEN CASE WHEN (0.679583272891118::DOUBLE) * x::DOUBLE + (-0.7335983745937529::DOUBLE) * y::DOUBLE >= (-1.8372003210159331::DOUBLE)
                              THEN 227
                              ELSE CASE WHEN (0.6065163565101886::DOUBLE) * x::DOUBLE + (0.7950710089580715::DOUBLE) * y::DOUBLE >= (5.974920687190476::DOUBLE)
                                THEN CASE WHEN (0.5995310225405853::DOUBLE) * x::DOUBLE + (-0.8003515184039074::DOUBLE) * y::DOUBLE >= (-2.602998864784688::DOUBLE)
                                  THEN CASE WHEN (0.0841989658909119::DOUBLE) * x::DOUBLE + (0.9964489621364965::DOUBLE) * y::DOUBLE >= (5.657977663209678::DOUBLE)
                                    THEN 222
                                    ELSE 220
                                  END
                                  ELSE CASE WHEN (0.8930883321483362::DOUBLE) * x::DOUBLE + (0.4498813521146474::DOUBLE) * y::DOUBLE >= (5.042849872902568::DOUBLE)
                                    THEN 222
                                    ELSE 211
                                  END
                                END
                                ELSE CASE WHEN (0.9994446610214316::DOUBLE) * x::DOUBLE + (-0.033322208146453834::DOUBLE) * y::DOUBLE >= (2.639017873432738::DOUBLE)
                                  THEN 220
                                  ELSE 204
                                END
                              END
                            END
                            ELSE CASE WHEN (0.9600850620153835::DOUBLE) * x::DOUBLE + (-0.2797081938287066::DOUBLE) * y::DOUBLE >= (1.2242696930228592::DOUBLE)
                              THEN CASE WHEN (0.3563590571282121::DOUBLE) * x::DOUBLE + (-0.9343490902241471::DOUBLE) * y::DOUBLE >= (-3.7916239087885613::DOUBLE)
                                THEN CASE WHEN (0.7909860377044302::DOUBLE) * x::DOUBLE + (0.6118341998913152::DOUBLE) * y::DOUBLE >= (5.479605007896289::DOUBLE)
                                  THEN CASE WHEN (0.1572924012638371::DOUBLE) * x::DOUBLE + (-0.9875520748318318::DOUBLE) * y::DOUBLE >= (-4.573420883110273::DOUBLE)
                                    THEN 235
                                    ELSE 227
                                  END
                                  ELSE CASE WHEN (0.9878868033294139::DOUBLE) * x::DOUBLE + (-0.15517623467397196::DOUBLE) * y::DOUBLE >= (2.1501221195966886::DOUBLE)
                                    THEN 235
                                    ELSE 216
                                  END
                                END
                                ELSE CASE WHEN (0.9968488668754631::DOUBLE) * x::DOUBLE + (-0.0793242498174758::DOUBLE) * y::DOUBLE >= (2.50592536547363::DOUBLE)
                                  THEN 227
                                  ELSE 210
                                END
                              END
                              ELSE CASE WHEN (0.30882791375510044::DOUBLE) * x::DOUBLE + (0.9511179315340828::DOUBLE) * y::DOUBLE >= (5.8081901117440635::DOUBLE)
                                THEN CASE WHEN (0.6228028201563861::DOUBLE) * x::DOUBLE + (-0.7823788386742399::DOUBLE) * y::DOUBLE >= (-2.4070497340492487::DOUBLE)
                                  THEN 210
                                  ELSE 204
                                END
                                ELSE CASE WHEN (0.8858843640926031::DOUBLE) * x::DOUBLE + (0.4639061256938135::DOUBLE) * y::DOUBLE >= (4.820829585659345::DOUBLE)
                                  THEN 210
                                  ELSE 201
                                END
                              END
                            END
                          END
                        END
                        ELSE CASE WHEN (0.9909719974798495::DOUBLE) * x::DOUBLE + (-0.1340690128657522::DOUBLE) * y::DOUBLE >= (1.6565054032164435::DOUBLE)
                          THEN CASE WHEN (0.5672082958751019::DOUBLE) * x::DOUBLE + (0.8235743737456035::DOUBLE) * y::DOUBLE >= (6.0961405060688865::DOUBLE)
                            THEN CASE WHEN (0.8650742605569035::DOUBLE) * x::DOUBLE + (-0.501643821572564::DOUBLE) * y::DOUBLE >= (-0.45205015597424003::DOUBLE)
                              THEN CASE WHEN (0.17119574878225718::DOUBLE) * x::DOUBLE + (-0.9852370352351165::DOUBLE) * y::DOUBLE >= (-5.008012159110328::DOUBLE)
                                THEN CASE WHEN (0.8930883321483362::DOUBLE) * x::DOUBLE + (0.4498813521146474::DOUBLE) * y::DOUBLE >= (5.042849872902568::DOUBLE)
                                  THEN 222
                                  ELSE 211
                                END
                                ELSE CASE WHEN (0.7389609104466431::DOUBLE) * x::DOUBLE + (-0.673748300800728::DOUBLE) * y::DOUBLE >= (-1.6600040199580626::DOUBLE)
                                  THEN CASE WHEN (0.13777359443150847::DOUBLE) * x::DOUBLE + (0.9904637482903764::DOUBLE) * y::DOUBLE >= (5.97366781706557::DOUBLE)
                                    THEN 223
                                    ELSE 222
                                  END
                                  ELSE CASE WHEN (0.9724786726826901::DOUBLE) * x::DOUBLE + (0.23299191225730065::DOUBLE) * y::DOUBLE >= (4.118689067056869::DOUBLE)
                                    THEN 223
                                    ELSE 208
                                  END
                                END
                              END
                              ELSE CASE WHEN (0.027408939565613823::DOUBLE) * x::DOUBLE + (0.9996243044423684::DOUBLE) * y::DOUBLE >= (5.78344908385672::DOUBLE)
                                THEN CASE WHEN (0.82239224791625::DOUBLE) * x::DOUBLE + (-0.5689209000970671::DOUBLE) * y::DOUBLE >= (-1.065975338180642::DOUBLE)
                                  THEN 208
                                  ELSE 193
                                END
                                ELSE CASE WHEN (0.9692673147841312::DOUBLE) * x::DOUBLE + (0.2460099032379791::DOUBLE) * y::DOUBLE >= (3.97964151550115::DOUBLE)
                                  THEN 208
                                  ELSE 192
                                END
                              END
                            END
                            ELSE CASE WHEN (0.4322335297978922::DOUBLE) * x::DOUBLE + (-0.9017617067265912::DOUBLE) * y::DOUBLE >= (-3.7451687593920777::DOUBLE)
                              THEN CASE WHEN (0.4840361303389549::DOUBLE) * x::DOUBLE + (0.8750480126978692::DOUBLE) * y::DOUBLE >= (5.906396676056007::DOUBLE)
                                THEN CASE WHEN (0.7951674838097801::DOUBLE) * x::DOUBLE + (-0.6063898685595126::DOUBLE) * y::DOUBLE >= (-1.1440291359878372::DOUBLE)
                                  THEN CASE WHEN (0.6065163565101886::DOUBLE) * x::DOUBLE + (0.7950710089580715::DOUBLE) * y::DOUBLE >= (5.974920687190476::DOUBLE)
                                    THEN 211
                                    ELSE 204
                                  END
                                  ELSE CASE WHEN (0.973423140867531::DOUBLE) * x::DOUBLE + (0.22901394897165298::DOUBLE) * y::DOUBLE >= (3.8883955379368746::DOUBLE)
                                    THEN 211
                                    ELSE 196
                                  END
                                END
                                ELSE CASE WHEN (0.9082718673508193::DOUBLE) * x::DOUBLE + (0.4183804667752254::DOUBLE) * y::DOUBLE >= (4.589423367919435::DOUBLE)
                                  THEN 204
                                  ELSE 188
                                END
                              END
                              ELSE CASE WHEN (0.6019022603909405::DOUBLE) * x::DOUBLE + (0.7985697646018638::DOUBLE) * y::DOUBLE >= (5.911392590668283::DOUBLE)
                                THEN CASE WHEN (0.22453326827688272::DOUBLE) * x::DOUBLE + (-0.9744664239659062::DOUBLE) * y::DOUBLE >= (-4.795763112058768::DOUBLE)
                                  THEN CASE WHEN (0.973423140867531::DOUBLE) * x::DOUBLE + (0.22901394897165298::DOUBLE) * y::DOUBLE >= (3.8883955379368746::DOUBLE)
                                    THEN 211
                                    ELSE 196
                                  END
                                  ELSE CASE WHEN (0.8650742605569035::DOUBLE) * x::DOUBLE + (-0.501643821572564::DOUBLE) * y::DOUBLE >= (-0.45205015597424003::DOUBLE)
                                    THEN 211
                                    ELSE 192
                                  END
                                END
                                ELSE CASE WHEN (0.9991076103557963::DOUBLE) * x::DOUBLE + (-0.0422372220811255::DOUBLE) * y::DOUBLE >= (2.2863766331175417::DOUBLE)
                                  THEN 196
                                  ELSE 182
                                END
                              END
                            END
                          END
                          ELSE CASE WHEN (0.45332944143573867::DOUBLE) * x::DOUBLE + (-0.8913430414422728::DOUBLE) * y::DOUBLE >= (-4.03477178869778::DOUBLE)
                            THEN CASE WHEN (0.8527490781902419::DOUBLE) * x::DOUBLE + (0.5223207918948781::DOUBLE) * y::DOUBLE >= (5.072128327757158::DOUBLE)
                              THEN 193
                              ELSE CASE WHEN (0.42427268701084186::DOUBLE) * x::DOUBLE + (0.9055344759072403::DOUBLE) * y::DOUBLE >= (5.965548029657043::DOUBLE)
                                THEN CASE WHEN (0.48586065629911757::DOUBLE) * x::DOUBLE + (-0.8740362822335186::DOUBLE) * y::DOUBLE >= (-3.6934402655548673::DOUBLE)
                                  THEN 182
                                  ELSE 175
                                END
                                ELSE CASE WHEN (0.9991963475878037::DOUBLE) * x::DOUBLE + (0.04008315066449875::DOUBLE) * y::DOUBLE >= (2.5247554376814736::DOUBLE)
                                  THEN 182
                                  ELSE 167
                                END
                              END
                            END
                            ELSE CASE WHEN (0.8202670335587482::DOUBLE) * x::DOUBLE + (0.5719807633624853::DOUBLE) * y::DOUBLE >= (5.113460860285328::DOUBLE)
                              THEN CASE WHEN (0.08559716751686058::DOUBLE) * x::DOUBLE + (-0.9963298273729891::DOUBLE) * y::DOUBLE >= (-5.5862357524672275::DOUBLE)
                                THEN CASE WHEN (0.8527490781902419::DOUBLE) * x::DOUBLE + (0.5223207918948781::DOUBLE) * y::DOUBLE >= (5.072128327757158::DOUBLE)
                                  THEN 193
                                  ELSE 175
                                END
                                ELSE CASE WHEN (0.9029228590848103::DOUBLE) * x::DOUBLE + (-0.4298026413856851::DOUBLE) * y::DOUBLE >= (-0.34177385292693563::DOUBLE)
                                  THEN 193
                                  ELSE 174
                                END
                              END
                              ELSE CASE WHEN (0.9200700398250071::DOUBLE) * x::DOUBLE + (-0.391753904660068::DOUBLE) * y::DOUBLE >= (-0.25272809371953575::DOUBLE)
                                THEN 175
                                ELSE 159
                              END
                            END
                          END
                        END
                      END
                    END
                    ELSE CASE WHEN (0.9111967694458639::DOUBLE) * x::DOUBLE + (-0.41197141569703727::DOUBLE) * y::DOUBLE >= (0.27563533249083316::DOUBLE)
                      THEN CASE WHEN (0.09966615243359851::DOUBLE) * x::DOUBLE + (-0.9950209334778252::DOUBLE) * y::DOUBLE >= (-4.309970955174148::DOUBLE)
                        THEN CASE WHEN (0.3759476774172172::DOUBLE) * x::DOUBLE + (-0.9266408926032782::DOUBLE) * y::DOUBLE >= (-2.685168822758526::DOUBLE)
                          THEN CASE WHEN (0.5097718943937587::DOUBLE) * x::DOUBLE + (-0.8603096045530344::DOUBLE) * y::DOUBLE >= (-1.6867083533655478::DOUBLE)
                            THEN CASE WHEN (0.7272395822962476::DOUBLE) * x::DOUBLE + (-0.6863837046008444::DOUBLE) * y::DOUBLE >= (0.06661151410078014::DOUBLE)
                              THEN CASE WHEN (0.7746135342101332::DOUBLE) * x::DOUBLE + (-0.6324348761876488::DOUBLE) * y::DOUBLE >= (0.44570166000858435::DOUBLE)
                                THEN CASE WHEN (0.6287284451558489::DOUBLE) * x::DOUBLE + (0.7776249367477285::DOUBLE) * y::DOUBLE >= (4.887179513556612::DOUBLE)
                                  THEN 286
                                  ELSE 264
                                END
                                ELSE CASE WHEN (0.9961089204930612::DOUBLE) * x::DOUBLE + (0.08813068996750437::DOUBLE) * y::DOUBLE >= (3.733016556739919::DOUBLE)
                                  THEN 286
                                  ELSE 244
                                END
                              END
                              ELSE CASE WHEN (0.7771339546681562::DOUBLE) * x::DOUBLE + (-0.6293352179100041::DOUBLE) * y::DOUBLE >= (0.07178998185994256::DOUBLE)
                                THEN CASE WHEN (0.5792255249941504::DOUBLE) * x::DOUBLE + (0.8151673393820749::DOUBLE) * y::DOUBLE >= (4.876224397321706::DOUBLE)
                                  THEN 262
                                  ELSE 244
                                END
                                ELSE CASE WHEN (0.9970444781090141::DOUBLE) * x::DOUBLE + (0.07682648418562277::DOUBLE) * y::DOUBLE >= (3.412748543081557::DOUBLE)
                                  THEN 262
                                  ELSE 215
                                END
                              END
                            END
                            ELSE CASE WHEN (0.4986134374535317::DOUBLE) * x::DOUBLE + (0.866824457425362::DOUBLE) * y::DOUBLE >= (4.585278006678882::DOUBLE)
                              THEN CASE WHEN (0.5646699358921469::DOUBLE) * x::DOUBLE + (-0.8253168261337938::DOUBLE) * y::DOUBLE >= (-1.6781647454613622::DOUBLE)
                                THEN CASE WHEN (0.7734130297484656::DOUBLE) * x::DOUBLE + (0.6339024257843623::DOUBLE) * y::DOUBLE >= (4.83805127916774::DOUBLE)
                                  THEN 249
                                  ELSE 215
                                END
                                ELSE CASE WHEN (0.9999531510655765::DOUBLE) * x::DOUBLE + (-0.009679652577673835::DOUBLE) * y::DOUBLE >= (2.9008475003404803::DOUBLE)
                                  THEN 249
                                  ELSE 199
                                END
                              END
                              ELSE CASE WHEN (0.9654953918233063::DOUBLE) * x::DOUBLE + (0.26042013817667836::DOUBLE) * y::DOUBLE >= (3.486665927048136::DOUBLE)
                                THEN 215
                                ELSE 179
                              END
                            END
                          END
                          ELSE CASE WHEN (0.9959561747251787::DOUBLE) * x::DOUBLE + (0.08984040308674653::DOUBLE) * y::DOUBLE >= (3.012856124331433::DOUBLE)
                            THEN CASE WHEN (0.7248704557457046::DOUBLE) * x::DOUBLE + (0.6888852026187051::DOUBLE) * y::DOUBLE >= (5.24581130621198::DOUBLE)
                              THEN CASE WHEN (0.9999809005398747::DOUBLE) * x::DOUBLE + (0.006180497994607201::DOUBLE) * y::DOUBLE >= (2.9234126362761383::DOUBLE)
                                THEN CASE WHEN (0.2398269755223804::DOUBLE) * x::DOUBLE + (-0.9708156476961977::DOUBLE) * y::DOUBLE >= (-3.594301808047181::DOUBLE)
                                  THEN CASE WHEN (0.4522703528531605::DOUBLE) * x::DOUBLE + (0.8918808933540833::DOUBLE) * y::DOUBLE >= (5.503130990758667::DOUBLE)
                                    THEN 257
                                    ELSE 242
                                  END
                                  ELSE CASE WHEN (0.9337153169210085::DOUBLE) * x::DOUBLE + (0.35801635011141714::DOUBLE) * y::DOUBLE >= (4.670513197637728::DOUBLE)
                                    THEN 257
                                    ELSE 234
                                  END
                                END
                                ELSE 205
                              END
                              ELSE CASE WHEN (0.4553584632401496::DOUBLE) * x::DOUBLE + (-0.8903081881885447::DOUBLE) * y::DOUBLE >= (-2.7489664141117283::DOUBLE)
                                THEN CASE WHEN (0.5204911485102313::DOUBLE) * x::DOUBLE + (0.853867064783799::DOUBLE) * y::DOUBLE >= (5.041103444079254::DOUBLE)
                                  THEN CASE WHEN (0.9678264212566257::DOUBLE) * x::DOUBLE + (-0.25161879563655937::DOUBLE) * y::DOUBLE >= (1.795705711082656::DOUBLE)
                                    THEN 242
                                    ELSE 213
                                  END
                                  ELSE CASE WHEN (0.90071904408798::DOUBLE) * x::DOUBLE + (0.4344021220220223::DOUBLE) * y::DOUBLE >= (4.425677448068093::DOUBLE)
                                    THEN 242
                                    ELSE 199
                                  END
                                END
                                ELSE 205
                              END
                            END
                            ELSE CASE WHEN (0.7596848170981232::DOUBLE) * x::DOUBLE + (0.6502914567104439::DOUBLE) * y::DOUBLE >= (4.449033210190985::DOUBLE)
                              THEN CASE WHEN (0.3411346851050141::DOUBLE) * x::DOUBLE + (0.9400144289415471::DOUBLE) * y::DOUBLE >= (5.027076771557104::DOUBLE)
                                THEN CASE WHEN (0.8604789909248989::DOUBLE) * x::DOUBLE + (-0.5094859234334819::DOUBLE) * y::DOUBLE >= (0.001873176401234744::DOUBLE)
                                  THEN 213
                                  ELSE 187
                                END
                                ELSE CASE WHEN (0.6964423511133712::DOUBLE) * x::DOUBLE + (-0.7176127448531555::DOUBLE) * y::DOUBLE >= (-1.2598048731914524::DOUBLE)
                                  THEN CASE WHEN (0.5204911485102313::DOUBLE) * x::DOUBLE + (0.853867064783799::DOUBLE) * y::DOUBLE >= (5.041103444079254::DOUBLE)
                                    THEN 213
                                    ELSE 199
                                  END
                                  ELSE CASE WHEN (0.9849064860419456::DOUBLE) * x::DOUBLE + (0.17308730095679145::DOUBLE) * y::DOUBLE >= (3.330646763737204::DOUBLE)
                                    THEN 213
                                    ELSE 180
                                  END
                                END
                              END
                              ELSE CASE WHEN (0.48381427196572974::DOUBLE) * x::DOUBLE + (-0.8751706977740233::DOUBLE) * y::DOUBLE >= (-2.284590973115818::DOUBLE)
                                THEN CASE WHEN (0.4986134374535317::DOUBLE) * x::DOUBLE + (0.866824457425362::DOUBLE) * y::DOUBLE >= (4.585278006678882::DOUBLE)
                                  THEN 199
                                  ELSE 179
                                END
                                ELSE CASE WHEN (0.999784097769762::DOUBLE) * x::DOUBLE + (-0.020778783571299943::DOUBLE) * y::DOUBLE >= (2.293132332116974::DOUBLE)
                                  THEN 199
                                  ELSE 164
                                END
                              END
                            END
                          END
                        END
                        ELSE CASE WHEN (0.9184705250216321::DOUBLE) * x::DOUBLE + (-0.3954894368582903::DOUBLE) * y::DOUBLE >= (0.7055301498103888::DOUBLE)
                          THEN CASE WHEN (0.9818836160631114::DOUBLE) * x::DOUBLE + (-0.18948499810493855::DOUBLE) * y::DOUBLE >= (2.018840407531788::DOUBLE)
                            THEN CASE WHEN (0.058830683498850615::DOUBLE) * x::DOUBLE + (0.9982679753848954::DOUBLE) * y::DOUBLE >= (5.113884943326845::DOUBLE)
                              THEN CASE WHEN (0.6575314910775617::DOUBLE) * x::DOUBLE + (-0.7534270623234331::DOUBLE) * y::DOUBLE >= (-1.6728502273980888::DOUBLE)
                                THEN 247
                                ELSE 235
                              END
                              ELSE CASE WHEN (0.9783869068913149::DOUBLE) * x::DOUBLE + (0.20678264052779094::DOUBLE) * y::DOUBLE >= (4.069360145202062::DOUBLE)
                                THEN CASE WHEN (0.4678154125953748::DOUBLE) * x::DOUBLE + (0.8838261931727409::DOUBLE) * y::DOUBLE >= (5.66561812495576::DOUBLE)
                                  THEN CASE WHEN (0.6964686785396426::DOUBLE) * x::DOUBLE + (-0.717587193178114::DOUBLE) * y::DOUBLE >= (-1.164479046744204::DOUBLE)
                                    THEN 257
                                    ELSE 247
                                  END
                                  ELSE CASE WHEN (0.9337153169210085::DOUBLE) * x::DOUBLE + (0.35801635011141714::DOUBLE) * y::DOUBLE >= (4.670513197637728::DOUBLE)
                                    THEN 257
                                    ELSE 234
                                  END
                                END
                                ELSE CASE WHEN (0.04669200799861719::DOUBLE) * x::DOUBLE + (-0.9989093334177316::DOUBLE) * y::DOUBLE >= (-4.5863446405292::DOUBLE)
                                  THEN 234
                                  ELSE 232
                                END
                              END
                            END
                            ELSE CASE WHEN (0.6387407232540926::DOUBLE) * x::DOUBLE + (0.7694220483303286::DOUBLE) * y::DOUBLE >= (5.563487745217973::DOUBLE)
                              THEN CASE WHEN (0.2918229188361949::DOUBLE) * x::DOUBLE + (-0.956472364494617::DOUBLE) * y::DOUBLE >= (-3.906989557565114::DOUBLE)
                                THEN CASE WHEN (0.6445520345989555::DOUBLE) * x::DOUBLE + (0.7645604454157611::DOUBLE) * y::DOUBLE >= (5.721404119811308::DOUBLE)
                                  THEN 235
                                  ELSE 221
                                END
                                ELSE CASE WHEN (0.9878868033294139::DOUBLE) * x::DOUBLE + (-0.15517623467397196::DOUBLE) * y::DOUBLE >= (2.1501221195966886::DOUBLE)
                                  THEN 235
                                  ELSE 216
                                END
                              END
                              ELSE CASE WHEN (0.31483173495177946::DOUBLE) * x::DOUBLE + (0.9491475010066942::DOUBLE) * y::DOUBLE >= (5.35093417720947::DOUBLE)
                                THEN CASE WHEN (0.9521771323679952::DOUBLE) * x::DOUBLE + (0.30554657352924325::DOUBLE) * y::DOUBLE >= (4.206236868816464::DOUBLE)
                                  THEN CASE WHEN (0.47815167132233366::DOUBLE) * x::DOUBLE + (-0.8782772792300043::DOUBLE) * y::DOUBLE >= (-2.7347726001430934::DOUBLE)
                                    THEN 234
                                    ELSE 221
                                  END
                                  ELSE CASE WHEN (0.8002678148509736::DOUBLE) * x::DOUBLE + (-0.5996427474035252::DOUBLE) * y::DOUBLE >= (-0.4884054420258126::DOUBLE)
                                    THEN 234
                                    ELSE 209
                                  END
                                END
                                ELSE CASE WHEN (0.9999809005398747::DOUBLE) * x::DOUBLE + (0.006180497994607201::DOUBLE) * y::DOUBLE >= (2.9234126362761383::DOUBLE)
                                  THEN 234
                                  ELSE 205
                                END
                              END
                            END
                          END
                          ELSE CASE WHEN (0.9951610925461568::DOUBLE) * x::DOUBLE + (0.0982568057812773::DOUBLE) * y::DOUBLE >= (3.150869462209588::DOUBLE)
                            THEN CASE WHEN (0.2918229188361949::DOUBLE) * x::DOUBLE + (-0.956472364494617::DOUBLE) * y::DOUBLE >= (-3.906989557565114::DOUBLE)
                              THEN CASE WHEN (0.31483173495177946::DOUBLE) * x::DOUBLE + (0.9491475010066942::DOUBLE) * y::DOUBLE >= (5.35093417720947::DOUBLE)
                                THEN CASE WHEN (0.405374392630128::DOUBLE) * x::DOUBLE + (-0.9141507544162258::DOUBLE) * y::DOUBLE >= (-3.3732518262904665::DOUBLE)
                                  THEN CASE WHEN (0.9521771323679952::DOUBLE) * x::DOUBLE + (0.30554657352924325::DOUBLE) * y::DOUBLE >= (4.206236868816464::DOUBLE)
                                    THEN 221
                                    ELSE 209
                                  END
                                  ELSE CASE WHEN (0.8681920415800508::DOUBLE) * x::DOUBLE + (-0.4962283536206525::DOUBLE) * y::DOUBLE >= (0.003530759582442755::DOUBLE)
                                    THEN 221
                                    ELSE 203
                                  END
                                END
                                ELSE 205
                              END
                              ELSE CASE WHEN (0.4412521826084196::DOUBLE) * x::DOUBLE + (-0.8973831463445845::DOUBLE) * y::DOUBLE >= (-3.3594311757392177::DOUBLE)
                                THEN CASE WHEN (0.9054407327962868::DOUBLE) * x::DOUBLE + (0.4244727074775519::DOUBLE) * y::DOUBLE >= (4.665676368993163::DOUBLE)
                                  THEN 216
                                  ELSE 203
                                END
                                ELSE CASE WHEN (0.8858843640926031::DOUBLE) * x::DOUBLE + (0.4639061256938135::DOUBLE) * y::DOUBLE >= (4.820829585659345::DOUBLE)
                                  THEN CASE WHEN (0.3563590571282121::DOUBLE) * x::DOUBLE + (-0.9343490902241471::DOUBLE) * y::DOUBLE >= (-3.7916239087885613::DOUBLE)
                                    THEN 216
                                    ELSE 210
                                  END
                                  ELSE CASE WHEN (0.9600850620153835::DOUBLE) * x::DOUBLE + (-0.2797081938287066::DOUBLE) * y::DOUBLE >= (1.2242696930228592::DOUBLE)
                                    THEN 216
                                    ELSE 201
                                  END
                                END
                              END
                            END
                            ELSE CASE WHEN (0.08041021546921807::DOUBLE) * x::DOUBLE + (0.9967618558352812::DOUBLE) * y::DOUBLE >= (4.96119622418183::DOUBLE)
                              THEN CASE WHEN (0.4094086115495036::DOUBLE) * x::DOUBLE + (-0.9123511323986547::DOUBLE) * y::DOUBLE >= (-3.404885507816629::DOUBLE)
                                THEN CASE WHEN (0.5645149784339526::DOUBLE) * x::DOUBLE + (0.8254228244504231::DOUBLE) * y::DOUBLE >= (5.54372584490352::DOUBLE)
                                  THEN 203
                                  ELSE 194
                                END
                                ELSE CASE WHEN (0.5684030630686044::DOUBLE) * x::DOUBLE + (0.8227502402881619::DOUBLE) * y::DOUBLE >= (5.61871031549781::DOUBLE)
                                  THEN CASE WHEN (0.4412521826084196::DOUBLE) * x::DOUBLE + (-0.8973831463445845::DOUBLE) * y::DOUBLE >= (-3.3594311757392177::DOUBLE)
                                    THEN 203
                                    ELSE 201
                                  END
                                  ELSE CASE WHEN (0.9751575048357088::DOUBLE) * x::DOUBLE + (0.2215126198720836::DOUBLE) * y::DOUBLE >= (3.657863400131439::DOUBLE)
                                    THEN 203
                                    ELSE 189
                                  END
                                END
                              END
                              ELSE CASE WHEN (0.4039352680374261::DOUBLE) * x::DOUBLE + (0.9147875705515094::DOUBLE) * y::DOUBLE >= (5.3297609160465464::DOUBLE)
                                THEN CASE WHEN (0.5716610836775159::DOUBLE) * x::DOUBLE + (-0.8204898569809672::DOUBLE) * y::DOUBLE >= (-2.3490602399979013::DOUBLE)
                                  THEN 205
                                  ELSE 194
                                END
                                ELSE CASE WHEN (0.9959561747251787::DOUBLE) * x::DOUBLE + (0.08984040308674653::DOUBLE) * y::DOUBLE >= (3.012856124331433::DOUBLE)
                                  THEN 205
                                  ELSE 187
                                END
                              END
                            END
                          END
                        END
                      END
                      ELSE CASE WHEN (0.6517654126835719::DOUBLE) * x::DOUBLE + (0.7584206265848873::DOUBLE) * y::DOUBLE >= (5.116158636968594::DOUBLE)
                        THEN CASE WHEN (0.2374286112675708::DOUBLE) * x::DOUBLE + (-0.9714049899766589::DOUBLE) * y::DOUBLE >= (-4.381675768321943::DOUBLE)
                          THEN CASE WHEN (0.9956200105788935::DOUBLE) * x::DOUBLE + (0.09349221644010837::DOUBLE) * y::DOUBLE >= (2.760916847299889::DOUBLE)
                            THEN CASE WHEN (0.4610489024241219::DOUBLE) * x::DOUBLE + (0.8873747289468595::DOUBLE) * y::DOUBLE >= (5.553766525526719::DOUBLE)
                              THEN CASE WHEN (0.5253467715775115::DOUBLE) * x::DOUBLE + (-0.850888223912569::DOUBLE) * y::DOUBLE >= (-2.977214442228309::DOUBLE)
                                THEN CASE WHEN (0.5684030630686044::DOUBLE) * x::DOUBLE + (0.8227502402881619::DOUBLE) * y::DOUBLE >= (5.61871031549781::DOUBLE)
                                  THEN 201
                                  ELSE 189
                                END
                                ELSE CASE WHEN (0.9933879089077143::DOUBLE) * x::DOUBLE + (0.114806195111407::DOUBLE) * y::DOUBLE >= (3.1108320915952086::DOUBLE)
                                  THEN 201
                                  ELSE 184
                                END
                              END
                              ELSE CASE WHEN (0.13866409775908403::DOUBLE) * x::DOUBLE + (0.9903394710868891::DOUBLE) * y::DOUBLE >= (5.084582420934559::DOUBLE)
                                THEN CASE WHEN (0.9952190404367565::DOUBLE) * x::DOUBLE + (0.09766811942564296::DOUBLE) * y::DOUBLE >= (2.9037262711461462::DOUBLE)
                                  THEN CASE WHEN (0.4094086115495036::DOUBLE) * x::DOUBLE + (-0.9123511323986547::DOUBLE) * y::DOUBLE >= (-3.404885507816629::DOUBLE)
                                    THEN 194
                                    ELSE 189
                                  END
                                  ELSE CASE WHEN (0.8944768532084556::DOUBLE) * x::DOUBLE + (-0.4471142572925839::DOUBLE) * y::DOUBLE >= (0.02698210400442491::DOUBLE)
                                    THEN 194
                                    ELSE 178
                                  END
                                END
                                ELSE CASE WHEN (0.9177222772521298::DOUBLE) * x::DOUBLE + (0.39722263509921607::DOUBLE) * y::DOUBLE >= (4.131482775970753::DOUBLE)
                                  THEN 194
                                  ELSE 176
                                END
                              END
                            END
                            ELSE CASE WHEN (0.7731916874159205::DOUBLE) * x::DOUBLE + (-0.6341723854843584::DOUBLE) * y::DOUBLE >= (-1.4357042056228153::DOUBLE)
                              THEN CASE WHEN (0.6903071490399952::DOUBLE) * x::DOUBLE + (-0.7235164407145659::DOUBLE) * y::DOUBLE >= (-1.9094550597424376::DOUBLE)
                                THEN CASE WHEN (0.13866409775908403::DOUBLE) * x::DOUBLE + (0.9903394710868891::DOUBLE) * y::DOUBLE >= (5.084582420934559::DOUBLE)
                                  THEN 178
                                  ELSE 176
                                END
                                ELSE CASE WHEN (0.9069802774140757::DOUBLE) * x::DOUBLE + (0.42117309551048754::DOUBLE) * y::DOUBLE >= (4.096198623982689::DOUBLE)
                                  THEN 178
                                  ELSE 165
                                END
                              END
                              ELSE CASE WHEN (0.5917919451021396::DOUBLE) * x::DOUBLE + (-0.8060907478145536::DOUBLE) * y::DOUBLE >= (-2.750456195184734::DOUBLE)
                                THEN CASE WHEN (0.03355450538924223::DOUBLE) * x::DOUBLE + (0.9994368890370635::DOUBLE) * y::DOUBLE >= (5.032762216782384::DOUBLE)
                                  THEN 166
                                  ELSE 165
                                END
                                ELSE CASE WHEN (0.9561822437060796::DOUBLE) * x::DOUBLE + (0.2927721243923465::DOUBLE) * y::DOUBLE >= (3.475534513404446::DOUBLE)
                                  THEN 166
                                  ELSE 158
                                END
                              END
                            END
                          END
                          ELSE CASE WHEN (0.9956200105788935::DOUBLE) * x::DOUBLE + (0.09349221644010837::DOUBLE) * y::DOUBLE >= (2.760916847299889::DOUBLE)
                            THEN CASE WHEN (0.8243697845329813::DOUBLE) * x::DOUBLE + (-0.5660516392954322::DOUBLE) * y::DOUBLE >= (-0.9836611242783717::DOUBLE)
                              THEN CASE WHEN (0.5147388554158486::DOUBLE) * x::DOUBLE + (0.8573470188466173::DOUBLE) * y::DOUBLE >= (5.709369699893992::DOUBLE)
                                THEN CASE WHEN (0.7704916812459555::DOUBLE) * x::DOUBLE + (-0.6374500522635331::DOUBLE) * y::DOUBLE >= (-1.3181357521770591::DOUBLE)
                                  THEN 201
                                  ELSE 188
                                END
                                ELSE CASE WHEN (0.9933879089077143::DOUBLE) * x::DOUBLE + (0.114806195111407::DOUBLE) * y::DOUBLE >= (3.1108320915952086::DOUBLE)
                                  THEN 201
                                  ELSE 184
                                END
                              END
                              ELSE CASE WHEN (0.35568849674954583::DOUBLE) * x::DOUBLE + (-0.9346045651932416::DOUBLE) * y::DOUBLE >= (-4.175569030786285::DOUBLE)
                                THEN CASE WHEN (0.5861668456594812::DOUBLE) * x::DOUBLE + (0.8101903659323616::DOUBLE) * y::DOUBLE >= (5.688049687860203::DOUBLE)
                                  THEN CASE WHEN (0.4322335297978922::DOUBLE) * x::DOUBLE + (-0.9017617067265912::DOUBLE) * y::DOUBLE >= (-3.7451687593920777::DOUBLE)
                                    THEN 188
                                    ELSE 182
                                  END
                                  ELSE CASE WHEN (0.9926083460497798::DOUBLE) * x::DOUBLE + (0.12136173759600112::DOUBLE) * y::DOUBLE >= (3.009056018877254::DOUBLE)
                                    THEN 188
                                    ELSE 171
                                  END
                                END
                                ELSE CASE WHEN (0.9991963475878037::DOUBLE) * x::DOUBLE + (0.04008315066449875::DOUBLE) * y::DOUBLE >= (2.5247554376814736::DOUBLE)
                                  THEN 182
                                  ELSE 167
                                END
                              END
                            END
                            ELSE CASE WHEN (0.637071235863814::DOUBLE) * x::DOUBLE + (0.7708049302092929::DOUBLE) * y::DOUBLE >= (5.379418969117922::DOUBLE)
                              THEN CASE WHEN (0.7472866523862447::DOUBLE) * x::DOUBLE + (0.6645018127630352::DOUBLE) * y::DOUBLE >= (5.090294755798409::DOUBLE)
                                THEN CASE WHEN (0.35568849674954583::DOUBLE) * x::DOUBLE + (-0.9346045651932416::DOUBLE) * y::DOUBLE >= (-4.175569030786285::DOUBLE)
                                  THEN 171
                                  ELSE 167
                                END
                                ELSE CASE WHEN (0.9998695963732624::DOUBLE) * x::DOUBLE + (-0.016149001466629218::DOUBLE) * y::DOUBLE >= (2.0356294158361767::DOUBLE)
                                  THEN 171
                                  ELSE 153
                                END
                              END
                              ELSE CASE WHEN (0.22653735711475945::DOUBLE) * x::DOUBLE + (-0.974002477323061::DOUBLE) * y::DOUBLE >= (-4.543562607790517::DOUBLE)
                                THEN CASE WHEN (0.9561822437060796::DOUBLE) * x::DOUBLE + (0.2927721243923465::DOUBLE) * y::DOUBLE >= (3.475534513404446::DOUBLE)
                                  THEN 166
                                  ELSE 158
                                END
                                ELSE CASE WHEN (0.806728018889466::DOUBLE) * x::DOUBLE + (-0.5909229252099444::DOUBLE) * y::DOUBLE >= (-1.377960564636188::DOUBLE)
                                  THEN 166
                                  ELSE 153
                                END
                              END
                            END
                          END
                        END
                        ELSE CASE WHEN (0.2440610109179935::DOUBLE) * x::DOUBLE + (-0.9697598790162888::DOUBLE) * y::DOUBLE >= (-3.793353758616827::DOUBLE)
                          THEN CASE WHEN (0.9972781641003576::DOUBLE) * x::DOUBLE + (0.07373102066715277::DOUBLE) * y::DOUBLE >= (2.3113760981429863::DOUBLE)
                            THEN CASE WHEN (0.027282027174339325::DOUBLE) * x::DOUBLE + (-0.9996277762213586::DOUBLE) * y::DOUBLE >= (-4.235840398166311::DOUBLE)
                              THEN CASE WHEN (0.7596848170981232::DOUBLE) * x::DOUBLE + (0.6502914567104439::DOUBLE) * y::DOUBLE >= (4.449033210190985::DOUBLE)
                                THEN 180
                                ELSE 164
                              END
                              ELSE CASE WHEN (0.843044136131456::DOUBLE) * x::DOUBLE + (-0.5378443869135077::DOUBLE) * y::DOUBLE >= (-0.4746486728946695::DOUBLE)
                                THEN 180
                                ELSE 163
                              END
                            END
                            ELSE CASE WHEN (0.3711251575029183::DOUBLE) * x::DOUBLE + (0.9285828543907291::DOUBLE) * y::DOUBLE >= (4.683065712547525::DOUBLE)
                              THEN CASE WHEN (0.5406296105923647::DOUBLE) * x::DOUBLE + (-0.8412607349393814::DOUBLE) * y::DOUBLE >= (-2.5292439248489873::DOUBLE)
                                THEN 164
                                ELSE 146
                              END
                              ELSE CASE WHEN (0.9803688581329099::DOUBLE) * x::DOUBLE + (-0.19717226479191888::DOUBLE) * y::DOUBLE >= (1.075309523422483::DOUBLE)
                                THEN 164
                                ELSE 137
                              END
                            END
                          END
                          ELSE CASE WHEN (0.0011312129954424697::DOUBLE) * x::DOUBLE + (0.9999993601783748::DOUBLE) * y::DOUBLE >= (4.831921549810225::DOUBLE)
                            THEN CASE WHEN (0.3829989843973995::DOUBLE) * x::DOUBLE + (0.9237487634365529::DOUBLE) * y::DOUBLE >= (5.354171632035393::DOUBLE)
                              THEN CASE WHEN (0.5917919451021396::DOUBLE) * x::DOUBLE + (-0.8060907478145536::DOUBLE) * y::DOUBLE >= (-2.750456195184734::DOUBLE)
                                THEN 165
                                ELSE 158
                              END
                              ELSE CASE WHEN (0.9486828984806038::DOUBLE) * x::DOUBLE + (-0.31622896472404344::DOUBLE) * y::DOUBLE >= (0.4080050068805794::DOUBLE)
                                THEN 165
                                ELSE 152
                              END
                            END
                            ELSE CASE WHEN (0.8946215918885873::DOUBLE) * x::DOUBLE + (0.44682458227668054::DOUBLE) * y::DOUBLE >= (3.982978805373736::DOUBLE)
                              THEN CASE WHEN (0.12562894904932517::DOUBLE) * x::DOUBLE + (0.9920772989846921::DOUBLE) * y::DOUBLE >= (4.906050831387803::DOUBLE)
                                THEN CASE WHEN (0.6903071490399952::DOUBLE) * x::DOUBLE + (-0.7235164407145659::DOUBLE) * y::DOUBLE >= (-1.9094550597424376::DOUBLE)
                                  THEN 176
                                  ELSE 165
                                END
                                ELSE CASE WHEN (0.7377889011014711::DOUBLE) * x::DOUBLE + (0.6750315084582968::DOUBLE) * y::DOUBLE >= (4.730100899227742::DOUBLE)
                                  THEN 176
                                  ELSE 163
                                END
                              END
                              ELSE CASE WHEN (0.3496352185621697::DOUBLE) * x::DOUBLE + (0.9368859129803285::DOUBLE) * y::DOUBLE >= (4.99503915057901::DOUBLE)
                                THEN CASE WHEN (0.5197859851110141::DOUBLE) * x::DOUBLE + (-0.8542965115708787::DOUBLE) * y::DOUBLE >= (-2.895885995188792::DOUBLE)
                                  THEN 163
                                  ELSE 151
                                END
                                ELSE CASE WHEN (0.9972781641003576::DOUBLE) * x::DOUBLE + (0.07373102066715277::DOUBLE) * y::DOUBLE >= (2.3113760981429863::DOUBLE)
                                  THEN 163
                                  ELSE 146
                                END
                              END
                            END
                          END
                        END
                      END
                    END
                  END
                  ELSE CASE WHEN (0.21252807715059216::DOUBLE) * x::DOUBLE + (-0.977154960291699::DOUBLE) * y::DOUBLE >= (-5.199259522675203::DOUBLE)
                    THEN CASE WHEN (0.8885666721312511::DOUBLE) * x::DOUBLE + (0.4587475004592327::DOUBLE) * y::DOUBLE >= (3.593013213636418::DOUBLE)
                      THEN CASE WHEN (0.43944617917918555::DOUBLE) * x::DOUBLE + (-0.8982689216514255::DOUBLE) * y::DOUBLE >= (-3.8484065335046265::DOUBLE)
                        THEN CASE WHEN (0.0011312129954424697::DOUBLE) * x::DOUBLE + (0.9999993601783748::DOUBLE) * y::DOUBLE >= (4.831921549810225::DOUBLE)
                          THEN CASE WHEN (0.9901476162418191::DOUBLE) * x::DOUBLE + (-0.14002749033901601::DOUBLE) * y::DOUBLE >= (1.0236867077187894::DOUBLE)
                            THEN CASE WHEN (0.4274962018686708::DOUBLE) * x::DOUBLE + (0.9040171444103594::DOUBLE) * y::DOUBLE >= (5.250659960023913::DOUBLE)
                              THEN CASE WHEN (0.790691581434168::DOUBLE) * x::DOUBLE + (-0.612214687057681::DOUBLE) * y::DOUBLE >= (-1.5241529093874062::DOUBLE)
                                THEN CASE WHEN (0.3829989843973995::DOUBLE) * x::DOUBLE + (0.9237487634365529::DOUBLE) * y::DOUBLE >= (5.354171632035393::DOUBLE)
                                  THEN 158
                                  ELSE 152
                                END
                                ELSE CASE WHEN (0.8328760872212758::DOUBLE) * x::DOUBLE + (0.553459504692961::DOUBLE) * y::DOUBLE >= (4.416913771301017::DOUBLE)
                                  THEN CASE WHEN (0.22653735711475945::DOUBLE) * x::DOUBLE + (-0.974002477323061::DOUBLE) * y::DOUBLE >= (-4.543562607790517::DOUBLE)
                                    THEN 158
                                    ELSE 153
                                  END
                                  ELSE CASE WHEN (0.565079383721268::DOUBLE) * x::DOUBLE + (-0.8250365386412847::DOUBLE) * y::DOUBLE >= (-3.134998109147379::DOUBLE)
                                    THEN CASE WHEN (0.9666053474773684::DOUBLE) * x::DOUBLE + (0.2562695889647382::DOUBLE) * y::DOUBLE >= (3.152766789915141::DOUBLE)
                                      THEN 158
                                      ELSE 144
                                    END
                                    ELSE CASE WHEN (0.9677835554343426::DOUBLE) * x::DOUBLE + (-0.2517836170819356::DOUBLE) * y::DOUBLE >= (0.5606259132078826::DOUBLE)
                                      THEN 158
                                      ELSE 140
                                    END
                                  END
                                END
                              END
                              ELSE CASE WHEN (0.8399927879578768::DOUBLE) * x::DOUBLE + (0.5425975637419996::DOUBLE) * y::DOUBLE >= (4.163457460612918::DOUBLE)
                                THEN CASE WHEN (0.3386350677072394::DOUBLE) * x::DOUBLE + (0.9409177917963467::DOUBLE) * y::DOUBLE >= (5.194842545079795::DOUBLE)
                                  THEN CASE WHEN (0.790691581434168::DOUBLE) * x::DOUBLE + (-0.612214687057681::DOUBLE) * y::DOUBLE >= (-1.5241529093874062::DOUBLE)
                                    THEN 152
                                    ELSE 144
                                  END
                                  ELSE CASE WHEN (0.7712704327833266::DOUBLE) * x::DOUBLE + (0.6365075958024541::DOUBLE) * y::DOUBLE >= (4.50946607662545::DOUBLE)
                                    THEN 152
                                    ELSE 139
                                  END
                                END
                                ELSE CASE WHEN (0.5196093801775328::DOUBLE) * x::DOUBLE + (-0.8544039396161047::DOUBLE) * y::DOUBLE >= (-3.2190707316078595::DOUBLE)
                                  THEN 139
                                  ELSE 133
                                END
                              END
                            END
                            ELSE CASE WHEN (0.8651599563350931::DOUBLE) * x::DOUBLE + (0.5014960119026468::DOUBLE) * y::DOUBLE >= (3.865626271162287::DOUBLE)
                              THEN CASE WHEN (0.3284820457312699::DOUBLE) * x::DOUBLE + (-0.9445102146785921::DOUBLE) * y::DOUBLE >= (-4.13446104309391::DOUBLE)
                                THEN 133
                                ELSE CASE WHEN (0.9028427167691966::DOUBLE) * x::DOUBLE + (0.4299709627135493::DOUBLE) * y::DOUBLE >= (3.7168975616778672::DOUBLE)
                                  THEN 140
                                  ELSE 128
                                END
                              END
                              ELSE CASE WHEN (0.24587657787934464::DOUBLE) * x::DOUBLE + (-0.9693011443562534::DOUBLE) * y::DOUBLE >= (-4.330691030994991::DOUBLE)
                                THEN CASE WHEN (0.680468404803194::DOUBLE) * x::DOUBLE + (0.7327774219124088::DOUBLE) * y::DOUBLE >= (4.63873469020797::DOUBLE)
                                  THEN 133
                                  ELSE 125
                                END
                                ELSE CASE WHEN (0.9091986455164647::DOUBLE) * x::DOUBLE + (-0.41636260998200364::DOUBLE) * y::DOUBLE >= (-0.5943257378576206::DOUBLE)
                                  THEN 133
                                  ELSE 121
                                END
                              END
                            END
                          END
                          ELSE CASE WHEN (0.9178168039269006::DOUBLE) * x::DOUBLE + (-0.3970041743223984::DOUBLE) * y::DOUBLE >= (-0.2696384164877337::DOUBLE)
                            THEN CASE WHEN (0.4179099090135984::DOUBLE) * x::DOUBLE + (0.9084884743067718::DOUBLE) * y::DOUBLE >= (4.903994523722655::DOUBLE)
                              THEN CASE WHEN (0.35232358127756347::DOUBLE) * x::DOUBLE + (-0.9358782474637137::DOUBLE) * y::DOUBLE >= (-3.6825219326601406::DOUBLE)
                                THEN CASE WHEN (0.3496352185621697::DOUBLE) * x::DOUBLE + (0.9368859129803285::DOUBLE) * y::DOUBLE >= (4.99503915057901::DOUBLE)
                                  THEN 151
                                  ELSE 146
                                END
                                ELSE CASE WHEN (0.9999326246248733::DOUBLE) * x::DOUBLE + (0.011608023553227275::DOUBLE) * y::DOUBLE >= (1.9168290136610524::DOUBLE)
                                  THEN 151
                                  ELSE 139
                                END
                              END
                              ELSE CASE WHEN (0.9997343006301537::DOUBLE) * x::DOUBLE + (0.023050556252240405::DOUBLE) * y::DOUBLE >= (1.8546019124442414::DOUBLE)
                                THEN CASE WHEN (0.3711251575029183::DOUBLE) * x::DOUBLE + (0.9285828543907291::DOUBLE) * y::DOUBLE >= (4.683065712547525::DOUBLE)
                                  THEN 146
                                  ELSE 137
                                END
                                ELSE 129
                              END
                            END
                            ELSE CASE WHEN (0.4179099090135984::DOUBLE) * x::DOUBLE + (0.9084884743067718::DOUBLE) * y::DOUBLE >= (4.903994523722655::DOUBLE)
                              THEN CASE WHEN (0.680468404803194::DOUBLE) * x::DOUBLE + (0.7327774219124088::DOUBLE) * y::DOUBLE >= (4.63873469020797::DOUBLE)
                                THEN CASE WHEN (0.5196093801775328::DOUBLE) * x::DOUBLE + (-0.8544039396161047::DOUBLE) * y::DOUBLE >= (-3.2190707316078595::DOUBLE)
                                  THEN 139
                                  ELSE 133
                                END
                                ELSE CASE WHEN (0.9978187806563871::DOUBLE) * x::DOUBLE + (-0.0660127333883454::DOUBLE) * y::DOUBLE >= (1.3483088880287315::DOUBLE)
                                  THEN 139
                                  ELSE 125
                                END
                              END
                              ELSE CASE WHEN (0.5011274688257003::DOUBLE) * x::DOUBLE + (0.8653734800583773::DOUBLE) * y::DOUBLE >= (4.837679477055124::DOUBLE)
                                THEN CASE WHEN (0.2559927455857616::DOUBLE) * x::DOUBLE + (-0.9666787026760564::DOUBLE) * y::DOUBLE >= (-4.05645133289477::DOUBLE)
                                  THEN 129
                                  ELSE 125
                                END
                                ELSE CASE WHEN (0.6589029276015572::DOUBLE) * x::DOUBLE + (-0.7522279787392231::DOUBLE) * y::DOUBLE >= (-2.3972016522998754::DOUBLE)
                                  THEN 129
                                  ELSE 119
                                END
                              END
                            END
                          END
                        END
                        ELSE CASE WHEN (0.9997814707882031::DOUBLE) * x::DOUBLE + (0.020904800132439016::DOUBLE) * y::DOUBLE >= (1.7128507880786707::DOUBLE)
                          THEN CASE WHEN (0.7864382972099428::DOUBLE) * x::DOUBLE + (0.6176688471029808::DOUBLE) * y::DOUBLE >= (4.739015544213798::DOUBLE)
                            THEN CASE WHEN (0.9456775746433416::DOUBLE) * x::DOUBLE + (-0.325106020886552::DOUBLE) * y::DOUBLE >= (-0.018612468439345387::DOUBLE)
                              THEN CASE WHEN (0.01610352533929813::DOUBLE) * x::DOUBLE + (0.9998703298286467::DOUBLE) * y::DOUBLE >= (5.363934177399653::DOUBLE)
                                THEN CASE WHEN (0.12123448705629782::DOUBLE) * x::DOUBLE + (0.9926238961198729::DOUBLE) * y::DOUBLE >= (5.809776183751288::DOUBLE)
                                  THEN CASE WHEN (0.45332944143573867::DOUBLE) * x::DOUBLE + (-0.8913430414422728::DOUBLE) * y::DOUBLE >= (-4.03477178869778::DOUBLE)
                                    THEN 167
                                    ELSE 159
                                  END
                                  ELSE CASE WHEN (0.9928569280436481::DOUBLE) * x::DOUBLE + (-0.11931102394887909::DOUBLE) * y::DOUBLE >= (1.4201567111072162::DOUBLE)
                                    THEN 167
                                    ELSE 155
                                  END
                                END
                                ELSE CASE WHEN (0.7472866523862447::DOUBLE) * x::DOUBLE + (0.6645018127630352::DOUBLE) * y::DOUBLE >= (5.090294755798409::DOUBLE)
                                  THEN 167
                                  ELSE 153
                                END
                              END
                              ELSE CASE WHEN (0.34383828041231596::DOUBLE) * x::DOUBLE + (0.939028879706637::DOUBLE) * y::DOUBLE >= (5.847080680961339::DOUBLE)
                                THEN CASE WHEN (0.34399909656923::DOUBLE) * x::DOUBLE + (-0.9389699790512759::DOUBLE) * y::DOUBLE >= (-4.73700401894079::DOUBLE)
                                  THEN CASE WHEN (0.7102352576095924::DOUBLE) * x::DOUBLE + (0.7039644016910483::DOUBLE) * y::DOUBLE >= (5.3139471911228275::DOUBLE)
                                    THEN 159
                                    ELSE 138
                                  END
                                  ELSE CASE WHEN (0.9927551427270733::DOUBLE) * x::DOUBLE + (-0.12015501066933579::DOUBLE) * y::DOUBLE >= (1.1210288006981972::DOUBLE)
                                    THEN 159
                                    ELSE 130
                                  END
                                END
                                ELSE CASE WHEN (0.9820993925952034::DOUBLE) * x::DOUBLE + (0.18836343345812243::DOUBLE) * y::DOUBLE >= (2.6461124015859614::DOUBLE)
                                  THEN 138
                                  ELSE 122
                                END
                              END
                            END
                            ELSE CASE WHEN (0.5778417845353854::DOUBLE) * x::DOUBLE + (-0.8161488050870143::DOUBLE) * y::DOUBLE >= (-3.305973902253158::DOUBLE)
                              THEN CASE WHEN (0.2978902581209079::DOUBLE) * x::DOUBLE + (0.9546001226255205::DOUBLE) * y::DOUBLE >= (5.389037533786165::DOUBLE)
                                THEN CASE WHEN (0.5459801731406995::DOUBLE) * x::DOUBLE + (-0.8377980965228148::DOUBLE) * y::DOUBLE >= (-3.3750664392514813::DOUBLE)
                                  THEN CASE WHEN (0.8328760872212758::DOUBLE) * x::DOUBLE + (0.553459504692961::DOUBLE) * y::DOUBLE >= (4.416913771301017::DOUBLE)
                                    THEN 153
                                    ELSE 140
                                  END
                                  ELSE CASE WHEN (0.9996022103392689::DOUBLE) * x::DOUBLE + (-0.028203210541492493::DOUBLE) * y::DOUBLE >= (1.6845649715228375::DOUBLE)
                                    THEN 153
                                    ELSE 135
                                  END
                                END
                                ELSE CASE WHEN (0.9028427167691966::DOUBLE) * x::DOUBLE + (0.4299709627135493::DOUBLE) * y::DOUBLE >= (3.7168975616778672::DOUBLE)
                                  THEN 140
                                  ELSE 128
                                END
                              END
                              ELSE CASE WHEN (0.5740016750309398::DOUBLE) * x::DOUBLE + (-0.8188541244090277::DOUBLE) * y::DOUBLE >= (-3.458260673014603::DOUBLE)
                                THEN CASE WHEN (0.2060028127475205::DOUBLE) * x::DOUBLE + (0.9785513993348076::DOUBLE) * y::DOUBLE >= (5.6142481634997985::DOUBLE)
                                  THEN 138
                                  ELSE 135
                                END
                                ELSE CASE WHEN (0.9820993925952034::DOUBLE) * x::DOUBLE + (0.18836343345812243::DOUBLE) * y::DOUBLE >= (2.6461124015859614::DOUBLE)
                                  THEN 138
                                  ELSE 122
                                END
                              END
                            END
                          END
                          ELSE CASE WHEN (0.03672779430925995::DOUBLE) * x::DOUBLE + (-0.9993253069572374::DOUBLE) * y::DOUBLE >= (-5.095203917148643::DOUBLE)
                            THEN CASE WHEN (0.728525654239208::DOUBLE) * x::DOUBLE + (0.6850185188119617::DOUBLE) * y::DOUBLE >= (4.564971162444107::DOUBLE)
                              THEN CASE WHEN (0.02112151563917656::DOUBLE) * x::DOUBLE + (-0.9997769159052953::DOUBLE) * y::DOUBLE >= (-5.057807418198573::DOUBLE)
                                THEN CASE WHEN (0.8651599563350931::DOUBLE) * x::DOUBLE + (0.5014960119026468::DOUBLE) * y::DOUBLE >= (3.865626271162287::DOUBLE)
                                  THEN 128
                                  ELSE 121
                                END
                                ELSE CASE WHEN (0.5154986880597286::DOUBLE) * x::DOUBLE + (-0.856890367905194::DOUBLE) * y::DOUBLE >= (-3.5803641754160824::DOUBLE)
                                  THEN 128
                                  ELSE 120
                                END
                              END
                              ELSE CASE WHEN (0.8481358048846591::DOUBLE) * x::DOUBLE + (-0.5297788750720922::DOUBLE) * y::DOUBLE >= (-1.4415873523868503::DOUBLE)
                                THEN 121
                                ELSE 110
                              END
                            END
                            ELSE CASE WHEN (0.2347633731935288::DOUBLE) * x::DOUBLE + (-0.9720525493031722::DOUBLE) * y::DOUBLE >= (-4.908867687333926::DOUBLE)
                              THEN CASE WHEN (0.9994712598344209::DOUBLE) * x::DOUBLE + (-0.032514623863666166::DOUBLE) * y::DOUBLE >= (1.2544857048580589::DOUBLE)
                                THEN CASE WHEN (0.04212429330646893::DOUBLE) * x::DOUBLE + (0.9991123780203259::DOUBLE) * y::DOUBLE >= (5.408591769066691::DOUBLE)
                                  THEN 122
                                  ELSE 120
                                END
                                ELSE CASE WHEN (0.6011211378139576::DOUBLE) * x::DOUBLE + (0.7991579178568233::DOUBLE) * y::DOUBLE >= (5.137180800585057::DOUBLE)
                                  THEN 122
                                  ELSE 109
                                END
                              END
                              ELSE CASE WHEN (0.9945889677575118::DOUBLE) * x::DOUBLE + (-0.10388833050466706::DOUBLE) * y::DOUBLE >= (0.8200284237306428::DOUBLE)
                                THEN CASE WHEN (0.34383828041231596::DOUBLE) * x::DOUBLE + (0.939028879706637::DOUBLE) * y::DOUBLE >= (5.847080680961339::DOUBLE)
                                  THEN 130
                                  ELSE 122
                                END
                                ELSE 102
                              END
                            END
                          END
                        END
                      END
                      ELSE CASE WHEN (0.8682217339018967::DOUBLE) * x::DOUBLE + (-0.4961764008700776::DOUBLE) * y::DOUBLE >= (-1.3714898300395173::DOUBLE)
                        THEN CASE WHEN (0.6977376621914176::DOUBLE) * x::DOUBLE + (-0.7163533728263274::DOUBLE) * y::DOUBLE >= (-2.378520026334569::DOUBLE)
                          THEN CASE WHEN (0.6589029276015572::DOUBLE) * x::DOUBLE + (-0.7522279787392231::DOUBLE) * y::DOUBLE >= (-2.3972016522998754::DOUBLE)
                            THEN CASE WHEN (0.9807810560422892::DOUBLE) * x::DOUBLE + (-0.19511155811117897::DOUBLE) * y::DOUBLE >= (0.7370548463429548::DOUBLE)
                              THEN CASE WHEN (0.2737415866022112::DOUBLE) * x::DOUBLE + (-0.9618032770605973::DOUBLE) * y::DOUBLE >= (-3.695570486386203::DOUBLE)
                                THEN CASE WHEN (0.3711251575029183::DOUBLE) * x::DOUBLE + (0.9285828543907291::DOUBLE) * y::DOUBLE >= (4.683065712547525::DOUBLE)
                                  THEN 146
                                  ELSE 137
                                END
                                ELSE CASE WHEN (0.9997343006301537::DOUBLE) * x::DOUBLE + (0.023050556252240405::DOUBLE) * y::DOUBLE >= (1.8546019124442414::DOUBLE)
                                  THEN 146
                                  ELSE 129
                                END
                              END
                              ELSE CASE WHEN (0.032342984033829014::DOUBLE) * x::DOUBLE + (0.9994768288378613::DOUBLE) * y::DOUBLE >= (4.382760597024387::DOUBLE)
                                THEN CASE WHEN (0.9908600030781168::DOUBLE) * x::DOUBLE + (0.1348942337538345::DOUBLE) * y::DOUBLE >= (2.132554394107064::DOUBLE)
                                  THEN 129
                                  ELSE 115
                                END
                                ELSE CASE WHEN (0.6145717585083135::DOUBLE) * x::DOUBLE + (0.7888609216103933::DOUBLE) * y::DOUBLE >= (4.37936363076774::DOUBLE)
                                  THEN 129
                                  ELSE 114
                                END
                              END
                            END
                            ELSE CASE WHEN (0.5011274688257003::DOUBLE) * x::DOUBLE + (0.8653734800583773::DOUBLE) * y::DOUBLE >= (4.837679477055124::DOUBLE)
                              THEN 125
                              ELSE CASE WHEN (0.7707793074246193::DOUBLE) * x::DOUBLE + (-0.6371022361018868::DOUBLE) * y::DOUBLE >= (-1.8038756350921876::DOUBLE)
                                THEN CASE WHEN (0.2751159060692435::DOUBLE) * x::DOUBLE + (0.9614110662082578::DOUBLE) * y::DOUBLE >= (4.7791370228586185::DOUBLE)
                                  THEN 119
                                  ELSE 115
                                END
                                ELSE CASE WHEN (0.8993930317467556::DOUBLE) * x::DOUBLE + (0.43714090914186887::DOUBLE) * y::DOUBLE >= (3.280435377640669::DOUBLE)
                                  THEN 119
                                  ELSE 105
                                END
                              END
                            END
                          END
                          ELSE CASE WHEN (0.7020427831827243::DOUBLE) * x::DOUBLE + (0.71213476995654::DOUBLE) * y::DOUBLE >= (4.399785667646748::DOUBLE)
                            THEN CASE WHEN (0.03672779430925995::DOUBLE) * x::DOUBLE + (-0.9993253069572374::DOUBLE) * y::DOUBLE >= (-5.095203917148643::DOUBLE)
                              THEN CASE WHEN (0.06366514746742459::DOUBLE) * x::DOUBLE + (-0.9979713167210524::DOUBLE) * y::DOUBLE >= (-4.829455886128542::DOUBLE)
                                THEN CASE WHEN (0.9929826971278378::DOUBLE) * x::DOUBLE + (-0.11825972773824837::DOUBLE) * y::DOUBLE >= (0.8902987540401758::DOUBLE)
                                  THEN CASE WHEN (0.24587657787934464::DOUBLE) * x::DOUBLE + (-0.9693011443562534::DOUBLE) * y::DOUBLE >= (-4.330691030994991::DOUBLE)
                                    THEN 125
                                    ELSE 121
                                  END
                                  ELSE CASE WHEN (0.15410923047961872::DOUBLE) * x::DOUBLE + (0.9880538168951019::DOUBLE) * y::DOUBLE >= (5.010945701011286::DOUBLE)
                                    THEN CASE WHEN (0.9781519540012841::DOUBLE) * x::DOUBLE + (0.2078912092501027::DOUBLE) * y::DOUBLE >= (2.4473039102803904::DOUBLE)
                                      THEN 121
                                      ELSE 113
                                    END
                                    ELSE CASE WHEN (0.6687841286155198::DOUBLE) * x::DOUBLE + (0.7434566492486161::DOUBLE) * y::DOUBLE >= (4.584729565276214::DOUBLE)
                                      THEN 121
                                      ELSE 112
                                    END
                                  END
                                END
                                ELSE CASE WHEN (0.8886648709868362::DOUBLE) * x::DOUBLE + (0.4585572451438854::DOUBLE) * y::DOUBLE >= (3.414952215822092::DOUBLE)
                                  THEN CASE WHEN (0.28422936790194997::DOUBLE) * x::DOUBLE + (-0.9587563123244915::DOUBLE) * y::DOUBLE >= (-4.403939515643078::DOUBLE)
                                    THEN CASE WHEN (0.9781519540012841::DOUBLE) * x::DOUBLE + (0.2078912092501027::DOUBLE) * y::DOUBLE >= (2.4473039102803904::DOUBLE)
                                      THEN 121
                                      ELSE 113
                                    END
                                    ELSE CASE WHEN (0.8481358048846591::DOUBLE) * x::DOUBLE + (-0.5297788750720922::DOUBLE) * y::DOUBLE >= (-1.4415873523868503::DOUBLE)
                                      THEN 121
                                      ELSE 110
                                    END
                                  END
                                  ELSE CASE WHEN (0.9825048477861738::DOUBLE) * x::DOUBLE + (-0.18623701049111444::DOUBLE) * y::DOUBLE >= (0.32887423372804325::DOUBLE)
                                    THEN 113
                                    ELSE 96
                                  END
                                END
                              END
                              ELSE 109
                            END
                            ELSE CASE WHEN (0.1666241154723587::DOUBLE) * x::DOUBLE + (0.9860204887034825::DOUBLE) * y::DOUBLE >= (5.005180069844461::DOUBLE)
                              THEN CASE WHEN (0.7317107118731484::DOUBLE) * x::DOUBLE + (-0.6816153124234301::DOUBLE) * y::DOUBLE >= (-2.401896832536524::DOUBLE)
                                THEN CASE WHEN (0.15410923047961872::DOUBLE) * x::DOUBLE + (0.9880538168951019::DOUBLE) * y::DOUBLE >= (5.010945701011286::DOUBLE)
                                  THEN 113
                                  ELSE 112
                                END
                                ELSE CASE WHEN (0.9825048477861738::DOUBLE) * x::DOUBLE + (-0.18623701049111444::DOUBLE) * y::DOUBLE >= (0.32887423372804325::DOUBLE)
                                  THEN 113
                                  ELSE 96
                                END
                              END
                              ELSE CASE WHEN (0.14248303607947624::DOUBLE) * x::DOUBLE + (0.9897972441008182::DOUBLE) * y::DOUBLE >= (4.7911096636480295::DOUBLE)
                                THEN CASE WHEN (0.6942027364021282::DOUBLE) * x::DOUBLE + (-0.719779522334303::DOUBLE) * y::DOUBLE >= (-2.584766752883187::DOUBLE)
                                  THEN CASE WHEN (0.5559067495576115::DOUBLE) * x::DOUBLE + (-0.8312446606121997::DOUBLE) * y::DOUBLE >= (-3.125601761002522::DOUBLE)
                                    THEN CASE WHEN (0.1707753228249484::DOUBLE) * x::DOUBLE + (0.9853099964549403::DOUBLE) * y::DOUBLE >= (4.83181635095292::DOUBLE)
                                      THEN 112
                                      ELSE 105
                                    END
                                    ELSE CASE WHEN (0.7475283329553939::DOUBLE) * x::DOUBLE + (0.6642299236175149::DOUBLE) * y::DOUBLE >= (4.116206333112766::DOUBLE)
                                      THEN 112
                                      ELSE 101
                                    END
                                  END
                                  ELSE CASE WHEN (0.9994147808789188::DOUBLE) * x::DOUBLE + (-0.03420666251978768::DOUBLE) * y::DOUBLE >= (1.0822166988139552::DOUBLE)
                                    THEN 112
                                    ELSE 93
                                  END
                                END
                                ELSE CASE WHEN (0.7900992373424275::DOUBLE) * x::DOUBLE + (0.6129789516377494::DOUBLE) * y::DOUBLE >= (3.758280366207316::DOUBLE)
                                  THEN CASE WHEN (0.5559067495576115::DOUBLE) * x::DOUBLE + (-0.8312446606121997::DOUBLE) * y::DOUBLE >= (-3.125601761002522::DOUBLE)
                                    THEN 105
                                    ELSE 101
                                  END
                                  ELSE CASE WHEN (0.9990597079676131::DOUBLE) * x::DOUBLE + (-0.043355506174736144::DOUBLE) * y::DOUBLE >= (1.0118422063239856::DOUBLE)
                                    THEN 105
                                    ELSE 91
                                  END
                                END
                              END
                            END
                          END
                        END
                        ELSE CASE WHEN (0.8077262975072129::DOUBLE) * x::DOUBLE + (0.5895576547847458::DOUBLE) * y::DOUBLE >= (3.7313276008414333::DOUBLE)
                          THEN CASE WHEN (0.1666241154723587::DOUBLE) * x::DOUBLE + (0.9860204887034825::DOUBLE) * y::DOUBLE >= (5.005180069844461::DOUBLE)
                            THEN CASE WHEN (0.9273507848459899::DOUBLE) * x::DOUBLE + (0.37419316114211226::DOUBLE) * y::DOUBLE >= (2.874851700027619::DOUBLE)
                              THEN CASE WHEN (0.2347633731935288::DOUBLE) * x::DOUBLE + (-0.9720525493031722::DOUBLE) * y::DOUBLE >= (-4.908867687333926::DOUBLE)
                                THEN CASE WHEN (0.09430566920533673::DOUBLE) * x::DOUBLE + (-0.9955432892424788::DOUBLE) * y::DOUBLE >= (-4.96918472748538::DOUBLE)
                                  THEN CASE WHEN (0.8886648709868362::DOUBLE) * x::DOUBLE + (0.4585572451438854::DOUBLE) * y::DOUBLE >= (3.414952215822092::DOUBLE)
                                    THEN 110
                                    ELSE 96
                                  END
                                  ELSE CASE WHEN (0.9999883089711714::DOUBLE) * x::DOUBLE + (0.004835485598883832::DOUBLE) * y::DOUBLE >= (1.2630221452956636::DOUBLE)
                                    THEN CASE WHEN (0.03672779430925995::DOUBLE) * x::DOUBLE + (-0.9993253069572374::DOUBLE) * y::DOUBLE >= (-5.095203917148643::DOUBLE)
                                      THEN 110
                                      ELSE 109
                                    END
                                    ELSE CASE WHEN (0.7866779580106058::DOUBLE) * x::DOUBLE + (-0.6173635803805273::DOUBLE) * y::DOUBLE >= (-2.2017757384590335::DOUBLE)
                                      THEN 110
                                      ELSE 95
                                    END
                                  END
                                END
                                ELSE CASE WHEN (0.6364892683874814::DOUBLE) * x::DOUBLE + (-0.7712855575126301::DOUBLE) * y::DOUBLE >= (-3.4660976144357263::DOUBLE)
                                  THEN CASE WHEN (0.44565563805506864::DOUBLE) * x::DOUBLE + (0.8952044751171264::DOUBLE) * y::DOUBLE >= (5.3396187852383665::DOUBLE)
                                    THEN 102
                                    ELSE 95
                                  END
                                  ELSE CASE WHEN (0.9960589872356981::DOUBLE) * x::DOUBLE + (0.08869325761857731::DOUBLE) * y::DOUBLE >= (1.5872080880993729::DOUBLE)
                                    THEN 102
                                    ELSE 79
                                  END
                                END
                              END
                              ELSE CASE WHEN (0.9477885264587154::DOUBLE) * x::DOUBLE + (-0.31889952824238676::DOUBLE) * y::DOUBLE >= (-0.9787107142130356::DOUBLE)
                                THEN CASE WHEN (0.1515433475377866::DOUBLE) * x::DOUBLE + (0.9884506127354273::DOUBLE) * y::DOUBLE >= (5.375704465702761::DOUBLE)
                                  THEN 79
                                  ELSE CASE WHEN (0.8730729275529769::DOUBLE) * x::DOUBLE + (-0.48758964629499063::DOUBLE) * y::DOUBLE >= (-1.5688425513387074::DOUBLE)
                                    THEN 96
                                    ELSE 75
                                  END
                                END
                                ELSE CASE WHEN (0.10914538275569358::DOUBLE) * x::DOUBLE + (0.9940257971617806::DOUBLE) * y::DOUBLE >= (5.505988453300082::DOUBLE)
                                  THEN CASE WHEN (0.8218126777463474::DOUBLE) * x::DOUBLE + (-0.5697577754584648::DOUBLE) * y::DOUBLE >= (-2.557752883015283::DOUBLE)
                                    THEN 79
                                    ELSE 52
                                  END
                                  ELSE CASE WHEN (0.867427946953389::DOUBLE) * x::DOUBLE + (0.4975628169831712::DOUBLE) * y::DOUBLE >= (3.305806670171443::DOUBLE)
                                    THEN 79
                                    ELSE 44
                                  END
                                END
                              END
                            END
                            ELSE 93
                          END
                          ELSE CASE WHEN (0.9477885264587154::DOUBLE) * x::DOUBLE + (-0.31889952824238676::DOUBLE) * y::DOUBLE >= (-0.9787107142130356::DOUBLE)
                            THEN CASE WHEN (0.5632608420673447::DOUBLE) * x::DOUBLE + (-0.8262791439904469::DOUBLE) * y::DOUBLE >= (-3.5547595246508084::DOUBLE)
                              THEN CASE WHEN (0.690933066110411::DOUBLE) * x::DOUBLE + (0.7229187355126898::DOUBLE) * y::DOUBLE >= (4.024719272570752::DOUBLE)
                                THEN CASE WHEN (0.5524236963316931::DOUBLE) * x::DOUBLE + (-0.8335634707274722::DOUBLE) * y::DOUBLE >= (-3.3450950862326945::DOUBLE)
                                  THEN CASE WHEN (0.14248303607947624::DOUBLE) * x::DOUBLE + (0.9897972441008182::DOUBLE) * y::DOUBLE >= (4.7911096636480295::DOUBLE)
                                    THEN 93
                                    ELSE 91
                                  END
                                  ELSE CASE WHEN (0.9965097947653::DOUBLE) * x::DOUBLE + (-0.08347591830474058::DOUBLE) * y::DOUBLE >= (0.6304824056416967::DOUBLE)
                                    THEN 93
                                    ELSE 80
                                  END
                                END
                                ELSE CASE WHEN (0.9510787332899715::DOUBLE) * x::DOUBLE + (-0.30894860913029376::DOUBLE) * y::DOUBLE >= (-0.523071301526275::DOUBLE)
                                  THEN 91
                                  ELSE 66
                                END
                              END
                              ELSE CASE WHEN (0.7686665234038839::DOUBLE) * x::DOUBLE + (0.6396497289909426::DOUBLE) * y::DOUBLE >= (3.7931803310579504::DOUBLE)
                                THEN CASE WHEN (0.16756884382455567::DOUBLE) * x::DOUBLE + (-0.9858603768177833::DOUBLE) * y::DOUBLE >= (-4.74490306518132::DOUBLE)
                                  THEN 80
                                  ELSE 75
                                END
                                ELSE CASE WHEN (0.9465313373942391::DOUBLE) * x::DOUBLE + (-0.3226118834306529::DOUBLE) * y::DOUBLE >= (-0.8264907421515844::DOUBLE)
                                  THEN 80
                                  ELSE 54
                                END
                              END
                            END
                            ELSE CASE WHEN (0.264353527481402::DOUBLE) * x::DOUBLE + (-0.9644258460390511::DOUBLE) * y::DOUBLE >= (-4.743473655053474::DOUBLE)
                              THEN CASE WHEN (0.17861081771134646::DOUBLE) * x::DOUBLE + (-0.983919801506446::DOUBLE) * y::DOUBLE >= (-4.848145706776263::DOUBLE)
                                THEN CASE WHEN (0.9631229352414196::DOUBLE) * x::DOUBLE + (0.2690617245390959::DOUBLE) * y::DOUBLE >= (1.7159218289321037::DOUBLE)
                                  THEN 54
                                  ELSE 22
                                END
                                ELSE CASE WHEN (0.9127441060569917::DOUBLE) * x::DOUBLE + (-0.4085317574659566::DOUBLE) * y::DOUBLE >= (-1.6896837411877077::DOUBLE)
                                  THEN 54
                                  ELSE 16
                                END
                              END
                              ELSE CASE WHEN (0.24025806059224442::DOUBLE) * x::DOUBLE + (0.970709052353203::DOUBLE) * y::DOUBLE >= (5.184558209655645::DOUBLE)
                                THEN CASE WHEN (0.8085295173421316::DOUBLE) * x::DOUBLE + (-0.5884556224444626::DOUBLE) * y::DOUBLE >= (-2.831795722213281::DOUBLE)
                                  THEN 44
                                  ELSE 24
                                END
                                ELSE CASE WHEN (0.9539331666250613::DOUBLE) * x::DOUBLE + (0.3000191887407921::DOUBLE) * y::DOUBLE >= (1.889255426630587::DOUBLE)
                                  THEN 44
                                  ELSE 16
                                END
                              END
                            END
                          END
                        END
                      END
                    END
                    ELSE CASE WHEN (0.006711171736615229::DOUBLE) * x::DOUBLE + (-0.9999774798333818::DOUBLE) * y::DOUBLE >= (-6.534906795509816::DOUBLE)
                      THEN CASE WHEN (0.9949840239488029::DOUBLE) * x::DOUBLE + (0.10003395466864128::DOUBLE) * y::DOUBLE >= (1.690488898997438::DOUBLE)
                        THEN CASE WHEN (0.9857855671681949::DOUBLE) * x::DOUBLE + (0.16800837944245617::DOUBLE) * y::DOUBLE >= (2.8231171413479306::DOUBLE)
                          THEN CASE WHEN (0.43694371546774863::DOUBLE) * x::DOUBLE + (-0.8994888490210644::DOUBLE) * y::DOUBLE >= (-4.566790297697223::DOUBLE)
                            THEN CASE WHEN (0.17114171898757136::DOUBLE) * x::DOUBLE + (-0.9852464219787753::DOUBLE) * y::DOUBLE >= (-5.536911593899341::DOUBLE)
                              THEN CASE WHEN (0.8202670335587482::DOUBLE) * x::DOUBLE + (0.5719807633624853::DOUBLE) * y::DOUBLE >= (5.113460860285328::DOUBLE)
                                THEN 174
                                ELSE 159
                              END
                              ELSE CASE WHEN (0.8566308161216728::DOUBLE) * x::DOUBLE + (-0.5159298836767618::DOUBLE) * y::DOUBLE >= (-1.3155491509266422::DOUBLE)
                                THEN 174
                                ELSE 150
                              END
                            END
                            ELSE CASE WHEN (0.667596835295674::DOUBLE) * x::DOUBLE + (0.744522978492404::DOUBLE) * y::DOUBLE >= (5.994556975655671::DOUBLE)
                              THEN CASE WHEN (0.9773043641089747::DOUBLE) * x::DOUBLE + (0.2118399865312322::DOUBLE) * y::DOUBLE >= (3.186585831325245::DOUBLE)
                                THEN CASE WHEN (0.34589334804930194::DOUBLE) * x::DOUBLE + (-0.9382738362414486::DOUBLE) * y::DOUBLE >= (-5.374635978819692::DOUBLE)
                                  THEN CASE WHEN (0.6150446905900052::DOUBLE) * x::DOUBLE + (0.7884922501692992::DOUBLE) * y::DOUBLE >= (6.419205632686747::DOUBLE)
                                    THEN 173
                                    ELSE 162
                                  END
                                  ELSE CASE WHEN (0.9573387148085443::DOUBLE) * x::DOUBLE + (-0.2889681386048031::DOUBLE) * y::DOUBLE >= (0.13193484953615187::DOUBLE)
                                    THEN 173
                                    ELSE 156
                                  END
                                END
                                ELSE CASE WHEN (0.8601781565034335::DOUBLE) * x::DOUBLE + (-0.5099936657198347::DOUBLE) * y::DOUBLE >= (-1.6646997706072828::DOUBLE)
                                  THEN 162
                                  ELSE 132
                                END
                              END
                              ELSE CASE WHEN (0.5434393301378326::DOUBLE) * x::DOUBLE + (-0.8394484465762884::DOUBLE) * y::DOUBLE >= (-4.356836092784149::DOUBLE)
                                THEN 150
                                ELSE 132
                              END
                            END
                          END
                          ELSE CASE WHEN (0.5974383716174139::DOUBLE) * x::DOUBLE + (0.801914828469416::DOUBLE) * y::DOUBLE >= (5.5844319779309215::DOUBLE)
                            THEN CASE WHEN (0.0176460553128472::DOUBLE) * x::DOUBLE + (-0.9998442962441182::DOUBLE) * y::DOUBLE >= (-6.056758181103868::DOUBLE)
                              THEN CASE WHEN (0.996954183322744::DOUBLE) * x::DOUBLE + (-0.077989463104195::DOUBLE) * y::DOUBLE >= (1.032368424226409::DOUBLE)
                                THEN CASE WHEN (0.14273767442698831::DOUBLE) * x::DOUBLE + (0.9897605550329711::DOUBLE) * y::DOUBLE >= (6.141191597046562::DOUBLE)
                                  THEN CASE WHEN (0.6916391535252506::DOUBLE) * x::DOUBLE + (-0.7222432286362225::DOUBLE) * y::DOUBLE >= (-3.010747511041137::DOUBLE)
                                    THEN 159
                                    ELSE 134
                                  END
                                  ELSE CASE WHEN (0.9927551427270733::DOUBLE) * x::DOUBLE + (-0.12015501066933579::DOUBLE) * y::DOUBLE >= (1.1210288006981972::DOUBLE)
                                    THEN 159
                                    ELSE 130
                                  END
                                END
                                ELSE CASE WHEN (0.7981260975789132::DOUBLE) * x::DOUBLE + (0.6024904417195805::DOUBLE) * y::DOUBLE >= (4.807945003615307::DOUBLE)
                                  THEN 134
                                  ELSE 108
                                END
                              END
                              ELSE CASE WHEN (0.8271241102814616::DOUBLE) * x::DOUBLE + (-0.5620193112261361::DOUBLE) * y::DOUBLE >= (-2.6799800617241614::DOUBLE)
                                THEN CASE WHEN (0.8119774175110341::DOUBLE) * x::DOUBLE + (0.5836888498610469::DOUBLE) * y::DOUBLE >= (4.981722218343092::DOUBLE)
                                  THEN CASE WHEN (0.030059002152003248::DOUBLE) * x::DOUBLE + (-0.9995481260998021::DOUBLE) * y::DOUBLE >= (-6.287674800916823::DOUBLE)
                                    THEN 134
                                    ELSE 132
                                  END
                                  ELSE CASE WHEN (0.8662196450682539::DOUBLE) * x::DOUBLE + (-0.49966341320715896::DOUBLE) * y::DOUBLE >= (-1.7989131218179513::DOUBLE)
                                    THEN 134
                                    ELSE 106
                                  END
                                END
                                ELSE 81
                              END
                            END
                            ELSE CASE WHEN (0.9945889677575118::DOUBLE) * x::DOUBLE + (-0.10388833050466706::DOUBLE) * y::DOUBLE >= (0.8200284237306428::DOUBLE)
                              THEN CASE WHEN (0.4551129224096312::DOUBLE) * x::DOUBLE + (-0.8904337301875782::DOUBLE) * y::DOUBLE >= (-4.388202444946357::DOUBLE)
                                THEN CASE WHEN (0.34383828041231596::DOUBLE) * x::DOUBLE + (0.939028879706637::DOUBLE) * y::DOUBLE >= (5.847080680961339::DOUBLE)
                                  THEN 130
                                  ELSE 122
                                END
                                ELSE CASE WHEN (0.996954183322744::DOUBLE) * x::DOUBLE + (-0.077989463104195::DOUBLE) * y::DOUBLE >= (1.032368424226409::DOUBLE)
                                  THEN 130
                                  ELSE 108
                                END
                              END
                              ELSE CASE WHEN (0.5924401572745552::DOUBLE) * x::DOUBLE + (-0.8056144611714093::DOUBLE) * y::DOUBLE >= (-3.9109737368059267::DOUBLE)
                                THEN CASE WHEN (0.17940778070826907::DOUBLE) * x::DOUBLE + (0.9837747954798058::DOUBLE) * y::DOUBLE >= (5.813409796817683::DOUBLE)
                                  THEN 108
                                  ELSE 102
                                END
                                ELSE CASE WHEN (0.9947426772559225::DOUBLE) * x::DOUBLE + (-0.10240608402687514::DOUBLE) * y::DOUBLE >= (0.5594257592210017::DOUBLE)
                                  THEN 108
                                  ELSE 86
                                END
                              END
                            END
                          END
                        END
                        ELSE CASE WHEN (0.987548875506112::DOUBLE) * x::DOUBLE + (0.15731248674728135::DOUBLE) * y::DOUBLE >= (1.47877357779221::DOUBLE)
                          THEN CASE WHEN (0.30901583494309537::DOUBLE) * x::DOUBLE + (0.9510568930166172::DOUBLE) * y::DOUBLE >= (5.8662824154957525::DOUBLE)
                            THEN CASE WHEN (0.523832401379041::DOUBLE) * x::DOUBLE + (-0.8518213517313753::DOUBLE) * y::DOUBLE >= (-5.115745056819683::DOUBLE)
                              THEN CASE WHEN (0.47708467946517785::DOUBLE) * x::DOUBLE + (0.8788573312088878::DOUBLE) * y::DOUBLE >= (6.014495207853854::DOUBLE)
                                THEN CASE WHEN (0.8271241102814616::DOUBLE) * x::DOUBLE + (-0.5620193112261361::DOUBLE) * y::DOUBLE >= (-2.6799800617241614::DOUBLE)
                                  THEN 106
                                  ELSE 81
                                END
                                ELSE CASE WHEN (0.6229361423447034::DOUBLE) * x::DOUBLE + (-0.7822726906652817::DOUBLE) * y::DOUBLE >= (-4.1772491103682645::DOUBLE)
                                  THEN CASE WHEN (0.5974383716174139::DOUBLE) * x::DOUBLE + (0.801914828469416::DOUBLE) * y::DOUBLE >= (5.5844319779309215::DOUBLE)
                                    THEN 106
                                    ELSE 86
                                  END
                                  ELSE CASE WHEN (0.9758970145999258::DOUBLE) * x::DOUBLE + (0.2182315671367276::DOUBLE) * y::DOUBLE >= (2.376660958992379::DOUBLE)
                                    THEN 106
                                    ELSE 62
                                  END
                                END
                              END
                              ELSE CASE WHEN (0.9994411714040728::DOUBLE) * x::DOUBLE + (-0.03342670941709103::DOUBLE) * y::DOUBLE >= (0.5076560198870503::DOUBLE)
                                THEN 81
                                ELSE 43
                              END
                            END
                            ELSE CASE WHEN (0.8218126777463474::DOUBLE) * x::DOUBLE + (-0.5697577754584648::DOUBLE) * y::DOUBLE >= (-2.557752883015283::DOUBLE)
                              THEN CASE WHEN (0.14386887404928075::DOUBLE) * x::DOUBLE + (0.989596759836951::DOUBLE) * y::DOUBLE >= (5.754059725141665::DOUBLE)
                                THEN CASE WHEN (0.5924401572745552::DOUBLE) * x::DOUBLE + (-0.8056144611714093::DOUBLE) * y::DOUBLE >= (-3.9109737368059267::DOUBLE)
                                  THEN 102
                                  ELSE 86
                                END
                                ELSE CASE WHEN (0.9960589872356981::DOUBLE) * x::DOUBLE + (0.08869325761857731::DOUBLE) * y::DOUBLE >= (1.5872080880993729::DOUBLE)
                                  THEN 102
                                  ELSE 79
                                END
                              END
                              ELSE CASE WHEN (0.10914538275569358::DOUBLE) * x::DOUBLE + (0.9940257971617806::DOUBLE) * y::DOUBLE >= (5.505988453300082::DOUBLE)
                                THEN CASE WHEN (0.925702860339498::DOUBLE) * x::DOUBLE + (0.3782515226132895::DOUBLE) * y::DOUBLE >= (2.9261699451881213::DOUBLE)
                                  THEN 86
                                  ELSE 52
                                END
                                ELSE 44
                              END
                            END
                          END
                          ELSE CASE WHEN (0.3317978555558994::DOUBLE) * x::DOUBLE + (0.9433505091155177::DOUBLE) * y::DOUBLE >= (5.6470496577616744::DOUBLE)
                            THEN CASE WHEN (0.523832401379041::DOUBLE) * x::DOUBLE + (-0.8518213517313753::DOUBLE) * y::DOUBLE >= (-5.115745056819683::DOUBLE)
                              THEN CASE WHEN (0.6541371213453456::DOUBLE) * x::DOUBLE + (-0.7563759822191769::DOUBLE) * y::DOUBLE >= (-4.179968462536453::DOUBLE)
                                THEN CASE WHEN (0.30901583494309537::DOUBLE) * x::DOUBLE + (0.9510568930166172::DOUBLE) * y::DOUBLE >= (5.8662824154957525::DOUBLE)
                                  THEN 62
                                  ELSE 52
                                END
                                ELSE CASE WHEN (0.9761490572260096::DOUBLE) * x::DOUBLE + (0.2171014004486672::DOUBLE) * y::DOUBLE >= (1.8276885802624805::DOUBLE)
                                  THEN 62
                                  ELSE 26
                                END
                              END
                              ELSE CASE WHEN (0.24104451861051224::DOUBLE) * x::DOUBLE + (-0.9705140596858071::DOUBLE) * y::DOUBLE >= (-6.049407792166292::DOUBLE)
                                THEN CASE WHEN (0.4204415335202433::DOUBLE) * x::DOUBLE + (0.9073196332556384::DOUBLE) * y::DOUBLE >= (5.910938068969741::DOUBLE)
                                  THEN 43
                                  ELSE 26
                                END
                                ELSE CASE WHEN (0.9596375113928648::DOUBLE) * x::DOUBLE + (0.2812398384434706::DOUBLE) * y::DOUBLE >= (2.160224289245814::DOUBLE)
                                  THEN 43
                                  ELSE 17
                                END
                              END
                            END
                            ELSE CASE WHEN (0.9976332928766867::DOUBLE) * x::DOUBLE + (-0.06875909353692167::DOUBLE) * y::DOUBLE >= (-0.025360221400141048::DOUBLE)
                              THEN CASE WHEN (0.8085295173421316::DOUBLE) * x::DOUBLE + (-0.5884556224444626::DOUBLE) * y::DOUBLE >= (-2.831795722213281::DOUBLE)
                                THEN CASE WHEN (0.10914538275569358::DOUBLE) * x::DOUBLE + (0.9940257971617806::DOUBLE) * y::DOUBLE >= (5.505988453300082::DOUBLE)
                                  THEN 52
                                  ELSE 44
                                END
                                ELSE CASE WHEN (0.8074053872733822::DOUBLE) * x::DOUBLE + (0.5899970682994278::DOUBLE) * y::DOUBLE >= (3.6318131988888487::DOUBLE)
                                  THEN 52
                                  ELSE 24
                                END
                              END
                              ELSE CASE WHEN (0.320604886666528::DOUBLE) * x::DOUBLE + (-0.9472130207326875::DOUBLE) * y::DOUBLE >= (-5.241421563428839::DOUBLE)
                                THEN CASE WHEN (0.24025806059224442::DOUBLE) * x::DOUBLE + (0.970709052353203::DOUBLE) * y::DOUBLE >= (5.184558209655645::DOUBLE)
                                  THEN 24
                                  ELSE 16
                                END
                                ELSE 12
                              END
                            END
                          END
                        END
                      END
                      ELSE CASE WHEN (0.9454106402045591::DOUBLE) * x::DOUBLE + (-0.32588145296718807::DOUBLE) * y::DOUBLE >= (-1.187339397403096::DOUBLE)
                        THEN CASE WHEN (0.2096852639082151::DOUBLE) * x::DOUBLE + (-0.9777689349226342::DOUBLE) * y::DOUBLE >= (-6.4826948563689735::DOUBLE)
                          THEN CASE WHEN (0.9982347062527358::DOUBLE) * x::DOUBLE + (0.059392518321034::DOUBLE) * y::DOUBLE >= (1.9986968084200272::DOUBLE)
                            THEN CASE WHEN (0.9903559757494275::DOUBLE) * x::DOUBLE + (0.13854617027330357::DOUBLE) * y::DOUBLE >= (2.973122839927526::DOUBLE)
                              THEN CASE WHEN (0.6080092856633282::DOUBLE) * x::DOUBLE + (0.7939299141279218::DOUBLE) * y::DOUBLE >= (6.667340194442403::DOUBLE)
                                THEN CASE WHEN (0.14872707099878524::DOUBLE) * x::DOUBLE + (-0.9888782828802148::DOUBLE) * y::DOUBLE >= (-6.337624751684039::DOUBLE)
                                  THEN 173
                                  ELSE 169
                                END
                                ELSE CASE WHEN (0.9573387148085443::DOUBLE) * x::DOUBLE + (-0.2889681386048031::DOUBLE) * y::DOUBLE >= (0.13193484953615187::DOUBLE)
                                  THEN 173
                                  ELSE 156
                                END
                              END
                              ELSE CASE WHEN (0.4812953345952695::DOUBLE) * x::DOUBLE + (0.8765584982742608::DOUBLE) * y::DOUBLE >= (6.750773501889453::DOUBLE)
                                THEN CASE WHEN (0.44948744132484814::DOUBLE) * x::DOUBLE + (-0.8932866505726149::DOUBLE) * y::DOUBLE >= (-5.181842743975436::DOUBLE)
                                  THEN 156
                                  ELSE 145
                                END
                                ELSE CASE WHEN (0.9773043641089747::DOUBLE) * x::DOUBLE + (0.2118399865312322::DOUBLE) * y::DOUBLE >= (3.186585831325245::DOUBLE)
                                  THEN 156
                                  ELSE 132
                                END
                              END
                            END
                            ELSE CASE WHEN (0.8271241102814616::DOUBLE) * x::DOUBLE + (-0.5620193112261361::DOUBLE) * y::DOUBLE >= (-2.6799800617241614::DOUBLE)
                              THEN CASE WHEN (0.012232302863041356::DOUBLE) * x::DOUBLE + (0.9999251825845106::DOUBLE) * y::DOUBLE >= (6.607007102100116::DOUBLE)
                                THEN CASE WHEN (0.7636755662562082::DOUBLE) * x::DOUBLE + (-0.6456002087230608::DOUBLE) * y::DOUBLE >= (-3.1873028536452304::DOUBLE)
                                  THEN 132
                                  ELSE 107
                                END
                                ELSE CASE WHEN (0.8119774175110341::DOUBLE) * x::DOUBLE + (0.5836888498610469::DOUBLE) * y::DOUBLE >= (4.981722218343092::DOUBLE)
                                  THEN 132
                                  ELSE 106
                                END
                              END
                              ELSE CASE WHEN (0.7952359727622326::DOUBLE) * x::DOUBLE + (0.6063000475217742::DOUBLE) * y::DOUBLE >= (4.9824610528664754::DOUBLE)
                                THEN 107
                                ELSE 81
                              END
                            END
                          END
                          ELSE CASE WHEN (0.854470988605003::DOUBLE) * x::DOUBLE + (-0.519499114178637::DOUBLE) * y::DOUBLE >= (-2.379466813424045::DOUBLE)
                            THEN CASE WHEN (0.4783683406650493::DOUBLE) * x::DOUBLE + (0.8781592854655512::DOUBLE) * y::DOUBLE >= (7.380879666471911::DOUBLE)
                              THEN CASE WHEN (0.2828548515151774::DOUBLE) * x::DOUBLE + (-0.9591627249712777::DOUBLE) * y::DOUBLE >= (-6.3626528915648795::DOUBLE)
                                THEN CASE WHEN (0.738514655909946::DOUBLE) * x::DOUBLE + (0.6742374233207572::DOUBLE) * y::DOUBLE >= (6.536339599419889::DOUBLE)
                                  THEN 190
                                  ELSE 169
                                END
                                ELSE CASE WHEN (0.926101425193453::DOUBLE) * x::DOUBLE + (0.3772746350533724::DOUBLE) * y::DOUBLE >= (4.956133393523798::DOUBLE)
                                  THEN CASE WHEN (0.2016323006513917::DOUBLE) * x::DOUBLE + (-0.9794612883284498::DOUBLE) * y::DOUBLE >= (-6.834084418909693::DOUBLE)
                                    THEN 190
                                    ELSE 185
                                  END
                                  ELSE CASE WHEN (0.8337791725865459::DOUBLE) * x::DOUBLE + (-0.5520980812870979::DOUBLE) * y::DOUBLE >= (-2.1851031786528794::DOUBLE)
                                    THEN 190
                                    ELSE 160
                                  END
                                END
                              END
                              ELSE CASE WHEN (0.8501224768654095::DOUBLE) * x::DOUBLE + (0.5265850114921818::DOUBLE) * y::DOUBLE >= (5.020149055314965::DOUBLE)
                                THEN CASE WHEN (0.896736804922152::DOUBLE) * x::DOUBLE + (-0.44256423567433734::DOUBLE) * y::DOUBLE >= (-1.3192544520893574::DOUBLE)
                                  THEN 169
                                  ELSE 141
                                END
                                ELSE 107
                              END
                            END
                            ELSE CASE WHEN (0.6716090255893871::DOUBLE) * x::DOUBLE + (0.7409057407976227::DOUBLE) * y::DOUBLE >= (6.4095875980492405::DOUBLE)
                              THEN CASE WHEN (0.17545297301251575::DOUBLE) * x::DOUBLE + (0.9844878131602591::DOUBLE) * y::DOUBLE >= (7.728941487981203::DOUBLE)
                                THEN CASE WHEN (0.9035793934997788::DOUBLE) * x::DOUBLE + (-0.42842068068963707::DOUBLE) * y::DOUBLE >= (-1.685599056065613::DOUBLE)
                                  THEN 160
                                  ELSE 123
                                END
                                ELSE CASE WHEN (0.9362087659304469::DOUBLE) * x::DOUBLE + (0.3514443719779702::DOUBLE) * y::DOUBLE >= (4.254805350793231::DOUBLE)
                                  THEN 160
                                  ELSE 116
                                END
                              END
                              ELSE CASE WHEN (0.7086958604074386::DOUBLE) * x::DOUBLE + (-0.7055141227795234::DOUBLE) * y::DOUBLE >= (-4.140556722431877::DOUBLE)
                                THEN CASE WHEN (0.236151747890962::DOUBLE) * x::DOUBLE + (0.9717161890017288::DOUBLE) * y::DOUBLE >= (7.238588933436982::DOUBLE)
                                  THEN 116
                                  ELSE 107
                                END
                                ELSE CASE WHEN (0.950463809173769::DOUBLE) * x::DOUBLE + (0.3108352416488342::DOUBLE) * y::DOUBLE >= (3.4238907644789127::DOUBLE)
                                  THEN 116
                                  ELSE 84
                                END
                              END
                            END
                          END
                        END
                        ELSE CASE WHEN (0.2999810659910992::DOUBLE) * x::DOUBLE + (0.9539451556807885::DOUBLE) * y::DOUBLE >= (6.99061143014373::DOUBLE)
                          THEN CASE WHEN (0.7201195581302026::DOUBLE) * x::DOUBLE + (-0.6938499996385111::DOUBLE) * y::DOUBLE >= (-4.631856879263657::DOUBLE)
                            THEN CASE WHEN (0.950463809173769::DOUBLE) * x::DOUBLE + (0.3108352416488342::DOUBLE) * y::DOUBLE >= (3.4238907644789127::DOUBLE)
                              THEN CASE WHEN (0.8391551077592464::DOUBLE) * x::DOUBLE + (-0.5438921815227421::DOUBLE) * y::DOUBLE >= (-3.047492517611439::DOUBLE)
                                THEN CASE WHEN (0.17545297301251575::DOUBLE) * x::DOUBLE + (0.9844878131602591::DOUBLE) * y::DOUBLE >= (7.728941487981203::DOUBLE)
                                  THEN 123
                                  ELSE 116
                                END
                                ELSE CASE WHEN (0.955307408248241::DOUBLE) * x::DOUBLE + (0.29561420085312::DOUBLE) * y::DOUBLE >= (3.4995405608182883::DOUBLE)
                                  THEN 123
                                  ELSE 87
                                END
                              END
                              ELSE CASE WHEN (0.7086958604074386::DOUBLE) * x::DOUBLE + (-0.7055141227795234::DOUBLE) * y::DOUBLE >= (-4.140556722431877::DOUBLE)
                                THEN 107
                                ELSE CASE WHEN (0.8386400499801758::DOUBLE) * x::DOUBLE + (0.5446860256783245::DOUBLE) * y::DOUBLE >= (4.733803077411899::DOUBLE)
                                  THEN CASE WHEN (0.04943380771311049::DOUBLE) * x::DOUBLE + (0.9987774019545012::DOUBLE) * y::DOUBLE >= (7.467171740861357::DOUBLE)
                                    THEN 87
                                    ELSE 84
                                  END
                                  ELSE CASE WHEN (0.4904921930028051::DOUBLE) * x::DOUBLE + (-0.8714455855664764::DOUBLE) * y::DOUBLE >= (-5.890135046701614::DOUBLE)
                                    THEN CASE WHEN (0.5811786990774429::DOUBLE) * x::DOUBLE + (0.8137759640949414::DOUBLE) * y::DOUBLE >= (6.26189957144838::DOUBLE)
                                      THEN 84
                                      ELSE 65
                                    END
                                    ELSE CASE WHEN (0.9549073194878211::DOUBLE) * x::DOUBLE + (-0.2969040437390242::DOUBLE) * y::DOUBLE >= (-1.4294735043482514::DOUBLE)
                                      THEN 84
                                      ELSE 45
                                    END
                                  END
                                END
                              END
                            END
                            ELSE CASE WHEN (0.955307408248241::DOUBLE) * x::DOUBLE + (0.29561420085312::DOUBLE) * y::DOUBLE >= (3.4995405608182883::DOUBLE)
                              THEN 123
                              ELSE CASE WHEN (0.04888413286872709::DOUBLE) * x::DOUBLE + (0.9988044561142451::DOUBLE) * y::DOUBLE >= (7.597692485701622::DOUBLE)
                                THEN CASE WHEN (0.9278202278634922::DOUBLE) * x::DOUBLE + (-0.3730276461166618::DOUBLE) * y::DOUBLE >= (-2.5757840752793038::DOUBLE)
                                  THEN CASE WHEN (0.7643271034929925::DOUBLE) * x::DOUBLE + (0.6448287205654014::DOUBLE) * y::DOUBLE >= (5.4860226375388335::DOUBLE)
                                    THEN CASE WHEN (0.7646779228571539::DOUBLE) * x::DOUBLE + (-0.6444126583912428::DOUBLE) * y::DOUBLE >= (-4.338357739758428::DOUBLE)
                                      THEN 87
                                      ELSE 61
                                    END
                                    ELSE CASE WHEN (0.9977539708511618::DOUBLE) * x::DOUBLE + (-0.06698517485786588::DOUBLE) * y::DOUBLE >= (0.2363816241155834::DOUBLE)
                                      THEN 87
                                      ELSE 40
                                    END
                                  END
                                  ELSE CASE WHEN (0.9909811442284407::DOUBLE) * x::DOUBLE + (0.13400138724539568::DOUBLE) * y::DOUBLE >= (1.5031789611539188::DOUBLE)
                                    THEN 61
                                    ELSE 18
                                  END
                                END
                                ELSE CASE WHEN (0.7510704588464797::DOUBLE) * x::DOUBLE + (0.6602220579836291::DOUBLE) * y::DOUBLE >= (5.221031950913875::DOUBLE)
                                  THEN CASE WHEN (0.14426677119157738::DOUBLE) * x::DOUBLE + (-0.9895388313401132::DOUBLE) * y::DOUBLE >= (-7.359884591383164::DOUBLE)
                                    THEN CASE WHEN (0.8386400499801758::DOUBLE) * x::DOUBLE + (0.5446860256783245::DOUBLE) * y::DOUBLE >= (4.733803077411899::DOUBLE)
                                      THEN 87
                                      ELSE 45
                                    END
                                    ELSE CASE WHEN (0.9977539708511618::DOUBLE) * x::DOUBLE + (-0.06698517485786588::DOUBLE) * y::DOUBLE >= (0.2363816241155834::DOUBLE)
                                      THEN 87
                                      ELSE 40
                                    END
                                  END
                                  ELSE CASE WHEN (0.9932467486165377::DOUBLE) * x::DOUBLE + (-0.11602110309196428::DOUBLE) * y::DOUBLE >= (-0.5051506489860429::DOUBLE)
                                    THEN 45
                                    ELSE 15
                                  END
                                END
                              END
                            END
                          END
                          ELSE CASE WHEN (0.9716233475803082::DOUBLE) * x::DOUBLE + (-0.23653344464755005::DOUBLE) * y::DOUBLE >= (-1.0548537142568175::DOUBLE)
                            THEN CASE WHEN (0.7952359727622326::DOUBLE) * x::DOUBLE + (0.6063000475217742::DOUBLE) * y::DOUBLE >= (4.9824610528664754::DOUBLE)
                              THEN CASE WHEN (0.5811786990774429::DOUBLE) * x::DOUBLE + (0.8137759640949414::DOUBLE) * y::DOUBLE >= (6.26189957144838::DOUBLE)
                                THEN CASE WHEN (0.7086958604074386::DOUBLE) * x::DOUBLE + (-0.7055141227795234::DOUBLE) * y::DOUBLE >= (-4.140556722431877::DOUBLE)
                                  THEN 107
                                  ELSE 84
                                END
                                ELSE CASE WHEN (0.9946393454527523::DOUBLE) * x::DOUBLE + (-0.10340489580924239::DOUBLE) * y::DOUBLE >= (0.3395297322227825::DOUBLE)
                                  THEN 107
                                  ELSE 65
                                END
                              END
                              ELSE CASE WHEN (0.6464328533804474::DOUBLE) * x::DOUBLE + (0.7629708815350773::DOUBLE) * y::DOUBLE >= (5.568109794466297::DOUBLE)
                                THEN CASE WHEN (0.44476326910357356::DOUBLE) * x::DOUBLE + (-0.8956481644352888::DOUBLE) * y::DOUBLE >= (-5.656181843234995::DOUBLE)
                                  THEN 81
                                  ELSE 65
                                END
                                ELSE CASE WHEN (0.9994411714040728::DOUBLE) * x::DOUBLE + (-0.03342670941709103::DOUBLE) * y::DOUBLE >= (0.5076560198870503::DOUBLE)
                                  THEN 81
                                  ELSE 43
                                END
                              END
                            END
                            ELSE CASE WHEN (0.15693350859214664::DOUBLE) * x::DOUBLE + (-0.9876091706140434::DOUBLE) * y::DOUBLE >= (-6.638305974232216::DOUBLE)
                              THEN CASE WHEN (0.05614140998804545::DOUBLE) * x::DOUBLE + (-0.9984228273054229::DOUBLE) * y::DOUBLE >= (-6.703382068827258::DOUBLE)
                                THEN CASE WHEN (0.9596375113928648::DOUBLE) * x::DOUBLE + (0.2812398384434706::DOUBLE) * y::DOUBLE >= (2.160224289245814::DOUBLE)
                                  THEN 43
                                  ELSE 17
                                END
                                ELSE CASE WHEN (0.7013486528097505::DOUBLE) * x::DOUBLE + (-0.7128183970703534::DOUBLE) * y::DOUBLE >= (-4.601459144031831::DOUBLE)
                                  THEN 43
                                  ELSE 11
                                END
                              END
                              ELSE CASE WHEN (0.04520536740916065::DOUBLE) * x::DOUBLE + (0.9989777148452326::DOUBLE) * y::DOUBLE >= (7.171583865011311::DOUBLE)
                                THEN CASE WHEN (0.5807386898547401::DOUBLE) * x::DOUBLE + (-0.8140900282559663::DOUBLE) * y::DOUBLE >= (-5.685345350470524::DOUBLE)
                                  THEN 37
                                  ELSE 15
                                END
                                ELSE CASE WHEN (0.9865267623175116::DOUBLE) * x::DOUBLE + (0.16359996097593643::DOUBLE) * y::DOUBLE >= (1.4264655881254666::DOUBLE)
                                  THEN 37
                                  ELSE 11
                                END
                              END
                            END
                          END
                        END
                      END
                    END
                  END
                END
                ELSE CASE WHEN (0.5285621746479224::DOUBLE) * x::DOUBLE + (-0.8488945915315158::DOUBLE) * y::DOUBLE >= (-1.5098242656812315::DOUBLE)
                  THEN CASE WHEN (0.9454484142827064::DOUBLE) * x::DOUBLE + (0.3257718464359924::DOUBLE) * y::DOUBLE >= (2.5280021304324576::DOUBLE)
                    THEN CASE WHEN (0.5502028669389945::DOUBLE) * x::DOUBLE + (-0.8350310205088857::DOUBLE) * y::DOUBLE >= (0.2266233168778362::DOUBLE)
                      THEN CASE WHEN (0.13621729389077028::DOUBLE) * x::DOUBLE + (0.9906789837505768::DOUBLE) * y::DOUBLE >= (1.280313760823201::DOUBLE)
                        THEN CASE WHEN (0.9981012804985526::DOUBLE) * x::DOUBLE + (0.061594105782530134::DOUBLE) * y::DOUBLE >= (3.219714201521509::DOUBLE)
                          THEN CASE WHEN (0.21911394795438802::DOUBLE) * x::DOUBLE + (-0.9756992763202408::DOUBLE) * y::DOUBLE >= (-0.5906235260960984::DOUBLE)
                            THEN CASE WHEN (0.9978402087461063::DOUBLE) * x::DOUBLE + (0.065688033990423::DOUBLE) * y::DOUBLE >= (3.563549528250052::DOUBLE)
                              THEN CASE WHEN (0.9731143308557176::DOUBLE) * x::DOUBLE + (-0.23032259785619993::DOUBLE) * y::DOUBLE >= (3.5543052952606273::DOUBLE)
                                THEN 320
                                ELSE CASE WHEN (0.41846695377904514::DOUBLE) * x::DOUBLE + (-0.9082320235462338::DOUBLE) * y::DOUBLE >= (0.5482882895845401::DOUBLE)
                                  THEN CASE WHEN (0.3198262746616649::DOUBLE) * x::DOUBLE + (0.9474762023586878::DOUBLE) * y::DOUBLE >= (2.2964973835328433::DOUBLE)
                                    THEN 303
                                    ELSE 288
                                  END
                                  ELSE CASE WHEN (0.8611908582793838::DOUBLE) * x::DOUBLE + (0.5082817187505551::DOUBLE) * y::DOUBLE >= (3.8472808961853637::DOUBLE)
                                    THEN 303
                                    ELSE 279
                                  END
                                END
                              END
                              ELSE CASE WHEN (0.7696357352243599::DOUBLE) * x::DOUBLE + (-0.6384832300582836::DOUBLE) * y::DOUBLE >= (1.719436250073778::DOUBLE)
                                THEN CASE WHEN (0.5790353519272701::DOUBLE) * x::DOUBLE + (0.8153024354302288::DOUBLE) * y::DOUBLE >= (2.85369867940985::DOUBLE)
                                  THEN 279
                                  ELSE 256
                                END
                                ELSE CASE WHEN (0.9986704723956368::DOUBLE) * x::DOUBLE + (-0.051548885197216426::DOUBLE) * y::DOUBLE >= (3.1666160025896435::DOUBLE)
                                  THEN 279
                                  ELSE 219
                                END
                              END
                            END
                            ELSE CASE WHEN (0.875812731566747::DOUBLE) * x::DOUBLE + (-0.48265107399196056::DOUBLE) * y::DOUBLE >= (2.244915231585599::DOUBLE)
                              THEN CASE WHEN (0.7605866387742318::DOUBLE) * x::DOUBLE + (0.6492364476199072::DOUBLE) * y::DOUBLE >= (3.8759218405090405::DOUBLE)
                                THEN CASE WHEN (0.11647491306598057::DOUBLE) * x::DOUBLE + (-0.9931936340041011::DOUBLE) * y::DOUBLE >= (-1.160505432295432::DOUBLE)
                                  THEN 303
                                  ELSE 300
                                END
                                ELSE CASE WHEN (0.8866564755294594::DOUBLE) * x::DOUBLE + (-0.46242869115321683::DOUBLE) * y::DOUBLE >= (2.560972448443811::DOUBLE)
                                  THEN 303
                                  ELSE 267
                                END
                              END
                              ELSE CASE WHEN (0.3857336631216761::DOUBLE) * x::DOUBLE + (0.9226101783173288::DOUBLE) * y::DOUBLE >= (2.504725676258616::DOUBLE)
                                THEN CASE WHEN (0.7319317058415038::DOUBLE) * x::DOUBLE + (0.6813779993395341::DOUBLE) * y::DOUBLE >= (3.6626167462251122::DOUBLE)
                                  THEN CASE WHEN (0.007973463027325005::DOUBLE) * x::DOUBLE + (-0.9999682114384196::DOUBLE) * y::DOUBLE >= (-1.774633906107483::DOUBLE)
                                    THEN 267
                                    ELSE 266
                                  END
                                  ELSE CASE WHEN (0.9694395699989693::DOUBLE) * x::DOUBLE + (-0.2453302266746054::DOUBLE) * y::DOUBLE >= (2.7836538178345456::DOUBLE)
                                    THEN 267
                                    ELSE 238
                                  END
                                END
                                ELSE CASE WHEN (0.8602790617734849::DOUBLE) * x::DOUBLE + (0.5098234359796855::DOUBLE) * y::DOUBLE >= (3.466510377856353::DOUBLE)
                                  THEN 267
                                  ELSE 219
                                END
                              END
                            END
                          END
                          ELSE CASE WHEN (0.3957099150144914::DOUBLE) * x::DOUBLE + (0.9183755567082694::DOUBLE) * y::DOUBLE >= (2.086715198468268::DOUBLE)
                            THEN CASE WHEN (0.25637604592266555::DOUBLE) * x::DOUBLE + (-0.9665771169839783::DOUBLE) * y::DOUBLE >= (-0.2660820136846549::DOUBLE)
                              THEN 224
                              ELSE CASE WHEN (0.8576748044337739::DOUBLE) * x::DOUBLE + (-0.514192502706416::DOUBLE) * y::DOUBLE >= (1.6077510802081374::DOUBLE)
                                THEN CASE WHEN (0.3857336631216761::DOUBLE) * x::DOUBLE + (0.9226101783173288::DOUBLE) * y::DOUBLE >= (2.504725676258616::DOUBLE)
                                  THEN 238
                                  ELSE 219
                                END
                                ELSE CASE WHEN (0.9619952033941763::DOUBLE) * x::DOUBLE + (0.27306634477100505::DOUBLE) * y::DOUBLE >= (3.1154580071193476::DOUBLE)
                                  THEN 238
                                  ELSE 186
                                END
                              END
                            END
                            ELSE CASE WHEN (0.8510107813104261::DOUBLE) * x::DOUBLE + (-0.5251482172619634::DOUBLE) * y::DOUBLE >= (1.6905038289779544::DOUBLE)
                              THEN CASE WHEN (0.2809791261171118::DOUBLE) * x::DOUBLE + (0.9597138795945718::DOUBLE) * y::DOUBLE >= (1.7271883416985199::DOUBLE)
                                THEN CASE WHEN (0.25637604592266555::DOUBLE) * x::DOUBLE + (-0.9665771169839783::DOUBLE) * y::DOUBLE >= (-0.2660820136846549::DOUBLE)
                                  THEN 224
                                  ELSE 219
                                END
                                ELSE CASE WHEN (0.8201627673797298::DOUBLE) * x::DOUBLE + (0.5721302605211711::DOUBLE) * y::DOUBLE >= (2.812615294853369::DOUBLE)
                                  THEN 224
                                  ELSE 207
                                END
                              END
                              ELSE CASE WHEN (0.9333034564769234::DOUBLE) * x::DOUBLE + (0.35908864940043356::DOUBLE) * y::DOUBLE >= (2.818643191203605::DOUBLE)
                                THEN 219
                                ELSE 170
                              END
                            END
                          END
                        END
                        ELSE CASE WHEN (0.9802287701254396::DOUBLE) * x::DOUBLE + (-0.19786752694256834::DOUBLE) * y::DOUBLE >= (3.1125154683303404::DOUBLE)
                          THEN CASE WHEN (0.8144000847051072::DOUBLE) * x::DOUBLE + (0.5803038014973833::DOUBLE) * y::DOUBLE >= (3.193094010603314::DOUBLE)
                            THEN CASE WHEN (0.15573088207477628::DOUBLE) * x::DOUBLE + (-0.9877995203320419::DOUBLE) * y::DOUBLE >= (0.046537897979360476::DOUBLE)
                              THEN CASE WHEN (0.2805193839174712::DOUBLE) * x::DOUBLE + (-0.959848360547937::DOUBLE) * y::DOUBLE >= (0.6911917193965943::DOUBLE)
                                THEN CASE WHEN (0.7559554622008234::DOUBLE) * x::DOUBLE + (0.6546230512048438::DOUBLE) * y::DOUBLE >= (3.1956659911452::DOUBLE)
                                  THEN 327
                                  ELSE 302
                                END
                                ELSE CASE WHEN (0.9483184033636868::DOUBLE) * x::DOUBLE + (-0.3173203520761755::DOUBLE) * y::DOUBLE >= (3.5406135703955344::DOUBLE)
                                  THEN 327
                                  ELSE 287
                                END
                              END
                              ELSE CASE WHEN (0.7499851198766581::DOUBLE) * x::DOUBLE + (-0.6614546998575145::DOUBLE) * y::DOUBLE >= (2.143410139436519::DOUBLE)
                                THEN CASE WHEN (0.007758481243258323::DOUBLE) * x::DOUBLE + (0.9999699025314702::DOUBLE) * y::DOUBLE >= (0.7799227802302945::DOUBLE)
                                  THEN CASE WHEN (0.9731143308557176::DOUBLE) * x::DOUBLE + (-0.23032259785619993::DOUBLE) * y::DOUBLE >= (3.5543052952606273::DOUBLE)
                                    THEN 320
                                    ELSE 288
                                  END
                                  ELSE CASE WHEN (0.80037427604286::DOUBLE) * x::DOUBLE + (0.5995006407409983::DOUBLE) * y::DOUBLE >= (3.5152561768355506::DOUBLE)
                                    THEN 320
                                    ELSE 287
                                  END
                                END
                                ELSE CASE WHEN (0.9978402087461063::DOUBLE) * x::DOUBLE + (0.065688033990423::DOUBLE) * y::DOUBLE >= (3.563549528250052::DOUBLE)
                                  THEN 288
                                  ELSE 256
                                END
                              END
                            END
                            ELSE CASE WHEN (0.22778615783005587::DOUBLE) * x::DOUBLE + (-0.9737111821793055::DOUBLE) * y::DOUBLE >= (0.13586273484566458::DOUBLE)
                              THEN CASE WHEN (0.9860474971457784::DOUBLE) * x::DOUBLE + (-0.16646421048545607::DOUBLE) * y::DOUBLE >= (3.1525030952666473::DOUBLE)
                                THEN CASE WHEN (0.2112442837463611::DOUBLE) * x::DOUBLE + (0.9774332982789602::DOUBLE) * y::DOUBLE >= (0.9779409469328214::DOUBLE)
                                  THEN CASE WHEN (0.8320328723712023::DOUBLE) * x::DOUBLE + (-0.5547263282860538::DOUBLE) * y::DOUBLE >= (2.857839405254956::DOUBLE)
                                    THEN 302
                                    ELSE 263
                                  END
                                  ELSE CASE WHEN (0.9923384896485367::DOUBLE) * x::DOUBLE + (0.12354886467329856::DOUBLE) * y::DOUBLE >= (3.585641178987253::DOUBLE)
                                    THEN 302
                                    ELSE 259
                                  END
                                END
                                ELSE CASE WHEN (0.8484321585120624::DOUBLE) * x::DOUBLE + (0.5293041397935243::DOUBLE) * y::DOUBLE >= (2.9133902484476737::DOUBLE)
                                  THEN 263
                                  ELSE 233
                                END
                              END
                              ELSE 256
                            END
                          END
                          ELSE CASE WHEN (0.8425016467288707::DOUBLE) * x::DOUBLE + (-0.5386937676074797::DOUBLE) * y::DOUBLE >= (2.140951406249974::DOUBLE)
                            THEN CASE WHEN (0.48026760112663835::DOUBLE) * x::DOUBLE + (0.8771220162030275::DOUBLE) * y::DOUBLE >= (1.8312407530293882::DOUBLE)
                              THEN CASE WHEN (0.18718460065363235::DOUBLE) * x::DOUBLE + (-0.9823247555050927::DOUBLE) * y::DOUBLE >= (-0.09738019688827093::DOUBLE)
                                THEN CASE WHEN (0.5137514706349502::DOUBLE) * x::DOUBLE + (0.8579390575212356::DOUBLE) * y::DOUBLE >= (2.2402115290527753::DOUBLE)
                                  THEN 256
                                  ELSE 236
                                END
                                ELSE CASE WHEN (0.9981012804985526::DOUBLE) * x::DOUBLE + (0.061594105782530134::DOUBLE) * y::DOUBLE >= (3.219714201521509::DOUBLE)
                                  THEN 256
                                  ELSE 224
                                END
                              END
                              ELSE CASE WHEN (0.9965207821993813::DOUBLE) * x::DOUBLE + (-0.0833446497666958::DOUBLE) * y::DOUBLE >= (2.8254773983022337::DOUBLE)
                                THEN CASE WHEN (0.07907419506539283::DOUBLE) * x::DOUBLE + (0.9968687334221895::DOUBLE) * y::DOUBLE >= (0.5682303995284628::DOUBLE)
                                  THEN 236
                                  ELSE 233
                                END
                                ELSE CASE WHEN (0.8463349408754159::DOUBLE) * x::DOUBLE + (0.5326510751452646::DOUBLE) * y::DOUBLE >= (2.606527247154978::DOUBLE)
                                  THEN 236
                                  ELSE 200
                                END
                              END
                            END
                            ELSE CASE WHEN (0.8201627673797298::DOUBLE) * x::DOUBLE + (0.5721302605211711::DOUBLE) * y::DOUBLE >= (2.812615294853369::DOUBLE)
                              THEN 224
                              ELSE CASE WHEN (0.38182258688776544::DOUBLE) * x::DOUBLE + (-0.9242356366978794::DOUBLE) * y::DOUBLE >= (0.1404951317288382::DOUBLE)
                                THEN CASE WHEN (0.46668762427910954::DOUBLE) * x::DOUBLE + (-0.884422218934328::DOUBLE) * y::DOUBLE >= (0.8094817689249536::DOUBLE)
                                  THEN CASE WHEN (0.21760672923809954::DOUBLE) * x::DOUBLE + (0.9760365317908426::DOUBLE) * y::DOUBLE >= (1.0263786702567181::DOUBLE)
                                    THEN 207
                                    ELSE 200
                                  END
                                  ELSE CASE WHEN (0.9831237939511873::DOUBLE) * x::DOUBLE + (0.18294153647278508::DOUBLE) * y::DOUBLE >= (2.661561757578953::DOUBLE)
                                    THEN 207
                                    ELSE 181
                                  END
                                END
                                ELSE CASE WHEN (0.8510107813104261::DOUBLE) * x::DOUBLE + (-0.5251482172619634::DOUBLE) * y::DOUBLE >= (1.6905038289779544::DOUBLE)
                                  THEN 207
                                  ELSE 170
                                END
                              END
                            END
                          END
                        END
                      END
                      ELSE CASE WHEN (0.9785939431819194::DOUBLE) * x::DOUBLE + (0.20580061799630772::DOUBLE) * y::DOUBLE >= (3.2153033716858572::DOUBLE)
                        THEN CASE WHEN (0.25066811998735206::DOUBLE) * x::DOUBLE + (0.9680730827897274::DOUBLE) * y::DOUBLE >= (3.485926469650149::DOUBLE)
                          THEN CASE WHEN (0.9906285236679803::DOUBLE) * x::DOUBLE + (-0.13658377683823922::DOUBLE) * y::DOUBLE >= (2.7383861835572683::DOUBLE)
                            THEN CASE WHEN (0.4547501137449851::DOUBLE) * x::DOUBLE + (-0.8906190734814313::DOUBLE) * y::DOUBLE >= (-1.1300611345837972::DOUBLE)
                              THEN CASE WHEN (0.8294522768835725::DOUBLE) * x::DOUBLE + (0.5585775867081111::DOUBLE) * y::DOUBLE >= (4.169926114609017::DOUBLE)
                                THEN CASE WHEN (0.3911555398699537::DOUBLE) * x::DOUBLE + (-0.9203245860179142::DOUBLE) * y::DOUBLE >= (-1.2658308822290283::DOUBLE)
                                  THEN CASE WHEN (0.5243242338791954::DOUBLE) * x::DOUBLE + (0.8515187007735032::DOUBLE) * y::DOUBLE >= (4.2230323269707215::DOUBLE)
                                    THEN 284
                                    ELSE 265
                                  END
                                  ELSE CASE WHEN (0.9648227973605719::DOUBLE) * x::DOUBLE + (-0.262901064458326::DOUBLE) * y::DOUBLE >= (2.5760803539827113::DOUBLE)
                                    THEN 284
                                    ELSE 253
                                  END
                                END
                                ELSE 218
                              END
                              ELSE CASE WHEN (0.24530451711915435::DOUBLE) * x::DOUBLE + (-0.969446075798411::DOUBLE) * y::DOUBLE >= (-2.347827418586535::DOUBLE)
                                THEN CASE WHEN (0.5295050056045604::DOUBLE) * x::DOUBLE + (0.8483068130338896::DOUBLE) * y::DOUBLE >= (4.448678212317379::DOUBLE)
                                  THEN 264
                                  ELSE 253
                                END
                                ELSE CASE WHEN (0.7746135342101332::DOUBLE) * x::DOUBLE + (-0.6324348761876488::DOUBLE) * y::DOUBLE >= (0.44570166000858435::DOUBLE)
                                  THEN 264
                                  ELSE 244
                                END
                              END
                            END
                            ELSE CASE WHEN (0.28870400854523587::DOUBLE) * x::DOUBLE + (0.9574184014577494::DOUBLE) * y::DOUBLE >= (4.023201927472135::DOUBLE)
                              THEN CASE WHEN (0.22689734567490913::DOUBLE) * x::DOUBLE + (0.9739186796266311::DOUBLE) * y::DOUBLE >= (4.029006479577707::DOUBLE)
                                THEN CASE WHEN (0.7771339546681562::DOUBLE) * x::DOUBLE + (-0.6293352179100041::DOUBLE) * y::DOUBLE >= (0.07178998185994256::DOUBLE)
                                  THEN 244
                                  ELSE 215
                                END
                                ELSE CASE WHEN (0.8635668080188686::DOUBLE) * x::DOUBLE + (0.5042344376260933::DOUBLE) * y::DOUBLE >= (4.246737154221037::DOUBLE)
                                  THEN 244
                                  ELSE 206
                                END
                              END
                              ELSE CASE WHEN (0.3008526681529928::DOUBLE) * x::DOUBLE + (-0.953670630807736::DOUBLE) * y::DOUBLE >= (-1.9868215620716083::DOUBLE)
                                THEN CASE WHEN (0.4543316984216413::DOUBLE) * x::DOUBLE + (0.890832592471395::DOUBLE) * y::DOUBLE >= (3.9155000054568063::DOUBLE)
                                  THEN 230
                                  ELSE 218
                                END
                                ELSE CASE WHEN (0.8690362605225875::DOUBLE) * x::DOUBLE + (-0.4947483985794368::DOUBLE) * y::DOUBLE >= (0.966118250994082::DOUBLE)
                                  THEN 230
                                  ELSE 206
                                END
                              END
                            END
                          END
                          ELSE CASE WHEN (0.467413181932445::DOUBLE) * x::DOUBLE + (-0.8840389795454651::DOUBLE) * y::DOUBLE >= (-0.6208717916794189::DOUBLE)
                            THEN CASE WHEN (0.7319317058415038::DOUBLE) * x::DOUBLE + (0.6813779993395341::DOUBLE) * y::DOUBLE >= (3.6626167462251122::DOUBLE)
                              THEN CASE WHEN (0.5504940332526482::DOUBLE) * x::DOUBLE + (0.8348390978824795::DOUBLE) * y::DOUBLE >= (3.8587526436454773::DOUBLE)
                                THEN CASE WHEN (0.7520408571763609::DOUBLE) * x::DOUBLE + (-0.6591164913256565::DOUBLE) * y::DOUBLE >= (1.0618848279423756::DOUBLE)
                                  THEN 294
                                  ELSE 265
                                END
                                ELSE CASE WHEN (0.8154993377247098::DOUBLE) * x::DOUBLE + (-0.578758006571451::DOUBLE) * y::DOUBLE >= (1.4904174330392013::DOUBLE)
                                  THEN CASE WHEN (0.6148982621646244::DOUBLE) * x::DOUBLE + (0.7886064463260017::DOUBLE) * y::DOUBLE >= (3.9581945453133995::DOUBLE)
                                    THEN 294
                                    ELSE 266
                                  END
                                  ELSE CASE WHEN (0.9585728532079411::DOUBLE) * x::DOUBLE + (0.2848474768938406::DOUBLE) * y::DOUBLE >= (3.9850494405805397::DOUBLE)
                                    THEN 294
                                    ELSE 245
                                  END
                                END
                              END
                              ELSE CASE WHEN (0.7890932939505962::DOUBLE) * x::DOUBLE + (-0.6142733702857368::DOUBLE) * y::DOUBLE >= (1.1515317695094183::DOUBLE)
                                THEN CASE WHEN (0.19229095847268668::DOUBLE) * x::DOUBLE + (0.9813379577340597::DOUBLE) * y::DOUBLE >= (2.5156232064239563::DOUBLE)
                                  THEN 245
                                  ELSE 238
                                END
                                ELSE CASE WHEN (0.9159496318952589::DOUBLE) * x::DOUBLE + (0.40129324917189885::DOUBLE) * y::DOUBLE >= (3.538646667383104::DOUBLE)
                                  THEN 245
                                  ELSE 202
                                END
                              END
                            END
                            ELSE CASE WHEN (0.5995276581219776::DOUBLE) * x::DOUBLE + (0.8003540386271422::DOUBLE) * y::DOUBLE >= (3.5145467870793787::DOUBLE)
                              THEN CASE WHEN (0.5812778456861057::DOUBLE) * x::DOUBLE + (-0.813705146914114::DOUBLE) * y::DOUBLE >= (-0.3926486133644105::DOUBLE)
                                THEN CASE WHEN (0.4446233378715663::DOUBLE) * x::DOUBLE + (0.8957176382208553::DOUBLE) * y::DOUBLE >= (3.8754466906458207::DOUBLE)
                                  THEN CASE WHEN (0.3911555398699537::DOUBLE) * x::DOUBLE + (-0.9203245860179142::DOUBLE) * y::DOUBLE >= (-1.2658308822290283::DOUBLE)
                                    THEN 265
                                    ELSE 253
                                  END
                                  ELSE CASE WHEN (0.9491348483068276::DOUBLE) * x::DOUBLE + (0.31486987745666495::DOUBLE) * y::DOUBLE >= (3.901746844909269::DOUBLE)
                                    THEN 265
                                    ELSE 231
                                  END
                                END
                                ELSE CASE WHEN (0.8294522768835725::DOUBLE) * x::DOUBLE + (0.5585775867081111::DOUBLE) * y::DOUBLE >= (4.169926114609017::DOUBLE)
                                  THEN 253
                                  ELSE 218
                                END
                              END
                              ELSE 202
                            END
                          END
                        END
                        ELSE CASE WHEN (0.7624296588003868::DOUBLE) * x::DOUBLE + (-0.6470711053520514::DOUBLE) * y::DOUBLE >= (0.48566671366843295::DOUBLE)
                          THEN CASE WHEN (0.9973161484466607::DOUBLE) * x::DOUBLE + (0.07321543585554831::DOUBLE) * y::DOUBLE >= (2.4641822214297333::DOUBLE)
                            THEN CASE WHEN (0.05849689851710349::DOUBLE) * x::DOUBLE + (0.9982875902583782::DOUBLE) * y::DOUBLE >= (2.2195103039472825::DOUBLE)
                              THEN CASE WHEN (0.19613572386940842::DOUBLE) * x::DOUBLE + (-0.9805767577411895::DOUBLE) * y::DOUBLE >= (-1.7633374274347302::DOUBLE)
                                THEN CASE WHEN (0.5995276581219776::DOUBLE) * x::DOUBLE + (0.8003540386271422::DOUBLE) * y::DOUBLE >= (3.5145467870793787::DOUBLE)
                                  THEN 231
                                  ELSE 202
                                END
                                ELSE CASE WHEN (0.9540396219618597::DOUBLE) * x::DOUBLE + (-0.2996804960735219::DOUBLE) * y::DOUBLE >= (1.9038031052501152::DOUBLE)
                                  THEN 231
                                  ELSE 191
                                END
                              END
                              ELSE CASE WHEN (0.3744686254048076::DOUBLE) * x::DOUBLE + (0.927239585321633::DOUBLE) * y::DOUBLE >= (2.5877062090531857::DOUBLE)
                                THEN CASE WHEN (0.7890932939505962::DOUBLE) * x::DOUBLE + (-0.6142733702857368::DOUBLE) * y::DOUBLE >= (1.1515317695094183::DOUBLE)
                                  THEN 238
                                  ELSE 202
                                END
                                ELSE CASE WHEN (0.9619952033941763::DOUBLE) * x::DOUBLE + (0.27306634477100505::DOUBLE) * y::DOUBLE >= (3.1154580071193476::DOUBLE)
                                  THEN 238
                                  ELSE 186
                                END
                              END
                            END
                            ELSE CASE WHEN (0.1281450063809711::DOUBLE) * x::DOUBLE + (-0.9917554423040092::DOUBLE) * y::DOUBLE >= (-1.4107750241930015::DOUBLE)
                              THEN CASE WHEN (0.4721101197792854::DOUBLE) * x::DOUBLE + (-0.881539582095999::DOUBLE) * y::DOUBLE >= (-0.04985245200850286::DOUBLE)
                                THEN CASE WHEN (0.3957099150144914::DOUBLE) * x::DOUBLE + (0.9183755567082694::DOUBLE) * y::DOUBLE >= (2.086715198468268::DOUBLE)
                                  THEN 186
                                  ELSE 170
                                END
                                ELSE CASE WHEN (0.9842146946759212::DOUBLE) * x::DOUBLE + (0.176978628043002::DOUBLE) * y::DOUBLE >= (2.4836998385503324::DOUBLE)
                                  THEN 186
                                  ELSE 161
                                END
                              END
                              ELSE CASE WHEN (0.7594757001345054::DOUBLE) * x::DOUBLE + (-0.6505356722772417::DOUBLE) * y::DOUBLE >= (0.5715111645027882::DOUBLE)
                                THEN 186
                                ELSE 154
                              END
                            END
                          END
                          ELSE CASE WHEN (0.6722888294948339::DOUBLE) * x::DOUBLE + (0.7402889501650461::DOUBLE) * y::DOUBLE >= (3.4686708068579946::DOUBLE)
                            THEN CASE WHEN (0.8813445076736662::DOUBLE) * x::DOUBLE + (0.47247418849442235::DOUBLE) * y::DOUBLE >= (3.2478801657054923::DOUBLE)
                              THEN CASE WHEN (0.4900115804758905::DOUBLE) * x::DOUBLE + (-0.8717159233371385::DOUBLE) * y::DOUBLE >= (-1.2997909020259213::DOUBLE)
                                THEN CASE WHEN (0.30532466663070684::DOUBLE) * x::DOUBLE + (0.9522483121260168::DOUBLE) * y::DOUBLE >= (3.6013620977370455::DOUBLE)
                                  THEN 206
                                  ELSE 191
                                END
                                ELSE CASE WHEN (0.9399405844692189::DOUBLE) * x::DOUBLE + (0.3413380987637668::DOUBLE) * y::DOUBLE >= (3.4461809707179656::DOUBLE)
                                  THEN 206
                                  ELSE 177
                                END
                              END
                              ELSE CASE WHEN (0.9616884640014537::DOUBLE) * x::DOUBLE + (-0.2741446665658934::DOUBLE) * y::DOUBLE >= (1.3820957986227476::DOUBLE)
                                THEN 191
                                ELSE 149
                              END
                            END
                            ELSE CASE WHEN (0.33939339619954445::DOUBLE) * x::DOUBLE + (0.9406445251082574::DOUBLE) * y::DOUBLE >= (3.064782998108969::DOUBLE)
                              THEN CASE WHEN (0.6110338983222542::DOUBLE) * x::DOUBLE + (-0.7916044309509068::DOUBLE) * y::DOUBLE >= (-0.7797796206301819::DOUBLE)
                                THEN 172
                                ELSE 149
                              END
                              ELSE CASE WHEN (0.4985369080992971::DOUBLE) * x::DOUBLE + (-0.8668684740275152::DOUBLE) * y::DOUBLE >= (-0.9508353704316423::DOUBLE)
                                THEN CASE WHEN (0.6002003515755313::DOUBLE) * x::DOUBLE + (0.7998496971110315::DOUBLE) * y::DOUBLE >= (2.986032049875919::DOUBLE)
                                  THEN 172
                                  ELSE 154
                                END
                                ELSE CASE WHEN (0.9981597586857108::DOUBLE) * x::DOUBLE + (-0.06063906447566389::DOUBLE) * y::DOUBLE >= (1.8494451414289887::DOUBLE)
                                  THEN 172
                                  ELSE 136
                                END
                              END
                            END
                          END
                        END
                      END
                    END
                    ELSE CASE WHEN (0.726140387144364::DOUBLE) * x::DOUBLE + (0.6875464625447745::DOUBLE) * y::DOUBLE >= (1.5697569619268474::DOUBLE)
                      THEN CASE WHEN (0.2745916729165377::DOUBLE) * x::DOUBLE + (-0.9615609253525733::DOUBLE) * y::DOUBLE >= (-1.0342107391936106::DOUBLE)
                        THEN CASE WHEN (0.5884716623551163::DOUBLE) * x::DOUBLE + (-0.8085178430962461::DOUBLE) * y::DOUBLE >= (0.19536311855544053::DOUBLE)
                          THEN CASE WHEN (0.1358250415907041::DOUBLE) * x::DOUBLE + (-0.9907328389010246::DOUBLE) * y::DOUBLE >= (-0.2899658648820365::DOUBLE)
                            THEN CASE WHEN (0.9859767612490992::DOUBLE) * x::DOUBLE + (0.16688267218838815::DOUBLE) * y::DOUBLE >= (2.175300228530949::DOUBLE)
                              THEN CASE WHEN (0.5233761170980388::DOUBLE) * x::DOUBLE + (0.8521017779886274::DOUBLE) * y::DOUBLE >= (1.5930902904531463::DOUBLE)
                                THEN CASE WHEN (0.46668762427910954::DOUBLE) * x::DOUBLE + (-0.884422218934328::DOUBLE) * y::DOUBLE >= (0.8094817689249536::DOUBLE)
                                  THEN 200
                                  ELSE 181
                                END
                                ELSE CASE WHEN (0.9881108932310716::DOUBLE) * x::DOUBLE + (-0.15374284594118115::DOUBLE) * y::DOUBLE >= (2.3526844236621116::DOUBLE)
                                  THEN 200
                                  ELSE 168
                                END
                              END
                              ELSE CASE WHEN (0.27516313578161755::DOUBLE) * x::DOUBLE + (-0.9613975497715953::DOUBLE) * y::DOUBLE >= (0.13717971562914433::DOUBLE)
                                THEN CASE WHEN (0.9938308959309307::DOUBLE) * x::DOUBLE + (0.11090604263575347::DOUBLE) * y::DOUBLE >= (2.0547561928561913::DOUBLE)
                                  THEN 168
                                  ELSE 148
                                END
                                ELSE CASE WHEN (0.8391580549052969::DOUBLE) * x::DOUBLE + (-0.5438876344315602::DOUBLE) * y::DOUBLE >= (1.4575401863114799::DOUBLE)
                                  THEN 168
                                  ELSE 143
                                END
                              END
                            END
                            ELSE CASE WHEN (0.7063135126825762::DOUBLE) * x::DOUBLE + (0.7078991607580843::DOUBLE) * y::DOUBLE >= (1.9759096819287336::DOUBLE)
                              THEN CASE WHEN (0.38537371097848644::DOUBLE) * x::DOUBLE + (0.9227605880653281::DOUBLE) * y::DOUBLE >= (1.7879251111822838::DOUBLE)
                                THEN CASE WHEN (0.4721101197792854::DOUBLE) * x::DOUBLE + (-0.881539582095999::DOUBLE) * y::DOUBLE >= (-0.04985245200850286::DOUBLE)
                                  THEN 170
                                  ELSE 161
                                END
                                ELSE CASE WHEN (0.9547867524005356::DOUBLE) * x::DOUBLE + (0.29729153610629155::DOUBLE) * y::DOUBLE >= (2.215206463629168::DOUBLE)
                                  THEN CASE WHEN (0.38182258688776544::DOUBLE) * x::DOUBLE + (-0.9242356366978794::DOUBLE) * y::DOUBLE >= (0.1404951317288382::DOUBLE)
                                    THEN 181
                                    ELSE 170
                                  END
                                  ELSE CASE WHEN (0.9430752895026305::DOUBLE) * x::DOUBLE + (-0.33257931133720514::DOUBLE) * y::DOUBLE >= (1.7405602086032688::DOUBLE)
                                    THEN 181
                                    ELSE 142
                                  END
                                END
                              END
                              ELSE CASE WHEN (0.7412666731317713::DOUBLE) * x::DOUBLE + (0.6712106370612401::DOUBLE) * y::DOUBLE >= (1.6949204034851142::DOUBLE)
                                THEN CASE WHEN (0.0023991140171798846::DOUBLE) * x::DOUBLE + (-0.9999971221218252::DOUBLE) * y::DOUBLE >= (-0.6859418475349457::DOUBLE)
                                  THEN CASE WHEN (0.9859767612490992::DOUBLE) * x::DOUBLE + (0.16688267218838815::DOUBLE) * y::DOUBLE >= (2.175300228530949::DOUBLE)
                                    THEN 181
                                    ELSE 143
                                  END
                                  ELSE CASE WHEN (0.9430752895026305::DOUBLE) * x::DOUBLE + (-0.33257931133720514::DOUBLE) * y::DOUBLE >= (1.7405602086032688::DOUBLE)
                                    THEN 181
                                    ELSE 142
                                  END
                                END
                                ELSE CASE WHEN (0.9921528655851897::DOUBLE) * x::DOUBLE + (-0.1250307614593173::DOUBLE) * y::DOUBLE >= (1.5624899096740514::DOUBLE)
                                  THEN 143
                                  ELSE 118
                                END
                              END
                            END
                          END
                          ELSE CASE WHEN (0.337053765110162::DOUBLE) * x::DOUBLE + (0.9414854005373975::DOUBLE) * y::DOUBLE >= (1.6003527119828114::DOUBLE)
                            THEN CASE WHEN (0.6473008407960948::DOUBLE) * x::DOUBLE + (-0.7622346236590599::DOUBLE) * y::DOUBLE >= (-0.0667144241226979::DOUBLE)
                              THEN CASE WHEN (0.12282547620495653::DOUBLE) * x::DOUBLE + (0.9924282857693173::DOUBLE) * y::DOUBLE >= (1.5605875815500405::DOUBLE)
                                THEN CASE WHEN (0.9001017284337872::DOUBLE) * x::DOUBLE + (-0.4356797889167097::DOUBLE) * y::DOUBLE >= (1.000206422194633::DOUBLE)
                                  THEN 161
                                  ELSE 131
                                END
                                ELSE CASE WHEN (0.8404334980285004::DOUBLE) * x::DOUBLE + (0.5419146938325059::DOUBLE) * y::DOUBLE >= (2.2183302974486487::DOUBLE)
                                  THEN 161
                                  ELSE 127
                                END
                              END
                              ELSE CASE WHEN (0.9496982182296484::DOUBLE) * x::DOUBLE + (0.31316655998275267::DOUBLE) * y::DOUBLE >= (1.4917824864816325::DOUBLE)
                                THEN CASE WHEN (0.9494375538434233::DOUBLE) * x::DOUBLE + (0.31395593855160064::DOUBLE) * y::DOUBLE >= (1.8834340655304969::DOUBLE)
                                  THEN 131
                                  ELSE 103
                                END
                                ELSE 77
                              END
                            END
                            ELSE CASE WHEN (0.18464683354478498::DOUBLE) * x::DOUBLE + (-0.982804938358515::DOUBLE) * y::DOUBLE >= (-0.6238486360281148::DOUBLE)
                              THEN CASE WHEN (0.9474393702884218::DOUBLE) * x::DOUBLE + (-0.3199353678908892::DOUBLE) * y::DOUBLE >= (1.076972459225454::DOUBLE)
                                THEN CASE WHEN (0.182213303600904::DOUBLE) * x::DOUBLE + (0.9832590258883184::DOUBLE) * y::DOUBLE >= (1.1182735430067188::DOUBLE)
                                  THEN 127
                                  ELSE 118
                                END
                                ELSE CASE WHEN (0.6395593028162301::DOUBLE) * x::DOUBLE + (0.7687417630005654::DOUBLE) * y::DOUBLE >= (1.585753579667141::DOUBLE)
                                  THEN 127
                                  ELSE 97
                                END
                              END
                              ELSE CASE WHEN (0.5690930153410241::DOUBLE) * x::DOUBLE + (-0.8222731540613868::DOUBLE) * y::DOUBLE >= (-0.4086060665036211::DOUBLE)
                                THEN CASE WHEN (0.9806148884625324::DOUBLE) * x::DOUBLE + (0.1959449936222287::DOUBLE) * y::DOUBLE >= (1.5490388686182088::DOUBLE)
                                  THEN 127
                                  ELSE 94
                                END
                                ELSE 77
                              END
                            END
                          END
                        END
                        ELSE CASE WHEN (0.6384718177340614::DOUBLE) * x::DOUBLE + (0.7696452026481835::DOUBLE) * y::DOUBLE >= (2.319886390649776::DOUBLE)
                          THEN CASE WHEN (0.4953391999861251::DOUBLE) * x::DOUBLE + (-0.8686996471491775::DOUBLE) * y::DOUBLE >= (-1.3139736377914848::DOUBLE)
                            THEN CASE WHEN (0.6522203399173018::DOUBLE) * x::DOUBLE + (-0.7580294375538192::DOUBLE) * y::DOUBLE >= (-0.398139772729756::DOUBLE)
                              THEN CASE WHEN (0.6924415288626146::DOUBLE) * x::DOUBLE + (0.7214739975261789::DOUBLE) * y::DOUBLE >= (2.534634747968946::DOUBLE)
                                THEN CASE WHEN (0.1281450063809711::DOUBLE) * x::DOUBLE + (-0.9917554423040092::DOUBLE) * y::DOUBLE >= (-1.4107750241930015::DOUBLE)
                                  THEN 161
                                  ELSE 154
                                END
                                ELSE CASE WHEN (0.9001017284337872::DOUBLE) * x::DOUBLE + (-0.4356797889167097::DOUBLE) * y::DOUBLE >= (1.000206422194633::DOUBLE)
                                  THEN 161
                                  ELSE 131
                                END
                              END
                              ELSE CASE WHEN (0.7286309371017176::DOUBLE) * x::DOUBLE + (0.6849065319430622::DOUBLE) * y::DOUBLE >= (2.604241973857043::DOUBLE)
                                THEN CASE WHEN (0.4985369080992971::DOUBLE) * x::DOUBLE + (-0.8668684740275152::DOUBLE) * y::DOUBLE >= (-0.9508353704316423::DOUBLE)
                                  THEN 154
                                  ELSE 136
                                END
                                ELSE CASE WHEN (0.9964323163336011::DOUBLE) * x::DOUBLE + (-0.08439572836378752::DOUBLE) * y::DOUBLE >= (1.472162212116961::DOUBLE)
                                  THEN 154
                                  ELSE 104
                                END
                              END
                            END
                            ELSE CASE WHEN (0.6158542673876899::DOUBLE) * x::DOUBLE + (0.7878600899527605::DOUBLE) * y::DOUBLE >= (2.782835429855796::DOUBLE)
                              THEN CASE WHEN (0.692779146366729::DOUBLE) * x::DOUBLE + (-0.7211498140881589::DOUBLE) * y::DOUBLE >= (-0.7805697011781663::DOUBLE)
                                THEN CASE WHEN (0.33939339619954445::DOUBLE) * x::DOUBLE + (0.9406445251082574::DOUBLE) * y::DOUBLE >= (3.064782998108969::DOUBLE)
                                  THEN 149
                                  ELSE 136
                                END
                                ELSE CASE WHEN (0.986133423520729::DOUBLE) * x::DOUBLE + (0.1659544245125348::DOUBLE) * y::DOUBLE >= (2.0657735861774102::DOUBLE)
                                  THEN 149
                                  ELSE 111
                                END
                              END
                              ELSE CASE WHEN (0.9992423245205613::DOUBLE) * x::DOUBLE + (-0.03892013472157168::DOUBLE) * y::DOUBLE >= (1.3102496788734348::DOUBLE)
                                THEN 136
                                ELSE 89
                              END
                            END
                          END
                          ELSE CASE WHEN (0.9721692327411986::DOUBLE) * x::DOUBLE + (-0.23427971084024596::DOUBLE) * y::DOUBLE >= (0.5047924958455197::DOUBLE)
                            THEN CASE WHEN (0.8850197015743707::DOUBLE) * x::DOUBLE + (-0.4655535713805791::DOUBLE) * y::DOUBLE >= (0.19376306880911442::DOUBLE)
                              THEN CASE WHEN (0.9496982182296484::DOUBLE) * x::DOUBLE + (0.31316655998275267::DOUBLE) * y::DOUBLE >= (1.4917824864816325::DOUBLE)
                                THEN CASE WHEN (0.05177241444049341::DOUBLE) * x::DOUBLE + (0.9986589092893539::DOUBLE) * y::DOUBLE >= (1.8082926590367352::DOUBLE)
                                  THEN CASE WHEN (0.6522203399173018::DOUBLE) * x::DOUBLE + (-0.7580294375538192::DOUBLE) * y::DOUBLE >= (-0.398139772729756::DOUBLE)
                                    THEN 131
                                    ELSE 104
                                  END
                                  ELSE CASE WHEN (0.9494375538434233::DOUBLE) * x::DOUBLE + (0.31395593855160064::DOUBLE) * y::DOUBLE >= (1.8834340655304969::DOUBLE)
                                    THEN 131
                                    ELSE 103
                                  END
                                END
                                ELSE 77
                              END
                              ELSE CASE WHEN (0.18981581856333918::DOUBLE) * x::DOUBLE + (-0.9818197161511525::DOUBLE) * y::DOUBLE >= (-1.3516549505543818::DOUBLE)
                                THEN 77
                                ELSE CASE WHEN (0.10356883177481802::DOUBLE) * x::DOUBLE + (-0.9946222886527325::DOUBLE) * y::DOUBLE >= (-1.7979717428120128::DOUBLE)
                                  THEN CASE WHEN (0.87201635834114::DOUBLE) * x::DOUBLE + (0.4894767316078023::DOUBLE) * y::DOUBLE >= (1.8517689745013444::DOUBLE)
                                    THEN 104
                                    ELSE 71
                                  END
                                  ELSE CASE WHEN (0.9927325606167376::DOUBLE) * x::DOUBLE + (-0.12034144378116586::DOUBLE) * y::DOUBLE >= (0.8093466301467381::DOUBLE)
                                    THEN 104
                                    ELSE 67
                                  END
                                END
                              END
                            END
                            ELSE CASE WHEN (0.10356883177481802::DOUBLE) * x::DOUBLE + (-0.9946222886527325::DOUBLE) * y::DOUBLE >= (-1.7979717428120128::DOUBLE)
                              THEN CASE WHEN (0.18981581856333918::DOUBLE) * x::DOUBLE + (-0.9818197161511525::DOUBLE) * y::DOUBLE >= (-1.3516549505543818::DOUBLE)
                                THEN 77
                                ELSE CASE WHEN (0.4674301804152028::DOUBLE) * x::DOUBLE + (-0.8840299918198539::DOUBLE) * y::DOUBLE >= (-1.366368259643603::DOUBLE)
                                  THEN CASE WHEN (0.872307363953677::DOUBLE) * x::DOUBLE + (0.48895793560610834::DOUBLE) * y::DOUBLE >= (1.3650144427467228::DOUBLE)
                                    THEN 71
                                    ELSE 38
                                  END
                                  ELSE CASE WHEN (0.9378380237686239::DOUBLE) * x::DOUBLE + (-0.3470732504439981::DOUBLE) * y::DOUBLE >= (-0.13002739747001357::DOUBLE)
                                    THEN 71
                                    ELSE 25
                                  END
                                END
                              END
                              ELSE CASE WHEN (0.6579596411028803::DOUBLE) * x::DOUBLE + (0.7530531924636992::DOUBLE) * y::DOUBLE >= (1.8805381744594456::DOUBLE)
                                THEN CASE WHEN (0.6435079746013573::DOUBLE) * x::DOUBLE + (-0.7654394075460571::DOUBLE) * y::DOUBLE >= (-1.2347818284457222::DOUBLE)
                                  THEN 67
                                  ELSE 48
                                END
                                ELSE CASE WHEN (0.9809591959203011::DOUBLE) * x::DOUBLE + (0.19421394373060974::DOUBLE) * y::DOUBLE >= (0.9033292487673288::DOUBLE)
                                  THEN 67
                                  ELSE 25
                                END
                              END
                            END
                          END
                        END
                      END
                      ELSE CASE WHEN (0.31851718519751465::DOUBLE) * x::DOUBLE + (-0.947917086423624::DOUBLE) * y::DOUBLE >= (-0.34079666722395263::DOUBLE)
                        THEN CASE WHEN (0.9637720766042209::DOUBLE) * x::DOUBLE + (-0.26672717214034897::DOUBLE) * y::DOUBLE >= (0.7889272996316272::DOUBLE)
                          THEN CASE WHEN (0.9926136930804447::DOUBLE) * x::DOUBLE + (-0.1213179966418871::DOUBLE) * y::DOUBLE >= (1.3533314220934023::DOUBLE)
                            THEN CASE WHEN (0.9799540607396757::DOUBLE) * x::DOUBLE + (0.1992235900685955::DOUBLE) * y::DOUBLE >= (1.7206892744951185::DOUBLE)
                              THEN CASE WHEN (0.27516313578161755::DOUBLE) * x::DOUBLE + (-0.9613975497715953::DOUBLE) * y::DOUBLE >= (0.13717971562914433::DOUBLE)
                                THEN CASE WHEN (0.9938308959309307::DOUBLE) * x::DOUBLE + (0.11090604263575347::DOUBLE) * y::DOUBLE >= (2.0547561928561913::DOUBLE)
                                  THEN 168
                                  ELSE 148
                                END
                                ELSE 143
                              END
                              ELSE CASE WHEN (0.14222729133013035::DOUBLE) * x::DOUBLE + (-0.9898340252794376::DOUBLE) * y::DOUBLE >= (-0.15028569596919245::DOUBLE)
                                THEN CASE WHEN (0.5790455972407993::DOUBLE) * x::DOUBLE + (0.8152951590166877::DOUBLE) * y::DOUBLE >= (1.2539703281130608::DOUBLE)
                                  THEN 143
                                  ELSE 124
                                END
                                ELSE CASE WHEN (0.9921528655851897::DOUBLE) * x::DOUBLE + (-0.1250307614593173::DOUBLE) * y::DOUBLE >= (1.5624899096740514::DOUBLE)
                                  THEN 143
                                  ELSE 118
                                END
                              END
                            END
                            ELSE CASE WHEN (0.73153952193346::DOUBLE) * x::DOUBLE + (0.6817990377298615::DOUBLE) * y::DOUBLE >= (1.1388294756416604::DOUBLE)
                              THEN CASE WHEN (0.05636444271046487::DOUBLE) * x::DOUBLE + (-0.9984102611641863::DOUBLE) * y::DOUBLE >= (-0.36816698369464745::DOUBLE)
                                THEN CASE WHEN (0.5857820468753623::DOUBLE) * x::DOUBLE + (0.8104686258940015::DOUBLE) * y::DOUBLE >= (1.1108623896098169::DOUBLE)
                                  THEN 118
                                  ELSE 100
                                END
                                ELSE CASE WHEN (0.9474393702884218::DOUBLE) * x::DOUBLE + (-0.3199353678908892::DOUBLE) * y::DOUBLE >= (1.076972459225454::DOUBLE)
                                  THEN 118
                                  ELSE 97
                                END
                              END
                              ELSE CASE WHEN (0.1350838791996305::DOUBLE) * x::DOUBLE + (-0.9908341665386695::DOUBLE) * y::DOUBLE >= (-0.1252430096152151::DOUBLE)
                                THEN CASE WHEN (0.9365469973921499::DOUBLE) * x::DOUBLE + (0.35054203981227217::DOUBLE) * y::DOUBLE >= (1.0792041858148438::DOUBLE)
                                  THEN 100
                                  ELSE 82
                                END
                                ELSE CASE WHEN (0.8514056411537999::DOUBLE) * x::DOUBLE + (-0.5245078018595023::DOUBLE) * y::DOUBLE >= (0.7536561093081262::DOUBLE)
                                  THEN 100
                                  ELSE 78
                                END
                              END
                            END
                          END
                          ELSE CASE WHEN (0.997300987943293::DOUBLE) * x::DOUBLE + (0.073421655166113::DOUBLE) * y::DOUBLE >= (0.735626064816989::DOUBLE)
                            THEN CASE WHEN (0.23910700783830627::DOUBLE) * x::DOUBLE + (-0.9709932228407221::DOUBLE) * y::DOUBLE >= (-0.2121387031721757::DOUBLE)
                              THEN CASE WHEN (0.6747137479500962::DOUBLE) * x::DOUBLE + (0.7380795067790014::DOUBLE) * y::DOUBLE >= (0.747823305135726::DOUBLE)
                                THEN CASE WHEN (0.1350838791996305::DOUBLE) * x::DOUBLE + (-0.9908341665386695::DOUBLE) * y::DOUBLE >= (-0.1252430096152151::DOUBLE)
                                  THEN 82
                                  ELSE 78
                                END
                                ELSE CASE WHEN (0.9855063581058584::DOUBLE) * x::DOUBLE + (-0.16963849248601437::DOUBLE) * y::DOUBLE >= (0.7909827819849299::DOUBLE)
                                  THEN 82
                                  ELSE 56
                                END
                              END
                              ELSE CASE WHEN (0.8240273153206304::DOUBLE) * x::DOUBLE + (0.5665500715783858::DOUBLE) * y::DOUBLE >= (0.9697185891978488::DOUBLE)
                                THEN CASE WHEN (0.22871900351692265::DOUBLE) * x::DOUBLE + (-0.9734924845268329::DOUBLE) * y::DOUBLE >= (-0.36861873253448885::DOUBLE)
                                  THEN 78
                                  ELSE 70
                                END
                                ELSE CASE WHEN (0.8617739042898006::DOUBLE) * x::DOUBLE + (-0.5072925565047386::DOUBLE) * y::DOUBLE >= (0.39381990752825197::DOUBLE)
                                  THEN 78
                                  ELSE 50
                                END
                              END
                            END
                            ELSE CASE WHEN (0.8960164454861668::DOUBLE) * x::DOUBLE + (-0.4440208659717862::DOUBLE) * y::DOUBLE >= (0.17351534505767358::DOUBLE)
                              THEN CASE WHEN (0.3415020136052592::DOUBLE) * x::DOUBLE + (0.939881042847207::DOUBLE) * y::DOUBLE >= (0.639501598021006::DOUBLE)
                                THEN 50
                                ELSE CASE WHEN (0.34309058808206805::DOUBLE) * x::DOUBLE + (0.9393023200064508::DOUBLE) * y::DOUBLE >= (0.3788849109609559::DOUBLE)
                                  THEN CASE WHEN (0.664557297872969::DOUBLE) * x::DOUBLE + (-0.7472373102594503::DOUBLE) * y::DOUBLE >= (0.20089109331007332::DOUBLE)
                                    THEN 56
                                    ELSE 42
                                  END
                                  ELSE CASE WHEN (0.9867758998737957::DOUBLE) * x::DOUBLE + (0.1620904791413138::DOUBLE) * y::DOUBLE >= (0.562368302860539::DOUBLE)
                                    THEN 56
                                    ELSE 35
                                  END
                                END
                              END
                              ELSE CASE WHEN (0.3123827445586045::DOUBLE) * x::DOUBLE + (0.9499563257866298::DOUBLE) * y::DOUBLE >= (0.4886635041046627::DOUBLE)
                                THEN CASE WHEN (0.600150714884836::DOUBLE) * x::DOUBLE + (-0.7998869416506438::DOUBLE) * y::DOUBLE >= (-0.17175590806013977::DOUBLE)
                                  THEN 42
                                  ELSE 27
                                END
                                ELSE CASE WHEN (0.9308459043463027::DOUBLE) * x::DOUBLE + (0.36541196253230956::DOUBLE) * y::DOUBLE >= (0.4131014768670852::DOUBLE)
                                  THEN 42
                                  ELSE 13
                                END
                              END
                            END
                          END
                        END
                        ELSE CASE WHEN (0.43722332175190504::DOUBLE) * x::DOUBLE + (0.899352971261134::DOUBLE) * y::DOUBLE >= (1.1381201480129248::DOUBLE)
                          THEN CASE WHEN (0.3474878917551729::DOUBLE) * x::DOUBLE + (-0.9376844698956814::DOUBLE) * y::DOUBLE >= (-1.058803897286493::DOUBLE)
                            THEN CASE WHEN (0.5106759556038243::DOUBLE) * x::DOUBLE + (-0.8597732656742247::DOUBLE) * y::DOUBLE >= (-0.4509529967659739::DOUBLE)
                              THEN CASE WHEN (0.7374848188235212::DOUBLE) * x::DOUBLE + (0.6753637109031237::DOUBLE) * y::DOUBLE >= (1.335237709711155::DOUBLE)
                                THEN CASE WHEN (0.18464683354478498::DOUBLE) * x::DOUBLE + (-0.982804938358515::DOUBLE) * y::DOUBLE >= (-0.6238486360281148::DOUBLE)
                                  THEN 97
                                  ELSE 94
                                END
                                ELSE CASE WHEN (0.9637720766042209::DOUBLE) * x::DOUBLE + (-0.26672717214034897::DOUBLE) * y::DOUBLE >= (0.7889272996316272::DOUBLE)
                                  THEN 97
                                  ELSE 70
                                END
                              END
                              ELSE CASE WHEN (0.9840422893663715::DOUBLE) * x::DOUBLE + (0.17793474292164074::DOUBLE) * y::DOUBLE >= (0.5904768658614025::DOUBLE)
                                THEN CASE WHEN (0.7972106561135206::DOUBLE) * x::DOUBLE + (0.6037012255901506::DOUBLE) * y::DOUBLE >= (1.361422055939566::DOUBLE)
                                  THEN CASE WHEN (0.5690930153410241::DOUBLE) * x::DOUBLE + (-0.8222731540613868::DOUBLE) * y::DOUBLE >= (-0.4086060665036211::DOUBLE)
                                    THEN 94
                                    ELSE 77
                                  END
                                  ELSE CASE WHEN (0.9834892112359339::DOUBLE) * x::DOUBLE + (-0.18096676872431727::DOUBLE) * y::DOUBLE >= (0.6598191166378309::DOUBLE)
                                    THEN 94
                                    ELSE 53
                                  END
                                END
                                ELSE 19
                              END
                            END
                            ELSE CASE WHEN (0.9911097983399672::DOUBLE) * x::DOUBLE + (-0.13304648674245276::DOUBLE) * y::DOUBLE >= (0.33128645356882813::DOUBLE)
                              THEN CASE WHEN (0.872307363953677::DOUBLE) * x::DOUBLE + (0.48895793560610834::DOUBLE) * y::DOUBLE >= (1.3650144427467228::DOUBLE)
                                THEN CASE WHEN (0.18981581856333918::DOUBLE) * x::DOUBLE + (-0.9818197161511525::DOUBLE) * y::DOUBLE >= (-1.3516549505543818::DOUBLE)
                                  THEN 77
                                  ELSE 71
                                END
                                ELSE CASE WHEN (0.9415044581233254::DOUBLE) * x::DOUBLE + (-0.3370005272012247::DOUBLE) * y::DOUBLE >= (0.1631788763600226::DOUBLE)
                                  THEN 77
                                  ELSE 38
                                END
                              END
                              ELSE CASE WHEN (0.12583470036738512::DOUBLE) * x::DOUBLE + (-0.9920512225603326::DOUBLE) * y::DOUBLE >= (-1.2337311033530838::DOUBLE)
                                THEN CASE WHEN (0.5199400548949892::DOUBLE) * x::DOUBLE + (0.8542027507072285::DOUBLE) * y::DOUBLE >= (1.2748894697842283::DOUBLE)
                                  THEN 38
                                  ELSE 19
                                END
                                ELSE CASE WHEN (0.21305598466903428::DOUBLE) * x::DOUBLE + (0.9770399927314686::DOUBLE) * y::DOUBLE >= (1.7090374263601735::DOUBLE)
                                  THEN CASE WHEN (0.4674301804152028::DOUBLE) * x::DOUBLE + (-0.8840299918198539::DOUBLE) * y::DOUBLE >= (-1.366368259643603::DOUBLE)
                                    THEN 38
                                    ELSE 25
                                  END
                                  ELSE CASE WHEN (0.9869628417957934::DOUBLE) * x::DOUBLE + (0.16094828024670396::DOUBLE) * y::DOUBLE >= (0.5410157587655471::DOUBLE)
                                    THEN 38
                                    ELSE 10
                                  END
                                END
                              END
                            END
                          END
                          ELSE CASE WHEN (0.6674670078746153::DOUBLE) * x::DOUBLE + (0.7446393713730884::DOUBLE) * y::DOUBLE >= (0.8199447637350816::DOUBLE)
                            THEN CASE WHEN (0.8219986534666159::DOUBLE) * x::DOUBLE + (-0.569489432473571::DOUBLE) * y::DOUBLE >= (-0.2734414373143604::DOUBLE)
                              THEN CASE WHEN (0.9637720766042209::DOUBLE) * x::DOUBLE + (-0.26672717214034897::DOUBLE) * y::DOUBLE >= (0.7889272996316272::DOUBLE)
                                THEN 97
                                ELSE CASE WHEN (0.3688845889052684::DOUBLE) * x::DOUBLE + (-0.9294752068066104::DOUBLE) * y::DOUBLE >= (-0.48296583772147417::DOUBLE)
                                  THEN CASE WHEN (0.8240273153206304::DOUBLE) * x::DOUBLE + (0.5665500715783858::DOUBLE) * y::DOUBLE >= (0.9697185891978488::DOUBLE)
                                    THEN 70
                                    ELSE 50
                                  END
                                  ELSE CASE WHEN (0.9657162181929653::DOUBLE) * x::DOUBLE + (-0.25960004992117586::DOUBLE) * y::DOUBLE >= (0.4205616414300528::DOUBLE)
                                    THEN 70
                                    ELSE 39
                                  END
                                END
                              END
                              ELSE CASE WHEN (0.12583470036738512::DOUBLE) * x::DOUBLE + (-0.9920512225603326::DOUBLE) * y::DOUBLE >= (-1.2337311033530838::DOUBLE)
                                THEN 19
                                ELSE 10
                              END
                            END
                            ELSE CASE WHEN (0.8393267058197731::DOUBLE) * x::DOUBLE + (-0.5436273364150557::DOUBLE) * y::DOUBLE >= (-0.024545410338259133::DOUBLE)
                              THEN CASE WHEN (0.600150714884836::DOUBLE) * x::DOUBLE + (-0.7998869416506438::DOUBLE) * y::DOUBLE >= (-0.17175590806013977::DOUBLE)
                                THEN CASE WHEN (0.3415020136052592::DOUBLE) * x::DOUBLE + (0.939881042847207::DOUBLE) * y::DOUBLE >= (0.639501598021006::DOUBLE)
                                  THEN 50
                                  ELSE 42
                                END
                                ELSE CASE WHEN (0.9831861426452392::DOUBLE) * x::DOUBLE + (-0.18260615792019533::DOUBLE) * y::DOUBLE >= (0.3146289441861427::DOUBLE)
                                  THEN 50
                                  ELSE 27
                                END
                              END
                              ELSE CASE WHEN (0.14576298171463198::DOUBLE) * x::DOUBLE + (-0.9893195404729757::DOUBLE) * y::DOUBLE >= (-0.41120595560452367::DOUBLE)
                                THEN CASE WHEN (0.3123827445586045::DOUBLE) * x::DOUBLE + (0.9499563257866298::DOUBLE) * y::DOUBLE >= (0.4886635041046627::DOUBLE)
                                  THEN 27
                                  ELSE 13
                                END
                                ELSE CASE WHEN (0.22607274180873127::DOUBLE) * x::DOUBLE + (0.9741104225964747::DOUBLE) * y::DOUBLE >= (0.8583022011774821::DOUBLE)
                                  THEN CASE WHEN (0.23274424381173747::DOUBLE) * x::DOUBLE + (-0.97253797713637::DOUBLE) * y::DOUBLE >= (-0.7777559073204349::DOUBLE)
                                    THEN 27
                                    ELSE 19
                                  END
                                  ELSE CASE WHEN (0.9961527072976574::DOUBLE) * x::DOUBLE + (0.08763437535321245::DOUBLE) * y::DOUBLE >= (0.2457094716830294::DOUBLE)
                                    THEN 27
                                    ELSE 4
                                  END
                                END
                              END
                            END
                          END
                        END
                      END
                    END
                  END
                  ELSE CASE WHEN (0.20528248642499672::DOUBLE) * x::DOUBLE + (-0.9787027642584705::DOUBLE) * y::DOUBLE >= (-3.6754107900595225::DOUBLE)
                    THEN CASE WHEN (0.993352346255978::DOUBLE) * x::DOUBLE + (-0.11511349263984356::DOUBLE) * y::DOUBLE >= (0.4721296534053682::DOUBLE)
                      THEN CASE WHEN (0.9537504902381255::DOUBLE) * x::DOUBLE + (0.3005994051400223::DOUBLE) * y::DOUBLE >= (2.3457544536585075::DOUBLE)
                        THEN CASE WHEN (0.2966533156616092::DOUBLE) * x::DOUBLE + (-0.9549852408843676::DOUBLE) * y::DOUBLE >= (-2.812385215173262::DOUBLE)
                          THEN CASE WHEN (0.8813445076736662::DOUBLE) * x::DOUBLE + (0.47247418849442235::DOUBLE) * y::DOUBLE >= (3.2478801657054923::DOUBLE)
                            THEN CASE WHEN (0.9399405844692189::DOUBLE) * x::DOUBLE + (0.3413380987637668::DOUBLE) * y::DOUBLE >= (3.4461809707179656::DOUBLE)
                              THEN CASE WHEN (0.6643996045986932::DOUBLE) * x::DOUBLE + (-0.7473775253572323::DOUBLE) * y::DOUBLE >= (-0.8590505475050503::DOUBLE)
                                THEN CASE WHEN (0.22689734567490913::DOUBLE) * x::DOUBLE + (0.9739186796266311::DOUBLE) * y::DOUBLE >= (4.029006479577707::DOUBLE)
                                  THEN 215
                                  ELSE 206
                                END
                                ELSE CASE WHEN (0.9654953918233063::DOUBLE) * x::DOUBLE + (0.26042013817667836::DOUBLE) * y::DOUBLE >= (3.486665927048136::DOUBLE)
                                  THEN 215
                                  ELSE 179
                                END
                              END
                              ELSE CASE WHEN (0.7590525893187136::DOUBLE) * x::DOUBLE + (-0.6510293132022218::DOUBLE) * y::DOUBLE >= (-0.44836739421774485::DOUBLE)
                                THEN CASE WHEN (0.10873160919993988::DOUBLE) * x::DOUBLE + (0.9940711429071823::DOUBLE) * y::DOUBLE >= (3.5801028941956066::DOUBLE)
                                  THEN 179
                                  ELSE 177
                                END
                                ELSE CASE WHEN (0.8013322555255159::DOUBLE) * x::DOUBLE + (0.5982195385093916::DOUBLE) * y::DOUBLE >= (3.8352246304494226::DOUBLE)
                                  THEN 179
                                  ELSE 157
                                END
                              END
                            END
                            ELSE CASE WHEN (0.36299961620150173::DOUBLE) * x::DOUBLE + (0.9317892887544708::DOUBLE) * y::DOUBLE >= (3.348696122922929::DOUBLE)
                              THEN CASE WHEN (0.5683331334418573::DOUBLE) * x::DOUBLE + (-0.8227985472958493::DOUBLE) * y::DOUBLE >= (-1.5396379441512877::DOUBLE)
                                THEN CASE WHEN (0.21582229491698224::DOUBLE) * x::DOUBLE + (0.9764326587209008::DOUBLE) * y::DOUBLE >= (3.4359126846054937::DOUBLE)
                                  THEN 157
                                  ELSE 149
                                END
                                ELSE CASE WHEN (0.994371976048088::DOUBLE) * x::DOUBLE + (0.10594514264571336::DOUBLE) * y::DOUBLE >= (2.1273890285217174::DOUBLE)
                                  THEN 157
                                  ELSE 126
                                END
                              END
                              ELSE CASE WHEN (0.986133423520729::DOUBLE) * x::DOUBLE + (0.1659544245125348::DOUBLE) * y::DOUBLE >= (2.0657735861774102::DOUBLE)
                                THEN 149
                                ELSE 111
                              END
                            END
                          END
                          ELSE CASE WHEN (0.993011714559471::DOUBLE) * x::DOUBLE + (-0.11801582414091681::DOUBLE) * y::DOUBLE >= (1.209003162544939::DOUBLE)
                            THEN CASE WHEN (0.9803688581329099::DOUBLE) * x::DOUBLE + (-0.19717226479191888::DOUBLE) * y::DOUBLE >= (1.075309523422483::DOUBLE)
                              THEN CASE WHEN (0.599609075401798::DOUBLE) * x::DOUBLE + (0.8002930442630382::DOUBLE) * y::DOUBLE >= (4.332474539507704::DOUBLE)
                                THEN CASE WHEN (0.48381427196572974::DOUBLE) * x::DOUBLE + (-0.8751706977740233::DOUBLE) * y::DOUBLE >= (-2.284590973115818::DOUBLE)
                                  THEN 179
                                  ELSE 164
                                END
                                ELSE CASE WHEN (0.9683135971343708::DOUBLE) * x::DOUBLE + (-0.24973741731005303::DOUBLE) * y::DOUBLE >= (1.1354950477183605::DOUBLE)
                                  THEN 179
                                  ELSE 147
                                END
                              END
                              ELSE CASE WHEN (0.5451637828170108::DOUBLE) * x::DOUBLE + (0.8383295592454361::DOUBLE) * y::DOUBLE >= (3.8924383634816495::DOUBLE)
                                THEN CASE WHEN (0.31921914556985814::DOUBLE) * x::DOUBLE + (-0.9476809257876037::DOUBLE) * y::DOUBLE >= (-3.1753915341153087::DOUBLE)
                                  THEN 147
                                  ELSE 137
                                END
                                ELSE 126
                              END
                            END
                            ELSE CASE WHEN (0.7543093969416215::DOUBLE) * x::DOUBLE + (0.6565191038237711::DOUBLE) * y::DOUBLE >= (3.7116248600570803::DOUBLE)
                              THEN CASE WHEN (0.05522420055694435::DOUBLE) * x::DOUBLE + (-0.9984739794670898::DOUBLE) * y::DOUBLE >= (-3.924835186717931::DOUBLE)
                                THEN CASE WHEN (0.5981590827621664::DOUBLE) * x::DOUBLE + (0.8013773840763937::DOUBLE) * y::DOUBLE >= (4.146274248848999::DOUBLE)
                                  THEN 137
                                  ELSE 117
                                END
                                ELSE CASE WHEN (0.9807810560422892::DOUBLE) * x::DOUBLE + (-0.19511155811117897::DOUBLE) * y::DOUBLE >= (0.7370548463429548::DOUBLE)
                                  THEN 137
                                  ELSE 114
                                END
                              END
                              ELSE CASE WHEN (0.7242518270880766::DOUBLE) * x::DOUBLE + (-0.6895355617802339::DOUBLE) * y::DOUBLE >= (-1.7289846614870612::DOUBLE)
                                THEN CASE WHEN (0.21479142791653275::DOUBLE) * x::DOUBLE + (-0.9766599420952908::DOUBLE) * y::DOUBLE >= (-3.1388309035600437::DOUBLE)
                                  THEN 126
                                  ELSE 117
                                END
                                ELSE 99
                              END
                            END
                          END
                        END
                        ELSE CASE WHEN (0.06360038830476598::DOUBLE) * x::DOUBLE + (-0.9979754458940776::DOUBLE) * y::DOUBLE >= (-3.132288802059844::DOUBLE)
                          THEN CASE WHEN (0.6158542673876899::DOUBLE) * x::DOUBLE + (0.7878600899527605::DOUBLE) * y::DOUBLE >= (2.782835429855796::DOUBLE)
                            THEN CASE WHEN (0.5657330218374181::DOUBLE) * x::DOUBLE + (0.8245884719074742::DOUBLE) * y::DOUBLE >= (3.0549648516100762::DOUBLE)
                              THEN CASE WHEN (0.4262722605732679::DOUBLE) * x::DOUBLE + (-0.9045949147910108::DOUBLE) * y::DOUBLE >= (-2.187728670640325::DOUBLE)
                                THEN CASE WHEN (0.36299961620150173::DOUBLE) * x::DOUBLE + (0.9317892887544708::DOUBLE) * y::DOUBLE >= (3.348696122922929::DOUBLE)
                                  THEN 126
                                  ELSE 111
                                END
                                ELSE CASE WHEN (0.9965721989488876::DOUBLE) * x::DOUBLE + (0.08272757872788676::DOUBLE) * y::DOUBLE >= (1.614059958761661::DOUBLE)
                                  THEN 126
                                  ELSE 92
                                END
                              END
                              ELSE CASE WHEN (0.9919248868638485::DOUBLE) * x::DOUBLE + (-0.12682672754644958::DOUBLE) * y::DOUBLE >= (0.7293901040302679::DOUBLE)
                                THEN 111
                                ELSE 69
                              END
                            END
                            ELSE CASE WHEN (0.6435079746013573::DOUBLE) * x::DOUBLE + (-0.7654394075460571::DOUBLE) * y::DOUBLE >= (-1.2347818284457222::DOUBLE)
                              THEN CASE WHEN (0.6384718177340614::DOUBLE) * x::DOUBLE + (0.7696452026481835::DOUBLE) * y::DOUBLE >= (2.319886390649776::DOUBLE)
                                THEN 89
                                ELSE 67
                              END
                              ELSE CASE WHEN (0.44644177091882226::DOUBLE) * x::DOUBLE + (0.8948126872026713::DOUBLE) * y::DOUBLE >= (2.615512526346672::DOUBLE)
                                THEN CASE WHEN (0.536063886217739::DOUBLE) * x::DOUBLE + (-0.8441774161236102::DOUBLE) * y::DOUBLE >= (-1.6912231710794021::DOUBLE)
                                  THEN 89
                                  ELSE 69
                                END
                                ELSE CASE WHEN (0.990433455033025::DOUBLE) * x::DOUBLE + (0.1379911995431031::DOUBLE) * y::DOUBLE >= (1.1507127670812904::DOUBLE)
                                  THEN 89
                                  ELSE 48
                                END
                              END
                            END
                          END
                          ELSE CASE WHEN (0.2564309615152065::DOUBLE) * x::DOUBLE + (0.9665625494381553::DOUBLE) * y::DOUBLE >= (3.8927823999673095::DOUBLE)
                            THEN CASE WHEN (0.7428335839629447::DOUBLE) * x::DOUBLE + (0.6694761134923087::DOUBLE) * y::DOUBLE >= (3.336747211305515::DOUBLE)
                              THEN CASE WHEN (0.3285864957419729::DOUBLE) * x::DOUBLE + (-0.9444738825483797::DOUBLE) * y::DOUBLE >= (-3.291727883014015::DOUBLE)
                                THEN CASE WHEN (0.33400703475850363::DOUBLE) * x::DOUBLE + (0.9425705812997941::DOUBLE) * y::DOUBLE >= (4.023881362473066::DOUBLE)
                                  THEN 99
                                  ELSE 90
                                END
                                ELSE CASE WHEN (0.9957014369148143::DOUBLE) * x::DOUBLE + (0.09262099397962575::DOUBLE) * y::DOUBLE >= (1.4700824102911265::DOUBLE)
                                  THEN 99
                                  ELSE 83
                                END
                              END
                              ELSE CASE WHEN (0.7264726602833175::DOUBLE) * x::DOUBLE + (-0.6871953680438188::DOUBLE) * y::DOUBLE >= (-1.8938129089959168::DOUBLE)
                                THEN 90
                                ELSE 74
                              END
                            END
                            ELSE CASE WHEN (0.862092339856752::DOUBLE) * x::DOUBLE + (-0.5067512186076223::DOUBLE) * y::DOUBLE >= (-0.8978611237431212::DOUBLE)
                              THEN CASE WHEN (0.05728604009446784::DOUBLE) * x::DOUBLE + (-0.9983578064052462::DOUBLE) * y::DOUBLE >= (-3.4021723346842707::DOUBLE)
                                THEN CASE WHEN (0.9965721989488876::DOUBLE) * x::DOUBLE + (0.08272757872788676::DOUBLE) * y::DOUBLE >= (1.614059958761661::DOUBLE)
                                  THEN 126
                                  ELSE 92
                                END
                                ELSE CASE WHEN (0.7722333059580027::DOUBLE) * x::DOUBLE + (-0.6353390600058948::DOUBLE) * y::DOUBLE >= (-1.1862186573073952::DOUBLE)
                                  THEN 126
                                  ELSE 90
                                END
                              END
                              ELSE CASE WHEN (0.26415556974971355::DOUBLE) * x::DOUBLE + (0.9644800853155052::DOUBLE) * y::DOUBLE >= (3.6693666049326925::DOUBLE)
                                THEN CASE WHEN (0.9976745684952241::DOUBLE) * x::DOUBLE + (-0.06815757755281829::DOUBLE) * y::DOUBLE >= (0.7021864288992294::DOUBLE)
                                  THEN 90
                                  ELSE 68
                                END
                                ELSE CASE WHEN (0.8534032903667875::DOUBLE) * x::DOUBLE + (0.5212512100620396::DOUBLE) * y::DOUBLE >= (2.655390607751754::DOUBLE)
                                  THEN 90
                                  ELSE 63
                                END
                              END
                            END
                          END
                        END
                      END
                      ELSE CASE WHEN (0.45670892570167393::DOUBLE) * x::DOUBLE + (0.8896161853206263::DOUBLE) * y::DOUBLE >= (3.2527850723245115::DOUBLE)
                        THEN CASE WHEN (0.9557205422088031::DOUBLE) * x::DOUBLE + (0.2942757978497577::DOUBLE) * y::DOUBLE >= (1.5548014375195598::DOUBLE)
                          THEN CASE WHEN (0.6929478276330069::DOUBLE) * x::DOUBLE + (0.7209877309487981::DOUBLE) * y::DOUBLE >= (3.2036318869819462::DOUBLE)
                            THEN CASE WHEN (0.7428335839629447::DOUBLE) * x::DOUBLE + (0.6694761134923087::DOUBLE) * y::DOUBLE >= (3.336747211305515::DOUBLE)
                              THEN 83
                              ELSE CASE WHEN (0.5208189893857152::DOUBLE) * x::DOUBLE + (-0.8536671367080042::DOUBLE) * y::DOUBLE >= (-2.84784636917924::DOUBLE)
                                THEN CASE WHEN (0.2564309615152065::DOUBLE) * x::DOUBLE + (0.9665625494381553::DOUBLE) * y::DOUBLE >= (3.8927823999673095::DOUBLE)
                                  THEN 74
                                  ELSE 68
                                END
                                ELSE CASE WHEN (0.9976240340912225::DOUBLE) * x::DOUBLE + (0.06889329868394664::DOUBLE) * y::DOUBLE >= (1.0510032738991963::DOUBLE)
                                  THEN 74
                                  ELSE 58
                                END
                              END
                            END
                            ELSE CASE WHEN (0.5123314738058712::DOUBLE) * x::DOUBLE + (-0.8587877857468071::DOUBLE) * y::DOUBLE >= (-2.7676624636242675::DOUBLE)
                              THEN CASE WHEN (0.7191083200878512::DOUBLE) * x::DOUBLE + (0.6948979953780473::DOUBLE) * y::DOUBLE >= (2.843005164202742::DOUBLE)
                                THEN CASE WHEN (0.26415556974971355::DOUBLE) * x::DOUBLE + (0.9644800853155052::DOUBLE) * y::DOUBLE >= (3.6693666049326925::DOUBLE)
                                  THEN 68
                                  ELSE 63
                                END
                                ELSE 51
                              END
                              ELSE CASE WHEN (0.6804508631444406::DOUBLE) * x::DOUBLE + (-0.7327937109760058::DOUBLE) * y::DOUBLE >= (-2.476005077743431::DOUBLE)
                                THEN CASE WHEN (0.9696103030450446::DOUBLE) * x::DOUBLE + (-0.24465457328424672::DOUBLE) * y::DOUBLE >= (-0.23799422157468186::DOUBLE)
                                  THEN 68
                                  ELSE 49
                                END
                                ELSE 36
                              END
                            END
                          END
                          ELSE CASE WHEN (0.48289620430695396::DOUBLE) * x::DOUBLE + (-0.8756775981295495::DOUBLE) * y::DOUBLE >= (-3.0080959267824223::DOUBLE)
                            THEN CASE WHEN (0.3032031536238253::DOUBLE) * x::DOUBLE + (0.9529259402663813::DOUBLE) * y::DOUBLE >= (3.521951338844474::DOUBLE)
                              THEN CASE WHEN (0.48868306771336917::DOUBLE) * x::DOUBLE + (-0.8724613798502778::DOUBLE) * y::DOUBLE >= (-2.8266411043585657::DOUBLE)
                                THEN CASE WHEN (0.7191083200878512::DOUBLE) * x::DOUBLE + (0.6948979953780473::DOUBLE) * y::DOUBLE >= (2.843005164202742::DOUBLE)
                                  THEN 63
                                  ELSE 51
                                END
                                ELSE CASE WHEN (0.8558002772948867::DOUBLE) * x::DOUBLE + (-0.517306374774171::DOUBLE) * y::DOUBLE >= (-1.3738309075000745::DOUBLE)
                                  THEN 63
                                  ELSE 31
                                END
                              END
                              ELSE CASE WHEN (0.8800501364504167::DOUBLE) * x::DOUBLE + (-0.474880782232344::DOUBLE) * y::DOUBLE >= (-1.2196697896946396::DOUBLE)
                                THEN 51
                                ELSE 29
                              END
                            END
                            ELSE CASE WHEN (0.9853960848299903::DOUBLE) * x::DOUBLE + (0.17027787877973524::DOUBLE) * y::DOUBLE >= (0.9085718737620347::DOUBLE)
                              THEN CASE WHEN (0.5725645710551673::DOUBLE) * x::DOUBLE + (-0.819859629432022::DOUBLE) * y::DOUBLE >= (-2.9440979792446265::DOUBLE)
                                THEN CASE WHEN (0.22457246481303425::DOUBLE) * x::DOUBLE + (0.9744573916020128::DOUBLE) * y::DOUBLE >= (3.8076364499607505::DOUBLE)
                                  THEN 36
                                  ELSE 31
                                END
                                ELSE 23
                              END
                              ELSE CASE WHEN (0.16131299045021813::DOUBLE) * x::DOUBLE + (0.9869032977511059::DOUBLE) * y::DOUBLE >= (3.666082499814007::DOUBLE)
                                THEN CASE WHEN (0.704876258904924::DOUBLE) * x::DOUBLE + (-0.7093302895211782::DOUBLE) * y::DOUBLE >= (-2.5444764675208735::DOUBLE)
                                  THEN CASE WHEN (0.16548524962664557::DOUBLE) * x::DOUBLE + (0.9862122652634202::DOUBLE) * y::DOUBLE >= (3.7712900715089197::DOUBLE)
                                    THEN 23
                                    ELSE 20
                                  END
                                  ELSE CASE WHEN (0.7672654311661593::DOUBLE) * x::DOUBLE + (0.641329679757149::DOUBLE) * y::DOUBLE >= (2.5869724832837004::DOUBLE)
                                    THEN 23
                                    ELSE 3
                                  END
                                END
                                ELSE CASE WHEN (0.9467623370638184::DOUBLE) * x::DOUBLE + (0.3219333426618882::DOUBLE) * y::DOUBLE >= (1.294476712266767::DOUBLE)
                                  THEN 20
                                  ELSE 1
                                END
                              END
                            END
                          END
                        END
                        ELSE CASE WHEN (0.40741786688361703::DOUBLE) * x::DOUBLE + (0.9132418528210385::DOUBLE) * y::DOUBLE >= (3.0294905442916265::DOUBLE)
                          THEN CASE WHEN (0.9306870617542427::DOUBLE) * x::DOUBLE + (-0.3658163379118743::DOUBLE) * y::DOUBLE >= (-0.9736703401915787::DOUBLE)
                            THEN CASE WHEN (0.7533886358164249::DOUBLE) * x::DOUBLE + (-0.6575755191783422::DOUBLE) * y::DOUBLE >= (-1.530563818911955::DOUBLE)
                              THEN CASE WHEN (0.7191083200878512::DOUBLE) * x::DOUBLE + (0.6948979953780473::DOUBLE) * y::DOUBLE >= (2.843005164202742::DOUBLE)
                                THEN 63
                                ELSE CASE WHEN (0.4198988648481708::DOUBLE) * x::DOUBLE + (-0.9075709026292202::DOUBLE) * y::DOUBLE >= (-2.4887377297372::DOUBLE)
                                  THEN 69
                                  ELSE 51
                                END
                              END
                              ELSE CASE WHEN (0.2643905998677606::DOUBLE) * x::DOUBLE + (-0.9644156835626252::DOUBLE) * y::DOUBLE >= (-3.132319187014052::DOUBLE)
                                THEN CASE WHEN (0.8889141694377651::DOUBLE) * x::DOUBLE + (0.4580737924972003::DOUBLE) * y::DOUBLE >= (1.9243464178306318::DOUBLE)
                                  THEN 51
                                  ELSE 32
                                END
                                ELSE CASE WHEN (0.8800501364504167::DOUBLE) * x::DOUBLE + (-0.474880782232344::DOUBLE) * y::DOUBLE >= (-1.2196697896946396::DOUBLE)
                                  THEN 51
                                  ELSE 29
                                END
                              END
                            END
                            ELSE CASE WHEN (0.29859871161098933::DOUBLE) * x::DOUBLE + (-0.9543787557486061::DOUBLE) * y::DOUBLE >= (-3.3711588171388::DOUBLE)
                              THEN CASE WHEN (0.027348174748400192::DOUBLE) * x::DOUBLE + (0.9996259687192659::DOUBLE) * y::DOUBLE >= (3.405348516496924::DOUBLE)
                                THEN CASE WHEN (0.9967558040396796::DOUBLE) * x::DOUBLE + (-0.08048519810009809::DOUBLE) * y::DOUBLE >= (-0.07861654859379485::DOUBLE)
                                  THEN 29
                                  ELSE 7
                                END
                                ELSE CASE WHEN (0.7973749491291614::DOUBLE) * x::DOUBLE + (0.6034842089908131::DOUBLE) * y::DOUBLE >= (2.208713017369042::DOUBLE)
                                  THEN 29
                                  ELSE 5
                                END
                              END
                              ELSE 1
                            END
                          END
                          ELSE CASE WHEN (0.17864953307542009::DOUBLE) * x::DOUBLE + (-0.9839127727252728::DOUBLE) * y::DOUBLE >= (-2.680842967554858::DOUBLE)
                            THEN CASE WHEN (0.4287365341280055::DOUBLE) * x::DOUBLE + (0.9034295679818685::DOUBLE) * y::DOUBLE >= (2.5501584154601895::DOUBLE)
                              THEN CASE WHEN (0.3179821398417118::DOUBLE) * x::DOUBLE + (-0.9480967032648547::DOUBLE) * y::DOUBLE >= (-2.313602717356947::DOUBLE)
                                THEN CASE WHEN (0.44644177091882226::DOUBLE) * x::DOUBLE + (0.8948126872026713::DOUBLE) * y::DOUBLE >= (2.615512526346672::DOUBLE)
                                  THEN 69
                                  ELSE 48
                                END
                                ELSE CASE WHEN (0.9909597100602979::DOUBLE) * x::DOUBLE + (-0.1341598041039503::DOUBLE) * y::DOUBLE >= (0.21992592266994743::DOUBLE)
                                  THEN 69
                                  ELSE 34
                                END
                              END
                              ELSE CASE WHEN (0.06951680315093117::DOUBLE) * x::DOUBLE + (-0.9975807807288966::DOUBLE) * y::DOUBLE >= (-2.1947424546543792::DOUBLE)
                                THEN CASE WHEN (0.6579596411028803::DOUBLE) * x::DOUBLE + (0.7530531924636992::DOUBLE) * y::DOUBLE >= (1.8805381744594456::DOUBLE)
                                  THEN 48
                                  ELSE 25
                                END
                                ELSE CASE WHEN (0.9227885917267585::DOUBLE) * x::DOUBLE + (-0.3853066505771026::DOUBLE) * y::DOUBLE >= (-0.565498221506961::DOUBLE)
                                  THEN 48
                                  ELSE 21
                                END
                              END
                            END
                            ELSE CASE WHEN (0.8897745494250667::DOUBLE) * x::DOUBLE + (-0.4564003190132754::DOUBLE) * y::DOUBLE >= (-1.122928655546403::DOUBLE)
                              THEN CASE WHEN (0.05292191177855554::DOUBLE) * x::DOUBLE + (-0.9985986537411828::DOUBLE) * y::DOUBLE >= (-3.017926501669423::DOUBLE)
                                THEN CASE WHEN (0.9909597100602979::DOUBLE) * x::DOUBLE + (-0.1341598041039503::DOUBLE) * y::DOUBLE >= (0.21992592266994743::DOUBLE)
                                  THEN 69
                                  ELSE 34
                                END
                                ELSE 32
                              END
                              ELSE CASE WHEN (0.040655518363124456::DOUBLE) * x::DOUBLE + (-0.9991732226329054::DOUBLE) * y::DOUBLE >= (-3.16355071388835::DOUBLE)
                                THEN CASE WHEN (0.8217447161827416::DOUBLE) * x::DOUBLE + (0.5698557900256392::DOUBLE) * y::DOUBLE >= (1.974542331547559::DOUBLE)
                                  THEN 32
                                  ELSE 8
                                END
                                ELSE CASE WHEN (0.9306870617542427::DOUBLE) * x::DOUBLE + (-0.3658163379118743::DOUBLE) * y::DOUBLE >= (-0.9736703401915787::DOUBLE)
                                  THEN 32
                                  ELSE 5
                                END
                              END
                            END
                          END
                        END
                      END
                    END
                    ELSE CASE WHEN (0.9271353003377281::DOUBLE) * x::DOUBLE + (-0.3747267469339102::DOUBLE) * y::DOUBLE >= (-0.9739074172389743::DOUBLE)
                      THEN CASE WHEN (0.3195982694177172::DOUBLE) * x::DOUBLE + (0.9475531363386437::DOUBLE) * y::DOUBLE >= (4.2267377370261::DOUBLE)
                        THEN CASE WHEN (0.9797665148192669::DOUBLE) * x::DOUBLE + (-0.20014388933691482::DOUBLE) * y::DOUBLE >= (0.11705547172641895::DOUBLE)
                          THEN CASE WHEN (0.8953934098258755::DOUBLE) * x::DOUBLE + (-0.44527591630402824::DOUBLE) * y::DOUBLE >= (-0.842843534851561::DOUBLE)
                            THEN CASE WHEN (0.7543093969416215::DOUBLE) * x::DOUBLE + (0.6565191038237711::DOUBLE) * y::DOUBLE >= (3.7116248600570803::DOUBLE)
                              THEN CASE WHEN (0.8702495359518715::DOUBLE) * x::DOUBLE + (-0.4926111500722982::DOUBLE) * y::DOUBLE >= (-0.9569927176602206::DOUBLE)
                                THEN CASE WHEN (0.032342984033829014::DOUBLE) * x::DOUBLE + (0.9994768288378613::DOUBLE) * y::DOUBLE >= (4.382760597024387::DOUBLE)
                                  THEN 115
                                  ELSE CASE WHEN (0.9807810560422892::DOUBLE) * x::DOUBLE + (-0.19511155811117897::DOUBLE) * y::DOUBLE >= (0.7370548463429548::DOUBLE)
                                    THEN 137
                                    ELSE 114
                                  END
                                END
                                ELSE CASE WHEN (0.4648222194843447::DOUBLE) * x::DOUBLE + (0.8854040344801054::DOUBLE) * y::DOUBLE >= (4.532251474229664::DOUBLE)
                                  THEN CASE WHEN (0.7707793074246193::DOUBLE) * x::DOUBLE + (-0.6371022361018868::DOUBLE) * y::DOUBLE >= (-1.8038756350921876::DOUBLE)
                                    THEN 115
                                    ELSE 105
                                  END
                                  ELSE CASE WHEN (0.9095403463588592::DOUBLE) * x::DOUBLE + (0.4156156377536902::DOUBLE) * y::DOUBLE >= (3.039073074602719::DOUBLE)
                                    THEN 115
                                    ELSE 98
                                  END
                                END
                              END
                              ELSE CASE WHEN (0.7790144180899186::DOUBLE) * x::DOUBLE + (0.6270060098659546::DOUBLE) * y::DOUBLE >= (3.5718471412294805::DOUBLE)
                                THEN CASE WHEN (0.020567942954060735::DOUBLE) * x::DOUBLE + (-0.9997884574862017::DOUBLE) * y::DOUBLE >= (-4.164088826420248::DOUBLE)
                                  THEN 99
                                  ELSE 98
                                END
                                ELSE CASE WHEN (0.6458301607563725::DOUBLE) * x::DOUBLE + (-0.7634811087757171::DOUBLE) * y::DOUBLE >= (-2.415698967657589::DOUBLE)
                                  THEN 99
                                  ELSE 88
                                END
                              END
                            END
                            ELSE CASE WHEN (0.2954597716768143::DOUBLE) * x::DOUBLE + (-0.9553551817626179::DOUBLE) * y::DOUBLE >= (-3.8385084435569614::DOUBLE)
                              THEN CASE WHEN (0.9545040018550707::DOUBLE) * x::DOUBLE + (0.29819810603465463::DOUBLE) * y::DOUBLE >= (2.1831984670210156::DOUBLE)
                                THEN CASE WHEN (0.7790144180899186::DOUBLE) * x::DOUBLE + (0.6270060098659546::DOUBLE) * y::DOUBLE >= (3.5718471412294805::DOUBLE)
                                  THEN 98
                                  ELSE 88
                                END
                                ELSE 76
                              END
                              ELSE CASE WHEN (0.6705255099219026::DOUBLE) * x::DOUBLE + (0.7418864741616283::DOUBLE) * y::DOUBLE >= (4.042877173408279::DOUBLE)
                                THEN CASE WHEN (0.4649659915552743::DOUBLE) * x::DOUBLE + (-0.8853285416708425::DOUBLE) * y::DOUBLE >= (-3.4092626063792633::DOUBLE)
                                  THEN CASE WHEN (0.4648222194843447::DOUBLE) * x::DOUBLE + (0.8854040344801054::DOUBLE) * y::DOUBLE >= (4.532251474229664::DOUBLE)
                                    THEN 105
                                    ELSE 98
                                  END
                                  ELSE CASE WHEN (0.9990597079676131::DOUBLE) * x::DOUBLE + (-0.043355506174736144::DOUBLE) * y::DOUBLE >= (1.0118422063239856::DOUBLE)
                                    THEN 105
                                    ELSE 91
                                  END
                                END
                                ELSE CASE WHEN (0.919213553163676::DOUBLE) * x::DOUBLE + (-0.3937593728156952::DOUBLE) * y::DOUBLE >= (-0.7193343326182895::DOUBLE)
                                  THEN 98
                                  ELSE 85
                                END
                              END
                            END
                          END
                          ELSE CASE WHEN (0.06534094396482042::DOUBLE) * x::DOUBLE + (-0.9978629971302605::DOUBLE) * y::DOUBLE >= (-4.326920876991757::DOUBLE)
                            THEN CASE WHEN (0.9865904588860714::DOUBLE) * x::DOUBLE + (-0.16321539889045716::DOUBLE) * y::DOUBLE >= (0.11045881750678366::DOUBLE)
                              THEN CASE WHEN (0.2337991098334709::DOUBLE) * x::DOUBLE + (-0.972284925441651::DOUBLE) * y::DOUBLE >= (-3.918574932611964::DOUBLE)
                                THEN CASE WHEN (0.9545040018550707::DOUBLE) * x::DOUBLE + (0.29819810603465463::DOUBLE) * y::DOUBLE >= (2.1831984670210156::DOUBLE)
                                  THEN 88
                                  ELSE 76
                                END
                                ELSE CASE WHEN (0.6867402495259469::DOUBLE) * x::DOUBLE + (0.7269029025124608::DOUBLE) * y::DOUBLE >= (3.817364261467986::DOUBLE)
                                  THEN CASE WHEN (0.2954597716768143::DOUBLE) * x::DOUBLE + (-0.9553551817626179::DOUBLE) * y::DOUBLE >= (-3.8385084435569614::DOUBLE)
                                    THEN 88
                                    ELSE 85
                                  END
                                  ELSE CASE WHEN (0.9141222902244456::DOUBLE) * x::DOUBLE + (-0.40543857551399143::DOUBLE) * y::DOUBLE >= (-0.8530752208866444::DOUBLE)
                                    THEN 88
                                    ELSE 73
                                  END
                                END
                              END
                              ELSE CASE WHEN (0.11052993064540015::DOUBLE) * x::DOUBLE + (-0.9938727959007243::DOUBLE) * y::DOUBLE >= (-4.192897916067634::DOUBLE)
                                THEN CASE WHEN (0.80374713515947::DOUBLE) * x::DOUBLE + (0.5949710436003963::DOUBLE) * y::DOUBLE >= (3.165730679903068::DOUBLE)
                                  THEN 73
                                  ELSE 60
                                END
                                ELSE CASE WHEN (0.8983186178045895::DOUBLE) * x::DOUBLE + (-0.4393445810587083::DOUBLE) * y::DOUBLE >= (-1.2132041269299112::DOUBLE)
                                  THEN 73
                                  ELSE 57
                                END
                              END
                            END
                            ELSE CASE WHEN (0.9510787332899715::DOUBLE) * x::DOUBLE + (-0.30894860913029376::DOUBLE) * y::DOUBLE >= (-0.523071301526275::DOUBLE)
                              THEN CASE WHEN (0.9787114012316456::DOUBLE) * x::DOUBLE + (-0.2052413045641378::DOUBLE) * y::DOUBLE >= (-0.015340957446467574::DOUBLE)
                                THEN CASE WHEN (0.6705255099219026::DOUBLE) * x::DOUBLE + (0.7418864741616283::DOUBLE) * y::DOUBLE >= (4.042877173408279::DOUBLE)
                                  THEN 91
                                  ELSE 85
                                END
                                ELSE CASE WHEN (0.9366234706692388::DOUBLE) * x::DOUBLE + (0.3503376573985579::DOUBLE) * y::DOUBLE >= (2.496596525562593::DOUBLE)
                                  THEN 91
                                  ELSE 72
                                END
                              END
                              ELSE CASE WHEN (0.0861467129730451::DOUBLE) * x::DOUBLE + (0.9962824618771224::DOUBLE) * y::DOUBLE >= (4.499649878415662::DOUBLE)
                                THEN CASE WHEN (0.549835725261391::DOUBLE) * x::DOUBLE + (0.8352728148493042::DOUBLE) * y::DOUBLE >= (4.249271015126596::DOUBLE)
                                  THEN CASE WHEN (0.25702044558914194::DOUBLE) * x::DOUBLE + (-0.9664059657044544::DOUBLE) * y::DOUBLE >= (-4.203576643813611::DOUBLE)
                                    THEN 72
                                    ELSE 66
                                  END
                                  ELSE CASE WHEN (0.9541593058978485::DOUBLE) * x::DOUBLE + (-0.29929921311045243::DOUBLE) * y::DOUBLE >= (-0.6039141685375106::DOUBLE)
                                    THEN 72
                                    ELSE 59
                                  END
                                END
                                ELSE CASE WHEN (0.8856995926912119::DOUBLE) * x::DOUBLE + (0.46425879798515507::DOUBLE) * y::DOUBLE >= (2.7420276805591803::DOUBLE)
                                  THEN 72
                                  ELSE 57
                                END
                              END
                            END
                          END
                        END
                        ELSE CASE WHEN (0.3255104822162571::DOUBLE) * x::DOUBLE + (0.9455384317770167::DOUBLE) * y::DOUBLE >= (4.006217755734214::DOUBLE)
                          THEN CASE WHEN (0.48587484400149605::DOUBLE) * x::DOUBLE + (-0.8740283954005853::DOUBLE) * y::DOUBLE >= (-3.118911247007445::DOUBLE)
                            THEN CASE WHEN (0.9957014369148143::DOUBLE) * x::DOUBLE + (0.09262099397962575::DOUBLE) * y::DOUBLE >= (1.4700824102911265::DOUBLE)
                              THEN 99
                              ELSE CASE WHEN (0.5080541284835206::DOUBLE) * x::DOUBLE + (-0.8613251433290743::DOUBLE) * y::DOUBLE >= (-3.022289862130142::DOUBLE)
                                THEN CASE WHEN (0.7428335839629447::DOUBLE) * x::DOUBLE + (0.6694761134923087::DOUBLE) * y::DOUBLE >= (3.336747211305515::DOUBLE)
                                  THEN 83
                                  ELSE 74
                                END
                                ELSE CASE WHEN (0.9552412526524072::DOUBLE) * x::DOUBLE + (-0.2958279047538618::DOUBLE) * y::DOUBLE >= (-0.3602774006992052::DOUBLE)
                                  THEN 83
                                  ELSE 64
                                END
                              END
                            END
                            ELSE CASE WHEN (0.3962577911280129::DOUBLE) * x::DOUBLE + (0.9181392938821146::DOUBLE) * y::DOUBLE >= (4.037370534601995::DOUBLE)
                              THEN CASE WHEN (0.3718428362931893::DOUBLE) * x::DOUBLE + (-0.9282956991699556::DOUBLE) * y::DOUBLE >= (-3.5677312497435394::DOUBLE)
                                THEN CASE WHEN (0.8059388738256047::DOUBLE) * x::DOUBLE + (0.5919987598439003::DOUBLE) * y::DOUBLE >= (3.110574932602831::DOUBLE)
                                  THEN 76
                                  ELSE 64
                                END
                                ELSE CASE WHEN (0.9865904588860714::DOUBLE) * x::DOUBLE + (-0.16321539889045716::DOUBLE) * y::DOUBLE >= (0.11045881750678366::DOUBLE)
                                  THEN 76
                                  ELSE 60
                                END
                              END
                              ELSE CASE WHEN (0.8940069894175703::DOUBLE) * x::DOUBLE + (0.44805301346217097::DOUBLE) * y::DOUBLE >= (2.4367050658513634::DOUBLE)
                                THEN 64
                                ELSE 55
                              END
                            END
                          END
                          ELSE CASE WHEN (0.9976240340912225::DOUBLE) * x::DOUBLE + (0.06889329868394664::DOUBLE) * y::DOUBLE >= (1.0510032738991963::DOUBLE)
                            THEN 74
                            ELSE CASE WHEN (0.6804508631444406::DOUBLE) * x::DOUBLE + (-0.7327937109760058::DOUBLE) * y::DOUBLE >= (-2.476005077743431::DOUBLE)
                              THEN CASE WHEN (0.21285809390254745::DOUBLE) * x::DOUBLE + (0.9770831243349638::DOUBLE) * y::DOUBLE >= (3.9277013027835816::DOUBLE)
                                THEN CASE WHEN (0.4986378645037804::DOUBLE) * x::DOUBLE + (-0.8668104060768478::DOUBLE) * y::DOUBLE >= (-3.0926456857220996::DOUBLE)
                                  THEN 58
                                  ELSE 55
                                END
                                ELSE CASE WHEN (0.6929478276330069::DOUBLE) * x::DOUBLE + (0.7209877309487981::DOUBLE) * y::DOUBLE >= (3.2036318869819462::DOUBLE)
                                  THEN 58
                                  ELSE 49
                                END
                              END
                              ELSE CASE WHEN (0.9262392573222611::DOUBLE) * x::DOUBLE + (0.37693611951510586::DOUBLE) * y::DOUBLE >= (1.9871674542244893::DOUBLE)
                                THEN 55
                                ELSE 36
                              END
                            END
                          END
                        END
                      END
                      ELSE CASE WHEN (0.7174110095218668::DOUBLE) * x::DOUBLE + (0.6966501585565138::DOUBLE) * y::DOUBLE >= (3.2122860639853044::DOUBLE)
                        THEN CASE WHEN (0.07764965842871087::DOUBLE) * x::DOUBLE + (-0.9969807072084718::DOUBLE) * y::DOUBLE >= (-4.423722146131285::DOUBLE)
                          THEN CASE WHEN (0.11052993064540015::DOUBLE) * x::DOUBLE + (-0.9938727959007243::DOUBLE) * y::DOUBLE >= (-4.192897916067634::DOUBLE)
                            THEN CASE WHEN (0.7779711941325049::DOUBLE) * x::DOUBLE + (-0.6282999451695379::DOUBLE) * y::DOUBLE >= (-2.1734087918356844::DOUBLE)
                              THEN CASE WHEN (0.7512455479601964::DOUBLE) * x::DOUBLE + (-0.6600228228402287::DOUBLE) * y::DOUBLE >= (-2.2617729597143703::DOUBLE)
                                THEN CASE WHEN (0.3962577911280129::DOUBLE) * x::DOUBLE + (0.9181392938821146::DOUBLE) * y::DOUBLE >= (4.037370534601995::DOUBLE)
                                  THEN 60
                                  ELSE 55
                                END
                                ELSE CASE WHEN (0.9481560929680716::DOUBLE) * x::DOUBLE + (0.3178050084053454::DOUBLE) * y::DOUBLE >= (1.8988951077763871::DOUBLE)
                                  THEN 60
                                  ELSE 41
                                END
                              END
                              ELSE CASE WHEN (0.6230487230291146::DOUBLE) * x::DOUBLE + (-0.7821830276423731::DOUBLE) * y::DOUBLE >= (-3.0319707003155143::DOUBLE)
                                THEN CASE WHEN (0.38740372875455004::DOUBLE) * x::DOUBLE + (0.9219101642497881::DOUBLE) * y::DOUBLE >= (4.100204680293092::DOUBLE)
                                  THEN 47
                                  ELSE 41
                                END
                                ELSE CASE WHEN (0.9990446199159392::DOUBLE) * x::DOUBLE + (0.04370180107291349::DOUBLE) * y::DOUBLE >= (0.6547481073083965::DOUBLE)
                                  THEN 47
                                  ELSE 30
                                END
                              END
                            END
                            ELSE CASE WHEN (0.9990446199159392::DOUBLE) * x::DOUBLE + (0.04370180107291349::DOUBLE) * y::DOUBLE >= (0.6547481073083965::DOUBLE)
                              THEN CASE WHEN (0.677530364973976::DOUBLE) * x::DOUBLE + (-0.7354948025229213::DOUBLE) * y::DOUBLE >= (-2.9289509115728753::DOUBLE)
                                THEN CASE WHEN (0.8359140213896205::DOUBLE) * x::DOUBLE + (0.5488604092519636::DOUBLE) * y::DOUBLE >= (2.9200148013234553::DOUBLE)
                                  THEN CASE WHEN (0.0861467129730451::DOUBLE) * x::DOUBLE + (0.9962824618771224::DOUBLE) * y::DOUBLE >= (4.499649878415662::DOUBLE)
                                    THEN 59
                                    ELSE 57
                                  END
                                  ELSE CASE WHEN (0.5325700498732534::DOUBLE) * x::DOUBLE + (0.8463859296904697::DOUBLE) * y::DOUBLE >= (4.07966472847094::DOUBLE)
                                    THEN 59
                                    ELSE 47
                                  END
                                END
                                ELSE 33
                              END
                              ELSE CASE WHEN (0.8138274083093224::DOUBLE) * x::DOUBLE + (-0.5811066593014843::DOUBLE) * y::DOUBLE >= (-2.357921706367009::DOUBLE)
                                THEN CASE WHEN (0.09051409467690998::DOUBLE) * x::DOUBLE + (0.9958951745363663::DOUBLE) * y::DOUBLE >= (4.432140561598654::DOUBLE)
                                  THEN 33
                                  ELSE 30
                                END
                                ELSE CASE WHEN (0.9803811784347438::DOUBLE) * x::DOUBLE + (0.1971109965752877::DOUBLE) * y::DOUBLE >= (1.1307012380167092::DOUBLE)
                                  THEN 33
                                  ELSE 9
                                END
                              END
                            END
                          END
                          ELSE CASE WHEN (0.9074381936764015::DOUBLE) * x::DOUBLE + (-0.42018558359052427::DOUBLE) * y::DOUBLE >= (-1.6355311938397206::DOUBLE)
                            THEN CASE WHEN (0.549835725261391::DOUBLE) * x::DOUBLE + (0.8352728148493042::DOUBLE) * y::DOUBLE >= (4.249271015126596::DOUBLE)
                              THEN CASE WHEN (0.28533469249425136::DOUBLE) * x::DOUBLE + (0.9584279384800983::DOUBLE) * y::DOUBLE >= (4.750359692118528::DOUBLE)
                                THEN CASE WHEN (0.5632608420673447::DOUBLE) * x::DOUBLE + (-0.8262791439904469::DOUBLE) * y::DOUBLE >= (-3.5547595246508084::DOUBLE)
                                  THEN 66
                                  ELSE 54
                                END
                                ELSE CASE WHEN (0.9977542378675801::DOUBLE) * x::DOUBLE + (0.0669811974906709::DOUBLE) * y::DOUBLE >= (0.9852083617764682::DOUBLE)
                                  THEN 66
                                  ELSE 46
                                END
                              END
                              ELSE CASE WHEN (0.8228164754419556::DOUBLE) * x::DOUBLE + (0.5683071772741198::DOUBLE) * y::DOUBLE >= (2.9893017483795163::DOUBLE)
                                THEN CASE WHEN (0.7723848375915917::DOUBLE) * x::DOUBLE + (-0.6351548336103651::DOUBLE) * y::DOUBLE >= (-2.426717925053529::DOUBLE)
                                  THEN 59
                                  ELSE 46
                                END
                                ELSE 33
                              END
                            END
                            ELSE CASE WHEN (0.06701101254768328::DOUBLE) * x::DOUBLE + (0.9977522358768904::DOUBLE) * y::DOUBLE >= (4.798768062531064::DOUBLE)
                              THEN CASE WHEN (0.17861081771134646::DOUBLE) * x::DOUBLE + (-0.983919801506446::DOUBLE) * y::DOUBLE >= (-4.848145706776263::DOUBLE)
                                THEN CASE WHEN (0.9631229352414196::DOUBLE) * x::DOUBLE + (0.2690617245390959::DOUBLE) * y::DOUBLE >= (1.7159218289321037::DOUBLE)
                                  THEN 54
                                  ELSE 22
                                END
                                ELSE 16
                              END
                              ELSE CASE WHEN (0.3013768246023904::DOUBLE) * x::DOUBLE + (0.9535051177589873::DOUBLE) * y::DOUBLE >= (4.473536271726754::DOUBLE)
                                THEN CASE WHEN (0.5040248109352665::DOUBLE) * x::DOUBLE + (-0.8636891743918462::DOUBLE) * y::DOUBLE >= (-3.877869047716087::DOUBLE)
                                  THEN 33
                                  ELSE 22
                                END
                                ELSE CASE WHEN (0.9803811784347438::DOUBLE) * x::DOUBLE + (0.1971109965752877::DOUBLE) * y::DOUBLE >= (1.1307012380167092::DOUBLE)
                                  THEN 33
                                  ELSE 9
                                END
                              END
                            END
                          END
                        END
                        ELSE CASE WHEN (0.9502052391128611::DOUBLE) * x::DOUBLE + (0.31162478008411115::DOUBLE) * y::DOUBLE >= (1.4508893620868935::DOUBLE)
                          THEN CASE WHEN (0.6230487230291146::DOUBLE) * x::DOUBLE + (-0.7821830276423731::DOUBLE) * y::DOUBLE >= (-3.0319707003155143::DOUBLE)
                            THEN CASE WHEN (0.2908026182730524::DOUBLE) * x::DOUBLE + (0.9567830669517189::DOUBLE) * y::DOUBLE >= (3.902766434983451::DOUBLE)
                              THEN CASE WHEN (0.636735601382923::DOUBLE) * x::DOUBLE + (-0.7710822095804878::DOUBLE) * y::DOUBLE >= (-2.863656124636187::DOUBLE)
                                THEN CASE WHEN (0.3290741999006224::DOUBLE) * x::DOUBLE + (0.9443040670037195::DOUBLE) * y::DOUBLE >= (3.956379663271454::DOUBLE)
                                  THEN CASE WHEN (0.7512455479601964::DOUBLE) * x::DOUBLE + (-0.6600228228402287::DOUBLE) * y::DOUBLE >= (-2.2617729597143703::DOUBLE)
                                    THEN 55
                                    ELSE 41
                                  END
                                  ELSE CASE WHEN (0.9262392573222611::DOUBLE) * x::DOUBLE + (0.37693611951510586::DOUBLE) * y::DOUBLE >= (1.9871674542244893::DOUBLE)
                                    THEN 55
                                    ELSE 36
                                  END
                                END
                                ELSE CASE WHEN (0.985204392749393::DOUBLE) * x::DOUBLE + (0.17138350126922902::DOUBLE) * y::DOUBLE >= (1.093141462469457::DOUBLE)
                                  THEN 41
                                  ELSE 28
                                END
                              END
                              ELSE CASE WHEN (0.5725645710551673::DOUBLE) * x::DOUBLE + (-0.819859629432022::DOUBLE) * y::DOUBLE >= (-2.9440979792446265::DOUBLE)
                                THEN CASE WHEN (0.22457246481303425::DOUBLE) * x::DOUBLE + (0.9744573916020128::DOUBLE) * y::DOUBLE >= (3.8076364499607505::DOUBLE)
                                  THEN 36
                                  ELSE 31
                                END
                                ELSE CASE WHEN (0.9934911770948938::DOUBLE) * x::DOUBLE + (0.11390909109725335::DOUBLE) * y::DOUBLE >= (0.7746453038897789::DOUBLE)
                                  THEN 36
                                  ELSE 23
                                END
                              END
                            END
                            ELSE CASE WHEN (0.14620632892773266::DOUBLE) * x::DOUBLE + (-0.9892541176975084::DOUBLE) * y::DOUBLE >= (-4.289655219111596::DOUBLE)
                              THEN CASE WHEN (0.6937048442033024::DOUBLE) * x::DOUBLE + (-0.7202593901705635::DOUBLE) * y::DOUBLE >= (-2.8455933009165895::DOUBLE)
                                THEN CASE WHEN (0.3021938291069282::DOUBLE) * x::DOUBLE + (0.953246499940961::DOUBLE) * y::DOUBLE >= (4.100852101849341::DOUBLE)
                                  THEN 30
                                  ELSE 28
                                END
                                ELSE CASE WHEN (0.9476481983925298::DOUBLE) * x::DOUBLE + (0.31931628847177945::DOUBLE) * y::DOUBLE >= (1.6059005600654914::DOUBLE)
                                  THEN 30
                                  ELSE 14
                                END
                              END
                              ELSE CASE WHEN (0.8138274083093224::DOUBLE) * x::DOUBLE + (-0.5811066593014843::DOUBLE) * y::DOUBLE >= (-2.357921706367009::DOUBLE)
                                THEN 30
                                ELSE 9
                              END
                            END
                          END
                          ELSE CASE WHEN (0.09916407493943458::DOUBLE) * x::DOUBLE + (-0.9950710960737461::DOUBLE) * y::DOUBLE >= (-4.011094587730414::DOUBLE)
                            THEN CASE WHEN (0.11642605268281063::DOUBLE) * x::DOUBLE + (-0.9931993627951538::DOUBLE) * y::DOUBLE >= (-3.807191248178231::DOUBLE)
                              THEN CASE WHEN (0.7672654311661593::DOUBLE) * x::DOUBLE + (0.641329679757149::DOUBLE) * y::DOUBLE >= (2.5869724832837004::DOUBLE)
                                THEN 23
                                ELSE 3
                              END
                              ELSE CASE WHEN (0.21858976766923408::DOUBLE) * x::DOUBLE + (0.9758168442234998::DOUBLE) * y::DOUBLE >= (3.889607524361241::DOUBLE)
                                THEN CASE WHEN (0.7336447361013734::DOUBLE) * x::DOUBLE + (-0.6795332230220582::DOUBLE) * y::DOUBLE >= (-2.5742990736046365::DOUBLE)
                                  THEN 23
                                  ELSE 6
                                END
                                ELSE CASE WHEN (0.9999498153739732::DOUBLE) * x::DOUBLE + (0.010018319896913878::DOUBLE) * y::DOUBLE >= (0.19121262268839526::DOUBLE)
                                  THEN 23
                                  ELSE 2
                                END
                              END
                            END
                            ELSE CASE WHEN (0.3664223422133289::DOUBLE) * x::DOUBLE + (-0.9304486375544316::DOUBLE) * y::DOUBLE >= (-3.788624359085946::DOUBLE)
                              THEN CASE WHEN (0.25594809704894766::DOUBLE) * x::DOUBLE + (0.9666905252546042::DOUBLE) * y::DOUBLE >= (4.027784980502112::DOUBLE)
                                THEN 14
                                ELSE 6
                              END
                              ELSE CASE WHEN (0.23372440041036954::DOUBLE) * x::DOUBLE + (0.9723028873004612::DOUBLE) * y::DOUBLE >= (4.222214052493735::DOUBLE)
                                THEN CASE WHEN (0.14620632892773266::DOUBLE) * x::DOUBLE + (-0.9892541176975084::DOUBLE) * y::DOUBLE >= (-4.289655219111596::DOUBLE)
                                  THEN 14
                                  ELSE 9
                                END
                                ELSE CASE WHEN (0.8544090544943495::DOUBLE) * x::DOUBLE + (0.5196009695892337::DOUBLE) * y::DOUBLE >= (2.2680813062256173::DOUBLE)
                                  THEN 14
                                  ELSE 0
                                END
                              END
                            END
                          END
                        END
                      END
                    END
                  END
                END
              END
            END
          END
          ELSE NULL::INTEGER
        END
        ELSE NULL::INTEGER
      END
      ELSE NULL::INTEGER
    END
    ELSE NULL::INTEGER
  END
  ELSE NULL::INTEGER
END;
